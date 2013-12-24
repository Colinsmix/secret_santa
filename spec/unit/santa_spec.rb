require 'spec_helper'

describe Santa do
  it {should have_many(:participants)}
  it {should belong_to(:user)}
  it {should accept_nested_attributes_for(:participants)}

  it {should validate_presence_of(:name)}

  describe 'states' do
    let!(:santa) {FactoryGirl.create(:santa)}

    it 'should have an initial state of editable' do
      expect(santa.state).to eql('editable')
    end

    it 'should tranistion to locked' do
      santa.lock
      expect(santa.state).to eql('locked')
    end

    it 'should transition from locked to notified' do
      santa.lock
      santa.notify
      expect(santa.state).to eql('notified')
    end
  end

  describe 'get_matches' do
    let!(:santa) {FactoryGirl.create(:santa_with_participants)}
    it 'should return random matches' do
      original_matches = santa.get_matches
      expect(original_matches.length).to eql(santa.participants.length * 2)
      expect(santa.get_matches).to_not eq(original_matches)
    end
  end
end

