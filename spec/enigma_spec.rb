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

end
