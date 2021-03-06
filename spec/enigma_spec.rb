require 'simplecov'
SimpleCov.start
require_relative '../lib/keys'
require_relative '../lib/cipher'
require_relative '../lib/enigma'

RSpec.describe Enigma do

  let(:enigma) { Enigma.new }

  it "exists" do
    expect(enigma).to be_a(Enigma)
  end

  it "can encrypt a message" do
    expect(enigma.encrypt("hello")).to be_a(Hash)
    expect(enigma.encrypt("hello", "23456")).to be_a(Hash)
    expect(enigma.encrypt("hello", "23456", "010385")).to be_a(Hash)
    expect(enigma.encrypt("hello")[:encryption]).to be_a(String)
    expect(enigma.encrypt("hello", "23456", "010385")[:date]).to eq("010385")
    expect(enigma.encrypt("hello", "23456", "010385")[:key]).to eq("23456")
  end

  it "can decrypt a message" do
    encrypted_message = enigma.encrypt("hello", "23456", "010385")[:encryption]
    expect(enigma.decrypt(encrypted_message, "23456", "010385")).to be_a(Hash)
    expect(enigma.decrypt(encrypted_message, "23456", "010385")[:decryption]).to eq("hello")
    expect(enigma.decrypt("hello", "23456", "010385")[:date]).to eq("010385")
    expect(enigma.decrypt("hello", "23456", "010385")[:key]).to eq("23456")
  end

  it "can encrypt and decrypt special characters" do
    encrypted_message_hash = enigma.encrypt("hello!")
    expect(encrypted_message_hash[:encryption]).to include("!")
    expect(enigma.decrypt(encrypted_message_hash[:encryption],
                          encrypted_message_hash[:key],
                          encrypted_message_hash[:date])[:decryption]).to eq("hello!")
  end
end
