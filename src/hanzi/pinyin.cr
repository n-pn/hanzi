module Hanzi
  INPUT = File.join __DIR__, "../../priv/tones.txt"
  TONES = File.read_lines(INPUT).map{|line| line.split("=", 2)}.to_h

  module Pinyin
    def self.number_to_tone(pinyin)
      pinyin
      .downcase
      .gsub("u:", "ü")
      .split(/[\s\-]/x)
      .map{ |word| TONES.fetch(word, word) }
      .join(" ")
    end
  end
end
