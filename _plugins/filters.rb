module Jekyll
  module Filters
    def format_date(date)
      date.strftime("%B %e, %Y")
    end

    def description_break(s)
      s.gsub(/\n/, '<br><br>')
    end

    def time_rfc2822(time)
      time.rfc2822
    end
  end
end