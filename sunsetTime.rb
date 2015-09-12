require 'open-uri'
require 'JSON'

class SunsetTime

    def initialize(lat, lng)
      @lat = lat
      @lng = lng
      today = Time.now.strftime("%Y-%m-%d")
      @the_time = JSON.parse(open("http://api.sunrise-sunset.org/json?lat=#{@lat}&lng=#{@lng}&date=#{today}&formatted=0").read)
    end

    def sunset_teller
      puts "The sunset today at #{@lat}, and #{@lng} is #{sunset_time}"
    end

    private
    def sunset_time
      utc_time = @the_time['results']['sunset']
      utc_time.gsub(/[T]/," ").gsub(/[+]/," +")
      utc_time = Time.parse(utc_time).localtime
    end

end

sunset_hermosillo = SunsetTime.new(29.0729673,-110.95591919999998)

sunset_hermosillo.sunset_teller
