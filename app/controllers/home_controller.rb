class HomeController < ApplicationController
  def hello_world
  end

  def index
    @object =MyJsonClass.json_data
  end

  def contact
  end
end
