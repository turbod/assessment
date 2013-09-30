module ApplicationHelper
  def numeric?(number)
    return true if number =~ /^\d+$/
    true if Float(number) rescue false
  end
end
