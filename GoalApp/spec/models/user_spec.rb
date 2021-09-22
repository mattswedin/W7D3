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

      context "with a valid username and password" do
        it "should return the user with those credentials" do
          suz = User.create(username: 'totodile', password: 'totodile')
          user = User.find_by_credentials('totodile', 'totodile')
          expect(suz.password_digest).to eq(user.password_digest)
        end
      end
      context "with an invalid username and password" do
        it "should return nil" do
          suz = User.create(username: 'totodile', password: 'totodile')
          user = User.find_by_credentials('totodile', 'beefpork')
          expect(user).to be_nil
        end
      end
    end
  end
end
