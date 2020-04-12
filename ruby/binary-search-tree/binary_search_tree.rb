=begin
Write your code for the 'Binary Search Tree' exercise in this file. Make the tests in
`binary_search_tree_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search-tree` directory.
=end

class Bst
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  attr_reader :data, :left, :right

  # could DRY this out with a helper
  def insert(data)
    if data <= @data
      if @left.nil?
        @left = Bst.new(data)
      else
        @left.insert(data)
      end
    else
      if @right.nil?
        @right = Bst.new(data)
      else
        @right.insert(data)
      end
    end
  end

  def each(&block)
    block.call(self.data)
  end
end

