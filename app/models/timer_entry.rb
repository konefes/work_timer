class TimerEntry < ActiveRecord::Base
    
    def self.get_table_entries

        week_arr = Array.new(52)
        self.all.group_by(&:week).sort.each do |week, entries_by_week|
            weekday_arr = Array.new(7)
            entries_by_week.group_by(&:weekday).sort.each do |day, entries_by_day|

                entries_by_day.each do |entry|
                    if weekday_arr[day.to_f] != nil
                        weekday_arr[day.to_f] += entry.seconds.to_f
                    else
                        weekday_arr[day.to_f] = entry.seconds.to_f
                        puts "array entry created: " + entry.created_at.to_s
                    end
                end
            end
            week_arr[week.to_f] = weekday_arr
        end
        
        # puts "----------------"
        # puts week_arr.to_s
        # TimerEntry.all.each do |entry| 
        #     puts entry.created_at.in_time_zone("Central Time (US & Canada)").to_s
        # end
        return week_arr
    end
    
    
    def year
        ret = self.created_at.in_time_zone("Central Time (US & Canada)") #+ TimerEntry.time_diff.hours #- 6.hours
        return ret.strftime('%Y')
    end
    
    def month
        ret = self.created_at.in_time_zone("Central Time (US & Canada)") #+ TimerEntry.time_diff.hours #- 6.hours
        return ret.strftime('%m')
    end
    
    def week
        ret = self.created_at.in_time_zone("Central Time (US & Canada)") #+ TimerEntry.time_diff.hours #- 6.hours
        return ret.strftime('%U')
    end
    
    def weekday
        ret = self.created_at.in_time_zone("Central Time (US & Canada)") #+ TimerEntry.time_diff.hours #- 6.hours
        # puts ret
        return ret.strftime('%w')
    end
    
    # def self.time_diff
    #     current_time = Time.now.to_f / 1000 / 3600
    #     puts "current_time: " + current_time.to_s
    #     central_time = Time.now.in_time_zone("Central Time (US & Canada)").to_f / 1000 / 3600
    #     puts "central_time: " + central_time.to_s
    #     time_diff = current_time - central_time
    #     puts "time_diff: " + time_diff.to_s
    #     return time_diff
    # end
end
