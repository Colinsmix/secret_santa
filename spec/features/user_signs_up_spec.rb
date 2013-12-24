require 'spec_helper'

feature 'user signs up for secret santa' do
  let(:user) {FactoryGirl.build(:user)} 
  scenario 'a user can sign up for the site' do
    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation
    click_on 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
