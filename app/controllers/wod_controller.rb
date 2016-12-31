class WodController < ApplicationController
  def create
    @wod_name = WodRepo.wod
  end
end
