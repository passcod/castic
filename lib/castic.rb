require 'parser/ruby18'
require_relative 'extends/parser'

class Castic
  def initialize(cask)
    @file = cask
    @source = IO.read cask
    @parsed = Parser::Ruby18.parse @source
    @tree = @parsed.to_tree
  end

  attr_reader :tree

  def expected_name
    @file.to_s
      .split('/')
      .last
      .split('-')
      .map(&:capitalize)
      .join
      .sub /\.rb$/, ''
  end

  def name
    k = @tree.index [nil, :Cask]
    @tree[k-1][1].to_s
  end

  def props(key = nil)
    k = @tree.index [nil, :Cask]
    body = @tree[k+1]
    if key
      body.select { |n|
        n[1] == key.to_sym
      }
    else
      body
    end.map { |n|
      n.last n.length - 1
    }
  end
end

