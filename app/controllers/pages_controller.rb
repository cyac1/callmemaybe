class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :authenticate_user!, only: [:dashboard]

  def home
    @icons = Category.all[1..6]
  end

  def dashboard

  end
end
