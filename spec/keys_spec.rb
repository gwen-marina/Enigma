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

  it "can create offsets using the date of transmission" do
    expect(keys.offsets).to be_a(Array)
    expect(keys.offsets.count).to eq(4)
  end

  it "can combine keys and offsets" do
    expect(keys.combine_key_offset).to be_a(Array)
    expect(keys.combine_key_offset[0]).to be_a(Integer)
    expect(keys.combine_key_offset.length).to eq(4)
  end
end
