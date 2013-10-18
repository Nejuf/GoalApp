require 'spec_helper'

describe Goal do

  it { should validate_presence_of :name }

  it { should belong_to :user }

  it "defaults to public" do
    g = FactoryGirl.create(:goal)
    g.is_private.should eq false
  end

  it "defaults to not-complete" do
    g = FactoryGirl.create(:goal)
    g.complete.should eq false
  end
end
