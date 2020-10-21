class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :body
    validates :impression
  end
  
end
