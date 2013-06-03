require 'parser/ruby18'
require_relative 'extends/parser'

class Castic
  def initialize(file, type = :Cask)
    @type = type
    @file = file
    @source = IO.read file
    @parsed = Parser::Ruby18.parse @source
    @tree = @parsed.to_tree
  end

  attr_reader :tree
  attr :type

  def expected_name
    @file.to_s
      .split('/')
      .last
      .split('-')
      .map(&:capitalize)
      .join
      .sub /\.rb$/, ''
  end

  def class_index
    if @type == :Formula
      return @tree[1].index [nil, @type]
    end

    @tree.index [nil, @type]
  end

  def name
    if @type == :Formula
      @tree[1]
    else
      @tree
    end[class_index-1][1].to_s
  end

  def props(key = nil)
    body = if @type == :Formula
      @tree[1][class_index+1]
    else
      @tree[class_index+1]
    end

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

