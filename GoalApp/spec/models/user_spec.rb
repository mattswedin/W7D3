require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create(username: 'chickenluvr', password: 'chicken')}

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end

  describe "associations" do

  end

  describe "class methods" do
    describe "::find_by_credentials" do
      context "given a username and password" do
        it "should return the user with those credentials"
      end
      context "if a user does not exist, or if there is no password entered" do
        it "should not be found in the database"
      end
    end
  end
end
