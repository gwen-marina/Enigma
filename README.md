# Enigma

Other notes on Encryption:

You should be able to generate random numbers with leading zeros. In the example shown, the random number was 2715, so it should be zero padded to make it a five digit number (02715)

Your translation should only translate using lowercase letters. If a letter is uppercase, it should use the lowercase translation, so in the example above, “HELLO WORLD” would still translate to “keder ohulw”

If you encounter a character not in the character set, it should be translated as itself. Using the example above, “hello world!” should be translated as “keder ohulw!”


Decrypting a Message:

In order to decrypt a message, we need to know the key and date that were used for encryption. We can find the total shifts using the same methods as above. Then each character is shifted backwards instead of forwards.

Cracking a Key:

When the key is not known, we can crack the encryption using just the date of transmission. We believe that each enemy message ends with the characters " end". Use this to crack the encryption.


FOR ME:

Created the following classes:
Encrypt and Keys with corresponding spec files.
Wrote the following methods in the Keys class and spec files had corresponding tests:
random_key_generator - generates random 5 digit number,
key_split - splits the random generated key into 4 keys, each with 2 digits
offsets - created offset using date method(strftime), squaring the date, and using the last 4 digits of squared number
combine_key_offset - combined the keys and offsets to make the shift that will be used in the cipher

Wrote the following methods in the Encrypt class and spec files had corresponding tests:
Initialized the following in Encrypt class: :alphabet, :keys, :shift_one, :shift_two, :shift_three, :shift_four
methods are as follows:
rotate_shift(offset) - each of the 4 shifts used (shift_one, etc) takes the argument of the keys.combine_key_offset method and the index position of the array of integers returned in combine key offset to return the rotated_characters(when initialized). We then have the original alphabet array, and the rotated alphabet array, the zip method(basically map.with_index)  then merges the two arrays and gives us an array of arrays with each index being the corresponding value for each array returned in pairs.
cipher-
