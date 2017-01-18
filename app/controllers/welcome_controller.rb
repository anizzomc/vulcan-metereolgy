class WelcomeController < ApplicationController

  def index
    render inline: "Go to <a href='#{clima_path}'>Clima</a>"
  end

end