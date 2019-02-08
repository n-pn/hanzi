require "./spec_helper"

describe Hanzi do
  it "correctly converts pinyin numbers tones" do
    Hanzi::Pinyin.number_to_tone("pin1 yin1").should eq("pīn yīn")
  end

  it "works with difference separator" do
    Hanzi::Pinyin.number_to_tone("pin1-yin1").should eq("pīn yīn")
  end

  it "correctly handles non-existing works" do
    Hanzi::Pinyin.number_to_tone("ABC XYZ").should eq("abc xyz")
  end

  it "works with ü vowel" do
    Hanzi::Pinyin.number_to_tone("lu:1").should eq("lǖ")
  end

  it "correctly translates pinyin of chinese string" do
    Hanzi::Pinyin.hanzi_to_pinyin("节操").should eq("jié cāo")
  end

  it "works with random garbage characters" do
    Hanzi::Pinyin.hanzi_to_pinyin("×节操").should eq("× jié cāo")
    Hanzi::Pinyin.hanzi_to_pinyin("节×操").should eq("jié × cāo")
    Hanzi::Pinyin.hanzi_to_pinyin("节操×").should eq("jié cāo ×")
    Hanzi::Pinyin.hanzi_to_pinyin("×节×操").should eq("× jié × cāo")
    Hanzi::Pinyin.hanzi_to_pinyin("×节×操×").should eq("× jié × cāo ×")
  end
end
