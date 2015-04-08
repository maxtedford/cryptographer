class Encryptor

  CHAR_MAP = ("a".."z").to_a

  def encrypt(message)
    index_of_message = message.chars.map { |char| CHAR_MAP.find_index(char) }

    index_of_message.map do |num| 
      if num == nil
        " "
      elsif num < 13
        CHAR_MAP[num+13]
      else num >= 13
        CHAR_MAP[num-13]
      end
    end.join

  end

end
