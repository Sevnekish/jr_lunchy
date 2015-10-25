class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:week_menu]

  def home
  end

  def week_menu
    @first_day = Date.today.at_beginning_of_week
  end
end