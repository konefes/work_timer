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
        self.created_at.strftime('%Y')
    end
    
    def month
        self.created_at.strftime('%m')
    end
    
    def week
        self.created_at.strftime('%U')
    end
    
    def weekday
        ret = self.created_at - 6.hours
        return ret.strftime('%w')
    end
end
