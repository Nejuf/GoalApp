require 'spec_helper'

describe Cheer do

  it {should belong_to(:user)}

  it {should belong_to(:goal)}

  it {should_not allow_value(0).for(:delta)}
  it {should_not allow_value(2).for(:delta)}
  it {should_not allow_value(-2).for(:delta)}
  it {should allow_value(1).for(:delta)}
  it {should allow_value(-1).for(:delta)}

  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:goal_id)}
  it {should validate_presence_of(:delta)}
  #it {should validate_uniqueness_of(:goal_id)}
  #it {should validate_uniqueness_of(:goal_id).scoped_to(:user_id)}
  it "should ensure uniquess of [goal_id, user_id]" do
    c = FactoryGirl.create(:cheer)
    c2 = FactoryGirl.build(:cheer)
    c2.should_not be_valid
  end
end
