class Post < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :title
    validates :body
    validates :impression
  end
  
end
