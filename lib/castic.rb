require 'parser/ruby18'

class Parser::AST::Node
  def to_tree
    puts self.inspect
    puts self.to_a.inspect
    self.to_a.map { |n|
      if n.is_a? Parser::AST::Node
        n.to_tree
      else
        n
      end
    }
  end
end

class Castic
  def initialize(cask)
    @file = cask
    @source = IO.read cask
    @parsed = Parser::Ruby18.parse @source
    @tree = @parsed.to_tree
  end

  def expected_name
    @file
      .split('/')
      .last
      .split('-')
      .map(&:capitalize)
      .join
      .sub /\.rb$/, ''
  end

  def name
    @parsed.children.first.to_a.last.to_s
  end

  def consistent_name?
    expected_name == name
  end
end
