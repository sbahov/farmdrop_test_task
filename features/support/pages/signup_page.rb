class SignupPage < SitePrism::Page
  set_url '/signup'
  element :email_field, '#email'
  element :password_field, '#password'
  element :zipcode_field, '#zipcode'
  element :submit_button, '#email-signup-form-submit'
  element :error_messages, '.session__errors'
  section :header, Header, '.header-bar'
end
