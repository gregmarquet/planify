# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :entries, through: :user_categories

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

end
