include UtilsHelper

Given(/^I am on sign-up page$/) do
  @signup_page = SignupPage.new
  @signup_page.load
end

And(/^I enter valid sign-up data$/) do
  valid_password = UtilsHelper.random_password
  valid_email = "test#{valid_password}@email.com"

  step "I fill email field with #{valid_email}"
  step "I fill password field with #{valid_password}"
  step 'I fill zipcode field with WC2N 5DU'
end

When(/^I fill ([^"]*) field with ([^"]*)$/) do |field, data|
  case field
  when 'email'
    @signup_page.email_field.set data
  when 'password'
    @signup_page.password_field.set data
  when 'zipcode'
    @signup_page.zipcode_field.set data
  else
    raise "Field is undefined => #{field}"
  end
end

And(/^I click the submit button$/) do
  @signup_page.submit_button.click
end

Then(/^I should see "([^"]*)" message$/) do |error_message|
  expect(@signup_page).to have_error_messages
  expect(@signup_page.error_messages.text).to match error_message
end
