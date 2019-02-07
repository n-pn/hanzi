require "./spec_helper"

describe Hanzi do
  it "correct convert pinyin numbers tones" do
    Hanzi::Pinyin.number_to_tone("pin1 yin1").should eq("pīn yīn")
  end
end
