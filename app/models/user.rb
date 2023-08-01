class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
          devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

  enum role: { member: 0, admin: 1, author: 2 }
end
