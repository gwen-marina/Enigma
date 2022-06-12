require 'simplecov'
SimpleCov.start
require './lib/keys'
require './lib/encrypt'
require 'pry'

RSpec.describe Encrypt do
  let(:keys) { Keys.new(12345, "082609") }
  let(:encrypt) { Encrypt.new }

  it "exists" do
    expect(encrypt).to be_a(Encrypt)
  end

  it "has attributes" do
    expect(encrypt.alphabet).to be_a(Array)
    expect(encrypt.alphabet.count).to eq(27)
    expect(encrypt.alphabet[0]).to eq("a")
    expect(encrypt.alphabet[7]).to eq("h")
    expect(encrypt.alphabet[26]).to eq(" ")
    expect(encrypt.keys).to be_a(Keys)
  end

  it "can build ciphers" do
    expect(encrypt.rotate_shift(1)).to be_a(Hash)
    expect(encrypt.rotate_shift(0)["z"]).to eq("z")
    expect(encrypt.rotate_shift(1)["b"]).to eq("c")
    expect(encrypt.rotate_shift(2)["d"]).to eq("f")
    expect(encrypt.rotate_shift(3)["g"]).to eq("j")
  end

  it "can encrypt a message" do
    expect(encrypt.cipher("hello world")).to be_a(String)
  end
end
