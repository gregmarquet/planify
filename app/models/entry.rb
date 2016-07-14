# == Schema Information
#
# Table name: entries
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :string
#  completed        :boolean          default("f")
#  user_category_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
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
end
