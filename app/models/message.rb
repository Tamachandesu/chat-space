class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader

  validates :text, presence: true

  def to_json
    { name: user.nickname,
      created_at: created_at,
      body: body,
      image: image.url }
  end
end
