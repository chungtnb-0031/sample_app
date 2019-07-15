class Micropost < ApplicationRecord
  belongs_to :user
  scope :list_new_feed, ->{order(created_at: :desc)}
  scope :new_feed_by_id, ->(id){where(user_id: id)}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.content_max_length}
  validate  :picture_size

  private
  def picture_size
    errors.add(:picture, I18n.t(".error")) if picture.size > Settings.picture_size.megabytes
  end
end
