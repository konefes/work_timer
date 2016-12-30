class WorkTimerController < ApplicationController
  def start
    if params[:secret] == "so_secret"
      TimerEntry.create!(start: true)
    end
  end
  
  def stop
    if params[:secret] == "so_secret"
      TimerEntry.create!(start: false)
    end
  end
  
  def index
    
  end
end
