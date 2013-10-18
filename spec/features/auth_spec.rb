require 'spec_helper'

describe "signup process" do

  it "has new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  describe "signing up a user" do

    before(:each) do
      visit(new_user_url)
      fill_in "username", with: "TestUser"
      fill_in "password", with: "123456"
      click_on "Create User"
    end

    it "shows username on the homepage after signup" do
      expect(page).to have_content "TestUser"
    end
  end

end

describe "logging in" do
  it "shows username on the homepage after login" do
    visit new_session_url
    fill_in "username", with: "TestUser"
    fill_in "password", with: "123456"
    click_on "Log in"

    expect(page).to have_content "TestUser"
  end
end

describe "logging out" do


  it "begins with logged out state" do
    visit users_url
    expect(page).to have_content "Log in"
    expect(page).to_not have_content "Log out"
  end

  it "doesn't show username on the homepage after logout" do
    visit(new_user_url)
    fill_in "username", with: "TestUser"
    fill_in "password", with: "123456"
    click_on "Create User"

    click_on "Log out"
    expect(current_url).to eq(new_session_url)
  end
end