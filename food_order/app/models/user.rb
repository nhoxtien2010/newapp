class User < ActiveRecord::Base

  after_initialize :init
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  

    def init
      self.permission  ||= 1           #will set the default permission is user
      
    end
end
