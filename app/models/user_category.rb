# == Schema Information
#
# Table name: user_categories
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserCategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :tasks

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
