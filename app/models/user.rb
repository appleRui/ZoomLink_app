class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :authentication_keys => [:login]

         has_many :lists, dependent: :destroy
         validates :name, presence: true
         attr_accessor :login

         def self.find_first_by_auth_conditions(warden_conditions)
          conditions = warden_conditions.dup
          if login = conditions.delete(:login)
            where(conditions).where(["name = :value OR lower(email) = lower(:value)", { :value => login }]).first
          else
            where(conditions).first
          end
        end

end
