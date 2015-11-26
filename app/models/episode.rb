class Episode < ActiveRecord::Base
  belongs_to :podcast

  has_attached_file :episode_thumbnail, styles: { large: "1000x1000#", medium: "550x550#" }
  validates_attachment_content_type :episode_thumbnail, content_type: /\Aimage\/.*\Z/

  validates :title, :description, presence: true
  validates :title, uniqueness: true
  validates :title, length: {minimum: 5}
  validates :description, length: {minimum: 30}
end
