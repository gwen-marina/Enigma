require 'simplecov'
SimpleCov.start
require './lib/keys'
require './lib/encrypt'

RSpec.describe Encrypt do

  let(:encrypt) { Encrypt.new }

  it "exists" do
    expect(encrypt).to be_a(Encrypt)  
  end

end
