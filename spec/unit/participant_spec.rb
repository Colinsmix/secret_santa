require 'spec_helper'

describe Participant do
  it {should belong_to(:santa)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:email)}

  it {should have_valid(:email).when('test@test.com', 'google@gmail.com')}
  it {should_not have_valid(:email).when(nil, '', 'test@com')}
end
