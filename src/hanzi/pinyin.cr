require "./pinyin/tones"

module Hanzi
  module Pinyin
    def self.number_to_tone(pinyin)
      pinyin
      .downcase
      .gsub("u:", "ü")
      .split(/[\s\-]/x)
      .map{ |word| PINYIN_TONES.fetch(word, word) }
      .join(" ")
    end
  end
end
