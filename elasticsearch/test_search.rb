Bundler.require(:default)

require "minitest/autorun"
require "yaml"

class TestSearch < Minitest::Test
  @@expected = {
    mario: [
      { keyword: "行動", result: ["myID3", "myID4"] },
      { keyword: "未来", result: ["myID1"] },
      { keyword: "secret", result: [] }
    ],
    luige: [
      { keyword: "行動", result: ["myID2", "myID4"] },
      { keyword: "正義", result: ["myID2"]},
      { keyword: "secret", result: [] }
    ],
    pikachu: [
      { keyword: "覚悟", result: ["myID5", "myID6", "myID7", "myID8"] },
      { keyword: "道", result: ["myID5", "myID6"]},
      { keyword: "secret", result: [] }
    ]
  }

  attr_reader :username, :user, :client

  def self.expected
    @@expected
  end

  def setup
    @username = ARGV[0].to_sym

    users = YAML.load_file("users.yaml")
    @user = users[@username]

    @client = Elasticsearch::Client.new url: ENV["URL"], http: { user: ENV["USERNAME"], password: ENV["PASSWORD"] }
  end

  def test_result
    self.class.expected[username].each do |target|
      params = {
        query: {
          bool: {
            must: {
              match: {
                post: target[:keyword]
              }
            },
            filter: {
              bool: {
                must: [
                  {
                    terms: {
                      organization: [user[:organization]]
                    }
                  },
                  {
                    terms: {
                      viewable_by: user[:groups] + [0]
                    }
                  }
                ]
              }
            }
          }
        }
      }

      result = client.search(index: "posts", body: params).dig("hits").dig("hits").map{|r| r["_source"]["objectID"]}
      assert_equal target[:result].to_set, result.to_set
    end
  end
end
