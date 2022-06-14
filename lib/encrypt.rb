require_relative 'checkable'
require_relative 'enigma'
require_relative 'keys'

include Checkable

read_from = ARGV[0]
encrypt_to = ARGV[1]
key = ARGV[2]
date = ARGV[3]

if !key.nil? && !date.nil?
  check_correct_input(key,date)
end

input = File.read(read_from)

enigma = Enigma.new

encrypted_text = enigma.encrypt(input, key, date)

File.write(encrypt_to, encrypted_text[:encryption])

puts "Created 'encrypted.txt' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
