class User < ApplicationRecord
  has_many :reviews
  extend DisplayList
  extend SwitchFlg
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_liker
  
  scope :search_information, -> (keyword) { 
     where("id LIKE :keyword OR email LIKE :keyword", keyword: "%#{keyword}%")
   }
end
