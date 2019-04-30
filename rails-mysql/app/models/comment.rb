class Comment < ActiveRecord::Base
  belongs_to :article

  scope :by_now, -> { where("created_at < ?", Time.zone.now) }
end
