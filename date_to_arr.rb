class DateToArr

  def initialize

    print 'Enter date ( example - thu, 22 Dec 2016 00:00:00): '
    @date = gets.to_s

    @result = []

  end

  def change_date
    parse_to_arr

    hours = @date[4].to_i
    minutes = @date[5].to_i
    day = @date[1].to_i

    for i in 0..25
      if minutes <= 45 && i<=3
        show_date
         minutes += 15
         @date[5] = minutes.to_s

      elsif minutes == 0 && i <= 12
        minutes += 30
        @date[5] = minutes.to_s
        show_date
      elsif minutes == 30 && i <= 12 && hours < 12
        minutes = 0
        @date[5] = '00'
        hours += 1
        @date[4] = hours.to_s
        show_date

      elsif minutes >= 30 && i <= 12 && hours < 12
        minutes = 0
        @date[5] = '00'
        hours += 1
        @date[4] = hours.to_s
        show_date
      elsif i > 12 && i <= 20 && hours < 12
        hours += 1
        @date[4] = hours.to_s
        show_date

      elsif hours >= 12 && i > 20 && i <= 25 && day < 31

        day += 1
        @date[1] = day.to_s
        if @date[0] == 'sun'
          @date[0] = 'mon'
          elsif @date[0] == 'mon'
            @date[0] = 'tue'
        elsif @date[0] == 'tue'
          @date[0] = 'wed'
        elsif @date[0] == 'wed'
          @date[0] = 'thu'
        elsif @date[0] == 'thu'
          @date[0] = 'fr'
        elsif @date[0] == 'fr'
          @date[0] = 'sat'
        elsif @date[0] == 'sat'
          @date[0] = 'sun'
        end
        show_date
      elsif day >= 31

        day = 1
        @date[1] = '01'
        show_date

      end
    end


  end

  def parse_to_arr
    @date = @date.split(/,/)
    @date = @date + @date[1].strip.split(/ /)
    @date.delete_at(1)
    @date = @date + @date[4].strip.split(/:/)
    @date.delete_at(4)

  end

  def show_date
    for i in 0...@date.length
    print @date[i] + " "
    end
    puts
  end

end

def main
  test = DateToArr.new
  test.change_date
  test.show_date

end
main
