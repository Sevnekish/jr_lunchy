require 'rails_helper'

class Authentication < ActionController::Base
  include Authenticable
end

describe Authenticable do
  let(:authentication) { Authentication.new }
  subject { authentication }

  describe "#auth_current_user" do
    before do
      @user = FactoryGirl.create :user
      request.headers["Authorization"] = @user.auth_token
      authentication.stub(:request).and_return(request)
    end
    it "returns the user from the authorization header" do
      expect(authentication.auth_current_user.auth_token).to eql @user.auth_token
    end
  end

  describe "#authenticate_with_token!" do
    before do
      @user = FactoryGirl.create :user
      authentication.stub(:auth_current_user).and_return(nil)
      response.stub(:response_code).and_return(401)
      response.stub(:body).and_return({"errors" => "Not authenticated"}.to_json)
      authentication.stub(:response).and_return(response)
    end

    it "render a json error message" do
      expect(json_response[:errors]).to eql "Not authenticated"
    end

    it {  should respond_with 401 }
  end

  describe "#user_signed_in_with_token?" do
    context "when there is a user on 'session'" do
      before do
        @user = FactoryGirl.create :user
        authentication.stub(:auth_current_user).and_return(@user)
      end

      it { should be_user_signed_in_with_token }
    end

    context "when there is no user on 'session'" do
      before do
        @user = FactoryGirl.create :user
        authentication.stub(:auth_current_user).and_return(nil)
      end

      it { should_not be_user_signed_in_with_token }
    end
  end
end