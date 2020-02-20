class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes,    dependent: :destroy
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, length: {maximum: 140}
  validates :picture, presence: true
  validate  :picture_size
  
  #すでにいいねしているかを確認
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
