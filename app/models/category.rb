# == Schema Information
#
# Table name: categories
#
#  id                 :integer          not null, primary key
#  name               :string
#  satisfaction_score :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :user_categories
  has_many :users, through: :user_categories
  has_many :tasks, through: :user_categories
  has_many :scores, through: :user_categories

  def self.with_most_tasks
    self.joins(:tasks).group(:id).order("count(*) desc").first
  end

  def self.with_most_completed_tasks
    self.joins(:tasks).where("status = ?", "completed").group(:id).order("count(*) desc").first
  end

  def self.with_most_abandoned_tasks
    self.joins(:tasks).where("status = ?", "abandoned").group(:id).order("count(*) desc").first
  end

  
end
