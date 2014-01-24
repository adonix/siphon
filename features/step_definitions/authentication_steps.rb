Given /^a user visits the login page$/ do
  visit login_path
end

When(/^they submit invalid login information$/) do
  click_button "Log In"
end

Then(/^they should see an error message$/) do
  expect(page).to have_selector("div.alert.alert-error")
end