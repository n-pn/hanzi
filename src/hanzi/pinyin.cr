module Hanzi
  FILE = File.join __DIR__, "../../priv/tones.txt"
  TONES = File.read_lines(FILE).map{|line| line.split("=", 2)}.to_h

  module Pinyin
    def self.number_to_tone(pinyin)
      pinyin.split(" ").map{|word| TONES[word]? || word}.join(" ")
    end
  end
end
