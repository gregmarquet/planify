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
#  admin           :boolean          default("f")
#

class User < ActiveRecord::Base
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :tasks, through: :user_categories
  has_many :scores, through: :user_categories
  has_secure_password

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  def self.new_with_categories(options)
    user = User.new(options)
    Category.all.each do |category|
      user.categories << category
    end
    user
  end

  def category_with_most_tasks
    user_category = user_categories.with_most_tasks
    user_category.category if user_category
  end

  def category_with_most_completed_tasks
    user_category = user_categories.with_most_completed_tasks
    user_category.category if user_category
  end

  def category_with_most_abandoned_tasks
    user_category = user_categories.with_most_abandoned_tasks
    user_category.category if user_category
  end

end

