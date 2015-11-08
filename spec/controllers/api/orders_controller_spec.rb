require 'rails_helper'

describe Api::OrdersController do
  before(:each) { request.headers['Accept'] = "application/vnd.jr-lunchy" }

  describe "GET #index" do
    # before(:each) do
    #   @user = FactoryGirl.create :user
    #   get :show, id: @user.id, format: :json
    # end

    # it "returns the information about a reporter on a hash" do
    #   orders_response = JSON.parse(response.body, symbolize_names: true)
    #   expect(user_response[:email]).to eql @user.email
    # end

    it { should respond_with 200 }
  end
end