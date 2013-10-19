class Cheer < ActiveRecord::Base
  validates_presence_of :user_id, :goal_id, :delta
  validates :goal_id, uniqueness: {scope: :user_id}
  belongs_to :user
  belongs_to :goal
  validates :delta, inclusion: [1,-1]
  #inclusion: {in: [1,-1]}
end
