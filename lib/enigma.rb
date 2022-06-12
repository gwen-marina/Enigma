require 'encrypt'
require 'keys'

class Enigma

  def encrypt(message, key = nil, date = nil)
    keys = Keys.new(key, date)
    create_encrypt = Encrypt.new(keys)
    {
      encryption: create_encrypt.cipher(message),
      key:  keys.key,
      date: keys.date
    }
  end
end
