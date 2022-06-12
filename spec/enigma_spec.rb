require 'simplecov'
SimpleCov.start
require './lib/keys'
require './lib/encrypt'
require './lib/enigma'
require 'pry'

RSpec.describe Enigma do

  let(:enigma) { Enigma.new }

  it "exists" do
    expect(enigma).to be_a(Enigma)
  end

  it "can encrypt" do
    expect(enigma.encrypt("hello")).to be_a(Hash)
    expect(enigma.encrypt("hello", "23456", "010385")).to be_a(Hash)
    expect(enigma.encrypt("hello")[:encryption]).to be_a(String)
    expect(enigma.encrypt("hello", "23456", "010385")[:date]).to eq("010385")
    expect(enigma.encrypt("hello", "23456", "010385")[:key]).to eq("23456")
  end

end
