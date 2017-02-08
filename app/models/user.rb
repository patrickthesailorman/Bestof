class User < ApplicationRecord
  rolify :before_add => :before_add_method
  resourcify
  def before_add_method(role)
    #do something before it gets added
  end
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :posts
end
