class WorkTimerController < ApplicationController
  # def start
  #   if params[:secret] == "so_secret"
  #     TimerEntry.create!(start: true)
  #   end
  # end
  
  # def stop
  #   if params[:time].to_f > 0
  #     TimerEntry.create!(start: false, seconds: params[:time])
  #   end
  # end
  
  def index
    @entries = TimerEntry.get_table_entries
  end
  
  def log 
    if params[:time].to_f > 0
      TimerEntry.create!(seconds: params[:time])
    end
  end
end


