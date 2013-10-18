require 'spec_helper'

def setup_user
  @u = FactoryGirl.create(:user)

  visit new_session_url
  fill_in "Username", with: @u.username
  fill_in "Password", with: @u.password
  click_on "Sign in"

  visit user_url(@u)
end

def add_goal
  @g = FactoryGirl.create(:goal)
  visit user_url(@g.user_id)
end


describe "Goals" do
  before(:each) { setup_user }

  it "should let you add a goal" do
    expect(page).to have_button("Add Goal")
    fill_in "goal_name", :with => "lose weight"
    click_on "Add Goal"
    expect(page).to have_content("lose weight")
  end

  it "should have an edit goal page" do
    add_goal

    click_on "lose weight"
    fill_in "goal_name", :with => "run"
    click_on "Submit"
    expect(page).to have_content("run")
  end

  it "should let you delete goals" do
    add_goal

    expect(page).to have_button("Remove")

    click_on "Remove"
    expect(page).not_to have_content("lose weight")
  end

  it "should let you mark a goal as complete (strikethrough)" do
    add_goal
    click_on "Done"
    expect(page).to have_selector("s")
  end

  it "should let you mark a goal as private" do
    add_goal
    click_on "Private"
    expect(page).to have_button("Public")
  end

  it "should show cheers number" do
    add_goal
    expect(page).to have_content "Cheers:"
  end

  it "should be able to add cheers to another user's goal" do
    add_goal
    click_on "Sign out"

    u2 = FactoryGirl.create(:user, username: "TestUser2")
    visit new_session_url
    fill_in "Username", with: u2.username
    fill_in "Password", with: u2.password
    click_on "Sign in"

    visit user_url(@u)
    expect(page).to have_button "Cheer!"
  end

end