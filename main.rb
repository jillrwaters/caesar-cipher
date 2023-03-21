def caesar_cipher message, offset
  msg_array = message.split("").map(&:downcase)
  alphabet = ('a'..'z').to_a
  indexes = []
  new_message = []

  msg_array.each do |msg_char| #for each character in the message

    if msg_char == " " #no need to loop through alphabet, just push character to indexes
      indexes << " "
    elsif msg_char =~ /[[:punct:]]/ #no need to loop through alphabet, just push character to indexes
      indexes << msg_char
    end

    alphabet.each_with_index do |alpha_char, idx| #loop through the alphabet and push the index to indexes when there is a match
      if (msg_char == alpha_char)
        indexes << idx += 1
      end
    end

  end 

  new_idx = 0
  
  indexes.each do |idx|
    new_letter = ''

    if idx =~ /[[:punct:]]/ #no need to loop through alphabet, just push character to new_message
      new_message << idx 
    elsif idx == " " #no need to loop through alphabet, just push character to new_message
      new_message << " "
    else
      alphabet.each_with_index do |letter, alpha_idx| #loop through alphabet
        new_idx = (idx + offset) % 26 #adds offset to index and wraps back around to a if the new index is greater than 26
        new_letter = alphabet[new_idx - 1] 
      end
    end

    new_message << new_letter   

  end
    
p new_message.join('')

end

caesar_cipher "I'll get you, my pretty. And your little dog, too!!", 77
