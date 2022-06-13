require 'simplecov'
SimpleCov.start
require './lib/keys'
require './lib/cipher'

RSpec.describe Cipher do
  let(:keys) { Keys.new(12345, "082609") }
  let(:cipher) { Cipher.new }

  it "exists" do
    expect(cipher).to be_a(Cipher)
  end

  it "has attributes" do
    expect(cipher.alphabet).to be_a(Array)
    expect(cipher.alphabet.count).to eq(27)
    expect(cipher.alphabet[0]).to eq("a")
    expect(cipher.alphabet[7]).to eq("h")
    expect(cipher.alphabet[26]).to eq(" ")
    expect(cipher.keys).to be_a(Keys)
  end

  it "can build ciphers" do
    expect(cipher.rotate_shift(1)).to be_a(Hash)
    expect(cipher.rotate_shift(0)["z"]).to eq("z")
    expect(cipher.rotate_shift(1)["b"]).to eq("c")
    expect(cipher.rotate_shift(2)["d"]).to eq("f")
    expect(cipher.rotate_shift(3)["g"]).to eq("j")
  end

  it "can encrypt/cipher a message" do
    expect(cipher.cipher("hello world!")).to be_a(String)
    expect(cipher.cipher("hello world")).to be_a(String)
  end

  it "can decrypt/decipher a message" do
    expect(cipher.decipher("hello world")).to be_a(String)
    expect(cipher.decipher("hello world!")).to be_a(String)
  end
end
