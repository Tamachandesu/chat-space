class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader

  validates :text, presence: true

  def to_json
    { nickname: user.nickname,
      created_at: created_at,
      text: text,
      image: image.url }
  end
end
