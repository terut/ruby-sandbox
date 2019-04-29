Bundler.require(:default)

require "minitest/autorun"
require "yaml"

class TestSearch < Minitest::Test
  @@expected = {
    mario: [
      { keyword: "", result: ["myID1", "myID3", "myID4"] },
      { keyword: "mobile", result: ["myID1", "myID4"] },
      { keyword: "secret", result: [] }
    ],
    luige: [
      { keyword: "", result: ["myID1", "myID2", "myID4"] },
      { keyword: "apps", result: ["myID2", "myID4"]},
      { keyword: "secret", result: [] }
    ],
    pikachu: [
      { keyword: "", result: ["myID5", "myID6", "myID7", "myID8"] },
      { keyword: "algolia", result: ["myID5", "myID6"]},
      { keyword: "mobile", result: [] }
    ]
  }

  attr_reader :username, :index

  def self.expected
    @@expected
  end

  def setup
    @username = ARGV[0].to_sym
    users = YAML.load_file("users.yaml")

    Algolia.init(application_id: ENV["APP_ID"],
             api_key: users[username][:secured_api_key])

    @index = Algolia::Index.new("posts")
  end

  def test_result
    self.class.expected[username].each do |target|
      result = index.search(target[:keyword]).dig("hits").map{|r| r["objectID"]}
      assert_equal target[:result].to_set, result.to_set
    end
  end
end
