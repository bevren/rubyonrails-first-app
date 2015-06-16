class User < ActiveRecord::Base
  
  validates :name , presence: true, length: {minimum: 6, maximum:  50}
  validates :email , presence: true, length: {maximum: 50}
  
end
