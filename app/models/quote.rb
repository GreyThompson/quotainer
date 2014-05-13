class Quote < ActiveRecord::Base
  belongs_to :user

  validates :body, presence: true
  validates :author, presence: true

  def print_quote
    "\"#{body}\""
  end

  def print_author
    "- #{author.upcase}"
  end

end
