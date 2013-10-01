module NumeralsHelper

  @@h = {
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
      10 => 'ten',
      11 => 'eleven',
      12 => 'twelve',
      13 => 'thirteen',
      14 => 'fourteen',
      15 => 'fifteen',
      16 => 'sixteen',
      17 => 'seventeen',
      18 => 'eighteen',
      19 => 'nineteen',
      20 => 'twenty',
      30 => 'thirty',
      40 => 'forty',
      50 => 'fifty',
      60 => 'sixty',
      70 => 'seventy',
      80 => 'eighty',
      90 => 'ninety'
  }

  def number_to_word(number, glue = true)
    number = number.to_i.abs
    string_number = ''

    if @@h.has_key? number
      return single_digit(number)
    end

    if number < 100
      string_number = two_digit(number)

    else
      str_num = number.to_s
      length = str_num.length
      case length
      when 3
        string_number = "#{single_digit(str_num[0])} hundred"
        string_number += concat(two_digit(number % 100), glue)
      when 4
        if str_num[1,1] == '0' or str_num[2,length-2] == '00'
          string_number = "#{single_digit(str_num[0])} thousand"
          string_number += concat(number_to_word(number % 1000), glue)
        else
          string_number = "#{two_digit(str_num[0,2])} hundred"
          string_number += concat(number_to_word(str_num[2,length-2]), glue)
        end
      when 5
        string_number = "#{two_digit(str_num[0,length-3])} thousand"
        string_number += concat(number_to_word(str_num[length-3,3], false), glue)
      when 6
        string_number = "#{number_to_word(str_num[0,3], false)} thousand"
        string_number += concat(number_to_word(str_num[3,3], false), glue)
      when 7..9
        string_number = "#{number_to_word(str_num[0,length-6], false)} million"
        string_number += concat(number_to_word(str_num[length-6,6], false), glue)
      #when 10..12
      else
        string_number = "#{number_to_word(str_num[0,length-9], false)} billion"
        string_number += concat(number_to_word(str_num[length-9,9], false), glue)

      end
    end

    string_number

  end

  def two_digit(number)
    number = number.to_i
    if @@h.has_key? number
      return single_digit(number)
    end

    string_number = single_digit(number / 10 * 10)

    unless single_digit(number % 10).empty?
      string_number += "-#{single_digit(number%10)}"
    end
    string_number
  end

  def single_digit(number)
    @@h[number.to_i] || ''
  end

  def concat(number, glue = true)
    str = ''
    unless number.empty?
      if glue
        str += ' and'
      end
      str += " #{number}"
    end

    str
  end

end
