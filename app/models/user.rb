class User < ApplicationRecord
  #before_save :downcase_email

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
  # private
  # def downcase_email
  #   self.email = email.downcase
  # end
end
