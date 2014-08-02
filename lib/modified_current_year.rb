module ModifiedCurrentYear
  def current_year
    # The new seasons starts on 8/1 so technically, it's the previous year through 7/31
    current_date = Time.now
    if current_date.month < 8
      current_date.year - 1
    else
      current_date.year
    end
  end
end