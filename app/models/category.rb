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
end
