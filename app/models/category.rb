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
  has_many :entries, through: :user_categories
  has_many :scores, through: :user_categories

  def self.with_most_entries
    self.joins(:entries).group(:id).order("count(*) desc").first
  end

  def self.with_most_completed_entries
    self.joins(:entries).where("status = ?", "completed").group(:id).order("count(*) desc").first
  end

  
end
