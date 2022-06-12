require_relative 'enigma'

read_from = ARGV[0]
encrypt_to = ARGV[1]

input = File.read(read_from)

enigma = Enigma.new

encrypted_text = enigma.encrypt(input)

output = File.write(encrypt_to, encrypted_text[:encryption])

puts "Created 'encrypted.txt' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
