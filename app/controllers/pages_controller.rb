class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :authenticate_user!, only: [:dashboard]

  def home
    @icons_link = Category.all[1..6]
    @icons = {"History" => "fas fa-history", "Video Games" => "fas fa-gamepad", "Television" => "fas fa-tv",
      "Music" => "fas fa-music", "Geography" =>"fas fa-map-marker-alt", "Mathematics" =>  "fas fa-calculator",
      "Computers" => "fas fa-glasses", "Celebrities" => "far fa-star", "Art" => "fas fa-palette",
       "Sports" => "fas fa-football-ball", "Vehicles" => "fas fa-car", "Knowledge" => "fas fa-book",
      "Anime" => "fas fa-video", "Comics" => "fas fa-book-open", "Film" => "fas fa-film", "Politics" => "fas fa-male",
      "Science & Nature" => "fas fa-flask", "Cartoon" => "fas fa-child", "Books" => "fas fa-book"}
  end

  def dashboard
  end
end
