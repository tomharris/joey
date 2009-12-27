module RandomData
  module Text

    def words(count)
      Random.paragraphs(1).split[0..(count-1)].join(' ')
    end
  end

  module Dates

    def time
      d = self.date
      Time.utc(d.year, d.month, d.day)
    end

    def date_between
      raise "date_between is unavailable for performance reasons"
    end

    def date_before(date, mininum_date = nil)
      maximum_date_range_in_days = 1000
      maximum_date_range_in_days = (date - minimum_date).to_i if mininum_date

      date - rand(maximum_date_range_in_days)
    end
  end
end
