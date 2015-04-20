require 'rails_helper'
require 'user'
require "validates_email_format_of/rspec_matcher"

RSpec.describe User, type: :model do

  it 'is invalid without a name' do 
    user = User.new
    user.name = ""
    user.should_not be_valid
  end
  

  it 'is invalid without an email address' do
    user = User.new
    user.name = 'name'
    user.email = ""
    user.should_not be_valid
  end
  
  it { should validate_email_format_of(:email).with_message('is not looking good') }


end
