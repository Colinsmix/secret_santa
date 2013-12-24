require 'spec_helper'

feature 'user creates a secret santa' do
  let(:user) {FactoryGirl.build(:user)}
  let(:santa) {FactoryGirl.build(:santa)}

  before(:each) do
    user.save!
  end
  scenario 'I can not create a secret santa if not signed in' do
    visit root_path
    click_on 'Get Started'

    expect(current_path).to eql(new_user_session_path)
    expect(page).to have_content('You need to sign in or sign up')
  end
  
  scenario 'I can visit the new secret santa path if signed in' do
    sign_in_as(user)
    visit root_path
    click_on 'Get Started'

    expect(current_path).to eql(new_santa_path)
  end
end
