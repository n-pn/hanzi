require "./spec_helper"

describe Hanzi do
  it "correctly convert pinyin numbers tones" do
    Hanzi::Pinyin.number_to_tone("pin1 yin1").should eq("pīn yīn")
  end

  it "works with difference separator" do
    Hanzi::Pinyin.number_to_tone("pin1-yin1").should eq("pīn yīn")
  end

  it "correctly handle non-existing works" do
    Hanzi::Pinyin.number_to_tone("ABC XYZ").should eq("abc xyz")
  end

  it "works with ü vowel" do
    Hanzi::Pinyin.number_to_tone("lu:1").should eq("lǖ")
  end
end
