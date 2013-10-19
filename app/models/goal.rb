class Goal < ActiveRecord::Base
  attr_accessible :complete, :name, :is_private

  validates_presence_of :name, :user_id
  belongs_to :user
  has_many :cheers
end
