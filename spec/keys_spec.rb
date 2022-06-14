require 'simplecov'
SimpleCov.start
require_relative '../lib/keys'

RSpec.describe Keys do

  let(:keys1) { Keys.new("12345", "082609") }
  let(:keys2) { Keys.new }

  it "exists" do
    expect(keys1).to be_a(Keys)
    expect(keys2).to be_a(Keys)
  end

  it "has attributes" do
    expect(keys1.date).to eq("082609")
    expect(keys1.key).to eq("12345")

    expect(keys2.key).to be_a(String)
    expect(keys2.date).to be_a(String)
  end

  it "can generate a random set of 5 keys" do
    expect(keys1.random_key_generator).to be_a(Array)
    expect(keys2.random_key_generator.count).to eq (5)
  end

  it "can split the keys" do
    expect(keys1.key_split).to be_a(Array)
    expect(keys1.key_split.count).to eq(4)

    expect(keys2.key_split).to be_a(Array)
    expect(keys2.key_split.count).to eq(4)
  end

  it "can create offsets using the date of transmission" do
    expect(keys1.offsets).to be_a(Array)
    expect(keys1.offsets.count).to eq(4)

    expect(keys2.offsets).to be_a(Array)
    expect(keys2.offsets.count).to eq(4)
  end

  it "can combine keys and offsets" do
    expect(keys1.combine_key_offset).to be_a(Array)
    expect(keys1.combine_key_offset[0]).to be_a(Integer)
    expect(keys1.combine_key_offset.length).to eq(4)

    expect(keys2.combine_key_offset).to be_a(Array)
    expect(keys2.combine_key_offset[2]).to be_a(Integer)
    expect(keys2.combine_key_offset.length).to eq(4)
  end
end
