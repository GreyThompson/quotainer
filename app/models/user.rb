class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessor :password_confirmation

  has_many :quotes, dependent: :destroy
  
  validates :handle, presence: true,
                    uniqueness: { case_sensitive: false }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true  

  def full_name
    "#{first_name} #{last_name}"
  end                  
end
