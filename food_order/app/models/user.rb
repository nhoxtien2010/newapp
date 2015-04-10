class User < ActiveRecord::Base
  belongs_to :role
  before_create :default_role


  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  

   private
   def default_role
    self.role = Role.where(:name => 'user').first
  end
end
