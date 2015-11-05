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
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  admin                  :boolean          default(FALSE)
#  provider               :string
#  uid                    :string
#  organization_id        :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_name                  (name) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  before_create :become_an_admin!

  belongs_to :organization
  has_many :orders, dependent: :destroy

  devise :database_authenticatable, :registerable,
:recoverable, :rememberable, :trackable, :validatable,
:omniauthable, :omniauth_providers => [:facebook]

  validates :name, presence: true, length: { in: 1..150 }
  validates :organization, presence: true

  def first_entry?
    self.sign_in_count <= 1
  end

  def self.from_omniauth(auth, organization)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          provider:auth.provider,
          uid:auth.uid,
          name: auth.info.name,
          email:auth.info.email,
          password:Devise.friendly_token[0,20],
          organization: organization
        )
      end
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  private
    def become_an_admin!
      if ! User.any?
        self.admin = true
      end
    end

end
