class Post < ApplicationRecord
  before_save { title.downcase }
  validates :title, presence: true, length: { maximum: 50 } , uniqueness: { case_sensitive: false }
  validates :body, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

end
