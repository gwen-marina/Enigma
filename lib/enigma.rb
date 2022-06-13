require_relative 'cipher'
require_relative 'keys'

class Enigma

  def encrypt(message, key = nil, date = nil)
    keys = Keys.new(key, date)
    create_encrypt = Cipher.new(keys)
    {
      encryption: create_encrypt.cipher(message),
      key:  keys.key,
      date: keys.date
    }
  end

  def decrypt(message, key, date = nil)
    keys = Keys.new(key, date)
    create_encrypt = Cipher.new(keys)
    {
      decryption: create_encrypt.decipher(message),
      key:  keys.key,
      date: keys.date
    }
  end
end
