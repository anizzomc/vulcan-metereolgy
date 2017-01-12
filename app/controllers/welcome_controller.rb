class WelcomeController < ApplicationController

  def index
    render plain: "Eureka! #{Dummy.first}"
  end

end