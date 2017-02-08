class User < ApplicationRecord
  rolify


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :posts, dependent: :destroy
   validates :username, presence: true
   validates :password, presence: true,
              length: { minimum: 6 }
   validates :email, presence: true
   acts_as_voter
   rolify :before_add => :before_add_method
   after_create :assign_default_role

   def before_add_method(role)
     #do something before it gets added
   end
   def assign_default_role
     self.add_role(:newuser) if self.roles.blank?
   end
end
