def caesar_cipher message, offset
  msg_array = message.split("").map
  codes = msg_array.map { |char| char.ord }
  new_codes = []
  new_message = ""

  codes.each do |code|
    new_code = 0
    if code > 96 && code < 123
      new_code = code + offset
      if new_code > 122
        new_code = (code % 26) + 96
        new_codes << new_code
      else
        new_codes << new_code
      end
    elsif code > 64 && code < 91
      new_code = code + offset
      if new_code > 90
        new_code = (code % 26) + 65
        new_codes << new_code
      else
        new_codes << new_code
      end
    else
      new_codes << code
    end

  end

  new_codes.map { |code| code.chr }.join("") 

end

# p caesar_cipher("I'll get you my pretty, and your little dog too!!", 15)

p caesar_cipher("What a string!", 5)

