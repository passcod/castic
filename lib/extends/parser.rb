class Parser::AST::Node
  def to_tree
    self.to_a.map { |n|
      if n.is_a? Parser::AST::Node
        n.to_tree
      else
        n
      end
    }
  end
end

