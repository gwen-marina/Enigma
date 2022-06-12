require_relative 'enigma'

read_from = ARGV[0]
decrypt_to = ARGV[1]
key = ARGV[2]
date = ARGV[3]

input = File.read(read_from)

enigma = Enigma.new

decrypted_text = enigma.decrypt(input, key, date)

output = File.write(decrypt_to, decrypted_text[:decryption])

puts "Created 'decrypted.txt' with the key #{decrypted_text[:key]} and date #{decrypted_text[:date]}"


# If you encounter a character not in the character set, it should be translated as itself. 
# Using the example above, “hello world!” should be translated as “keder ohulw!”
