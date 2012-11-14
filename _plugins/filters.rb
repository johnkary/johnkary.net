module Jekyll
  module Filters
    def format_date(date)
      date.strftime("%B %e, %Y")
    end
  end
end