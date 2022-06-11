require 'simplecov'
SimpleCov.start
require './lib/keys'
require './lib/encrypt'

RSpec.describe Encrypt do

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
  end
end
