class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String

  has_many :comments,  inverse_of: :article
end
