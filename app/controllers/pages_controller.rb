class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :authenticate_user!, only: [:dashboard]

  def home
    @icons_link = Category.all[1..6]
    @icons = {"History" => "fas fa-archway", "Video Games" => "fas fa-gamepad", "Television" => "fas fa-tv",
      "Music" => "fas fa-music", "Geography" =>  "fas fa-globe", "Mathematics" =>  "fas fa-calculator",
      "Computers" => "fas fa-mouse-pointer", "Celebrities" => "far fa-grin-stars", "Art" => "fas fa-palette",
       "Sports" => "fas fa-football-ball", "Vehicles" => "fas fa-car", "Knowledge" => "fas fa-book",
      "Anime" => "fas fa-video", "Comics" => "fas fa-book-open", "Film" => "fas fa-film", "Politics" => "fas fa-male",
      "Sciences" => "fas fa-flash", "Cartoon" => "fas fa-child"}
  end

  def dashboard
  end
end
