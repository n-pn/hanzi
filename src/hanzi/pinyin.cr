require "./pinyin/tones"
require "./pinyin/chars"
require "./pinyin/words"

module Hanzi
  module Pinyin
    # convert pinyin numbers to tones
    def self.number_to_tone(pinyin)
      pinyin
        .downcase
        .gsub("u:", "ü")
        .split(/[\s\-]/x)
        .map { |word| PINYIN_TONES.fetch(word, word) }
        .join(" ")
    end

    # translate hanzi to pinyin
    def self.hanzi_to_pinyin(hanzi, accurate = false)
      inp = hanzi.chars
      res = [] of String

      max = inp.size
      idx = 0

      while idx < max
        char = inp[idx]

        keep = PINYIN_CHARS.fetch(char, char.to_s)
        jump = 1

        if accurate
          if node = PINYIN_WORDS[char]?
            word = char.to_s

            1.upto(node[:msize] - 1) do |i|
              break unless idx + i < max

              word += inp[idx + i]

              if pinyin = node[:words][word]?
                keep = pinyin
                jump = i + 1
              end
            end
          end
        end

        res << keep
        idx += jump
      end

      res.join(" ")
    end
  end
end
