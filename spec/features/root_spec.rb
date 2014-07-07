require "spec_helper"

feature "/" do

  scenario "should have a login button" do
    visit "/"

    expect(page).to have_link("Login", options = {href: "/contacts"})

  end

#
#
#   feature "error page" do
#     scenario "should have button returning to homepage" do
#       visit "/error"
#
#       expect(page). to have_link("Try again", options = {href: "/"})
#     end
#
#
#   end
#
#
#
#
#
# end

