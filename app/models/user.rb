class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_default_role

  private

  def assign_default_role
    add_role(:igrac) if self.role_flag == "igrac"
    add_role(:admin) if self.role_flag == "administrator"
  end

end
