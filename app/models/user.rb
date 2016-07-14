# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

class User < ActiveRecord::Base
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :entries, through: :user_categories
  has_secure_password

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  def self.new_with_categories(options)
    # create a new user
    # category = Category.first 
    # user = User.new(options)
    # user.categories << category # UserCategory.create(user_id: user.id, category_id: category.id)
    # associate it with all of the categories
    # return the user
  end

end
