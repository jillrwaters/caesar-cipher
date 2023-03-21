def caesar_cipher message, offset
  msg_array = message.split("").map
  alphabet = ('a'..'z').to_a
  caps_alphabet = ('A'..'Z').to_a
  indexes = []
  new_message = []

  msg_array.each do |msg_char| #for each character in the message
    if msg_char =~ /[[:punct:]][[:blank:]]/ #no need to loop through alphabet, just push character to indexes
      indexes << msg_char
    elsif msg_char =~ /[[:upper:]]/
      caps_alphabet.each_with_index do |alpha_char, idx| #loop through the alphabet and push the index to indexes when there is a match
        if (msg_char == alpha_char)
          indexes << (idx += 1).to_s
          break
        end
      end  
    else
      alphabet.each_with_index do |alpha_char, idx| #loop through the alphabet and push the index to indexes when there is a match
        if (msg_char == alpha_char)
          indexes << idx += 1
          break
        end
      end
    
    # require "pry-byebug" ; binding.pry
    

  end


  end 

  new_idx = 0
  
  indexes.each do |idx|
    new_letter = ''

    if idx =~ /[[:punct:]][[:blank:]]/ #no need to loop through alphabet, just push character to new_message
      new_message << idx 
    elsif idx.is_a?(String) && !(idx =~ /[[:punct:]][[:blank:]]/)
      idx = idx.to_i
      caps_alphabet.each_with_index do |letter, alpha_idx| #loop through alphabet
        new_idx = (idx + offset) % 26 #adds offset to index and wraps back around to a if the new index is greater than 26
        new_letter = caps_alphabet[new_idx - 1] 
        break
      end

    else
      alphabet.each_with_index do |letter, alpha_idx| #loop through alphabet
        new_idx = (idx + offset) % 26 #adds offset to index and wraps back around to a if the new index is greater than 26
        new_letter = alphabet[new_idx - 1]
        break
      end

      
    
    end

    new_message << new_letter   

  end
    
p new_message.join('')

end

caesar_cipher "I'll get you, my pretty. And your little dog, too!!", 77
