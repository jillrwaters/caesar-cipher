def caesar_cipher message, offset
  message = message.downcase
  msg_array = message.split("")
  alphabet = ('a'..'z').to_a
  indexes = []
  new_message = []
  msg_array.each do |msg_char|
    if msg_char == " "
      indexes << " "
    end
    alphabet.each_with_index do |alpha_char, idx|
      if (msg_char == alpha_char)
        indexes << idx += 1
      end
    end
  end

  require "pry-byebug" ; binding.pry

  p indexes

  

  new_idx = 0
  new_letter = ''
  indexes.each do |idx|
    if idx == " "
      new_message << " "
    elsif
      alphabet.each_with_index do |letter, alpha_idx|
        new_idx = (idx + offset) % 26
        new_letter = alphabet[new_idx - 1]
      end
    end
    
    new_message << new_letter
  end
    
p new_message.join('')


end

caesar_cipher "hello there", 15
