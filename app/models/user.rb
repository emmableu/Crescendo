# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#  first_name             :string
#  last_name              :string
#  student_class          :string
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable,
         :database_authenticatable,
         :recoverable, :rememberable, authentication_keys: [:username]
          # :validatable
  # attr_writer :login
  #
  # def login
  #   @login || self.username || self.email
  # end
  attr_accessor :skip_password_validation
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  def email_required?
    false
  end

  def email_changed?
    false
  end

  protected

  # def password_required?
  #   return false if skip_password_validation
  #   super
  # end
  #
  # def self.find_for_database_authentication warden_conditions
  #   conditions = warden_conditions.dup
  #   login = conditions.delete(:login)
  #   where(conditions).where(["username = :value", {value: login.to_s}])
  # end


  def self.create_with_password(attr={})
    generated_password = "123456"
    self.create(attr.merge(password: generated_password, password_confirmation: generated_password))
  end
end
