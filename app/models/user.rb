class User < ActiveRecord::Base
  has_many :quotes, dependent: :destroy
  
  validates :handle, presence: true,
                    uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true                    
end
