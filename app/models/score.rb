# == Schema Information
#
# Table name: scores
#
#  id               :integer          not null, primary key
#  value            :integer
#  user_category_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Score < ActiveRecord::Base
  belongs_to :user_category

  validates :value, presence: true
  validates :value, numericality: true
  validates :value, :inclusion => 0..10
end
