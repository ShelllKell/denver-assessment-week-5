require "spec_helper"

feature "/" do

  scenario "should have a login button" do
    visit "/"

    expect(page).to have_link("Login")
    end
  end



