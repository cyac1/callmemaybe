class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end

  def dashboard
    raise

  end
end
