class Comment < ApplicationRecord
  belongs_to :author,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: 'User'
    
  belongs_to :post
  
  belongs_to :parent_comment, optional: true,
  primary_key: :id, 
  foreign_key: :parent_comment_id, 
  class_name: :Comment 
  
  has_many :child_comments, 
  primary_key: :id,
  foreign_key: :parent_comment_id, 
  class_name: :Comment 
  
end
