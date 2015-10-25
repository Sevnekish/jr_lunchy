class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  load_and_authorize_resource

  def show
  end
end
