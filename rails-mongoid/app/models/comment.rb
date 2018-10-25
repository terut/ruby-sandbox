class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String
  field :article_id, type: Integer

  belongs_to :article, inverse_of: :comments
end
