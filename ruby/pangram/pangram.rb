=begin
Write your code for the 'Pangram' exercise in this file. Make the tests in
`pangram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pangram` directory.
=end

class Pangram
    def self.pangram?(sentence)
        ('a'..'z').each do |letter|
            return false unless sentence.include?(letter) || sentence.include?(letter.upcase)
        end
        true
    end
end
