require 'simplecov'
SimpleCov.start
require './lib/keys'

RSpec.describe Keys do

  let(:keys) { Keys.new }

  it "exists" do
    expect(keys).to be_a(Keys)
  end

  it "can generate a random set of 5 keys" do
    expect(keys.random_key_generator).to be_a(Array)
    expect(keys.random_key_generator.count).to eq (5)
  end

  it "can split the keys" do
    expect(keys.key_split).to be_a(Array)
    expect(keys.key_split.count).to eq(4)
  end


end
