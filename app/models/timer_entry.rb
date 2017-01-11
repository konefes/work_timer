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
                    end
                end
            end
            week_arr[week.to_f] = weekday_arr
        end
        
        puts "----------------"
        puts week_arr.to_s
        return week_arr
    end
    
    
    def year
        ret = self.created_at + TimerEntry.time_diff.minutes #- 6.hours
        return ret.strftime('%Y')
    end
    
    def month
        ret = self.created_at + TimerEntry.time_diff.minutes #- 6.hours
        return ret.strftime('%m')
    end
    
    def week
        ret = self.created_at + TimerEntry.time_diff.minutes #- 6.hours
        return ret.strftime('%U')
    end
    
    def weekday
        ret = self.created_at + TimerEntry.time_diff.minutes #- 6.hours
        puts ret
        return ret.strftime('%w')
    end
    
    def self.time_diff
        current_time = Time.now
        central_time = Time.now.in_time_zone("Central Time (US & Canada)")
        time_diff = ((current_time - central_time) * 24 * 60).to_i
        puts "time_diff: " + time_diff.to_s
        return time_diff
    end
end
