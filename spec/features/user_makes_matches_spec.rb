require 'spec_helper'

feature 'user notifies secret santa selections' do
  let(:user) {FactoryGirl.create(:user)}
  let(:santa) {FactoryGirl.create(:santa_with_participants, user: user)}

  before(:each) do
    sign_in_as(user)
  end
  scenario 'when a user makes matchers it should make the matches uneditable' do
    visit santa_path(santa)
    click_on 'Secret Santasize this group'

    expect(page).to_not have_content('Edit this group')
    expect(page).to have_content('Notify Matches')
  end

  scenario 'a user should be able to notify matches via email' do
    email_count = ActionMailer::Base.deliveries.count
    santa.lock
    visit santa_path(santa)
    click_on 'Notify Matches'

    expect(page).to have_content('This Secret Santa is already in progress')
    expect(ActionMailer::Base.deliveries.count).to eql(email_count + santa.participants.count)

  end
end 
