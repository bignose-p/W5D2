# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  
  has_many :post_subs, inverse_of: :post
  
  has_many :comments
  
  has_many :subs, 
  through: :post_subs, 
  source: :sub
  
  belongs_to :user 

end
