=begin
Write your code for the 'Anagram' exercise in this file. Make the tests in
`anagram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/anagram` directory.
=end

class Anagram
  def initialize(string)
    @string = string
  end

  def match(entries)
    hash = Hash.new(0)
    @string.split(//).each { |s| hash[s.downcase] += 1 }

    filtered_entries = []
    entries.each do |entry|
      skip = false
      next if entry.length != @string.length
      new_hash = hash
      entry.split(//).each do |e|
        e = e.downcase
        if new_hash[e] > 0
          new_hash[e] = new_hash[e] - 1
        else
          skip = true
          next
        end
      end
      filtered_entries += [entry] unless skip
    end

    filtered_entries
  end
end

