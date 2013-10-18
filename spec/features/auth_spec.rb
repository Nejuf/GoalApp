require 'spec_helper'

def sign_up_user
  visit(new_user_url)
  fill_in "Username", with: "TestUser"
  fill_in "Password", with: "123456"
  click_on "Create User"
end

describe "signup process" do

  it "has new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  describe "signing up a user" do

    before(:each) do
      sign_up_user
    end

    it "shows username on the homepage after signup" do

      expect(page).to have_content "TestUser"
    end
  end

end

describe "logging in" do
  it "shows username on the homepage after login" do
    sign_up_user

    visit new_session_url
    fill_in "Username", with: "TestUser"
    fill_in "Password", with: "123456"
    click_on "Sign in"

    expect(page).to have_content "TestUser"
  end
end

describe "logging out" do


  it "begins with logged out state" do
    visit users_url
    expect(page).to have_button "Sign in"
    expect(page).to_not have_button "Sign out"
  end

  it "doesn't show username on the homepage after logout" do
    sign_up_user

    click_on "Sign out"
    expect(current_url).to eq(new_session_url)
  end
end