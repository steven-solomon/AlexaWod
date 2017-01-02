class WodController < ApplicationController
  def create
    @wod_name = WodRepo.wod(date)
  end

  def date
    if raw_date.nil?
      stringify_today
    else
      parsed_date(raw_date)
    end
  end

  def raw_date  
    params.require(:request).require(:intent).require(:slots).require(:Date).permit(:value)[:value]
  end

  def parsed_date(raw_date)
    raw_date.split('-').join('/')
  end

  def stringify_today
    today = Time.now
    "#{today.year}/#{today.month}/#{today.day}"
  end
end
