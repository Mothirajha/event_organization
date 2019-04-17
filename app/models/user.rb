class User < ApplicationRecord
  before_validation :downcase_params, on: %i[create update]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :users_events
  has_many :events, through: :users_events

  # Validations
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true
  validates :phone, presence: true

  private

  def downcase_params
    self.username = username.downcase
    self.email = email.downcase
  end
end
