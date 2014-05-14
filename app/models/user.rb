class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessor :password_confirmation

  has_many :quotes, dependent: :destroy
  
  validates :password,  presence: true,
                        confirmation: true
  validates :password_confirmation, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }

  def full_name
    "#{first_name} #{last_name}"
  end                  
end
