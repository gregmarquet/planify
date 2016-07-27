# == Schema Information
#
# Table name: entries
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :string
#  user_category_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  status           :string           default("ensure")
#

class Entry < ActiveRecord::Base
  belongs_to :user_category

  validates :title, presence: true

  def user
    self.user_category.user
  end

  def category
    self.user_category.category
  end

  def self.incomplete
    self.where(status: "incomplete")
  end

  def self.completed
    self.where(status: "completed")
  end

  def self.abandoned
    self.where(status: "abandoned")
  end

  def self.fitness_and_body
    self.joins(:user_category).where(user_categories: {category_id: 1})
  end

  def self.mind_and_soul
    self.joins(:user_category).where(user_categories: {category_id: 2})
  end

  def self.love
    self.joins(:user_category).where(user_categories: {category_id: 3})
  end

  def self.friends_and_family
    self.joins(:user_category).where(user_categories: {category_id: 4})
  end

  def self.career
    self.joins(:user_category).where(user_categories: {category_id: 5})
  end

  def self.finance
    self.joins(:user_category).where(user_categories: {category_id: 6})
  end

  def self.personal_growth
    self.joins(:user_category).where(user_categories: {category_id: 7})
  end

  
end
