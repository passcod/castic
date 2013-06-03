require 'pathname'
require_relative '../lib/castic'

describe Castic do
  subject {
    f = Pathname.new __FILE__
    Castic.new f.dirname.join "support/foo.rb"
  }
  describe "#tree" do
    it "should be a tree representing the parsed source" do
      subject.tree.should eq [
        [nil, :Foo],
        [nil, :Cask],
        [
          [nil, :homepage, ["http://foob.ar"]],
          [nil, :url, ["http://foob.ar/foo-1.2.3-mac.dmg"]],
          [nil, :version, ["1.2.3"]],
          [nil, :sha1, ["f5dd933b29ac2a73d5b77a5cbb29cbe5e3335462"]],
          [nil, :link, ["Foo.app"]],
          [nil, :no_checksum],
          [nil, :link, ["Bar.app"]],
          [nil, :bar, [1], [2]]
        ]
      ]
    end
  end

  describe "#name" do
    it "should be the class name of the file" do
      subject.name.should eq "Foo"
    end
  end

  describe "#expected_name" do
    it "should be the classified filename" do
      subject.expected_name.should eq "Foo"
    end
  end

  describe "#props" do
    it "should handle single properties" do
      subject.props(:version).should eq [[:version, ["1.2.3"]]]
    end

    it "should handle multiple properties" do
      subject.props(:link).should eq [
        [:link, ["Foo.app"]],
        [:link, ["Bar.app"]]
      ]
    end

    it "should handle properties without arguments" do
      subject.props(:no_checksum).should eq [[:no_checksum]]
    end
 
    it "should handle properties with multiple arguments" do
      subject.props(:bar).should eq [[:bar, [1], [2]]]
    end

    it "should handle non-existent properties" do
      subject.props(:foo).should eq []
    end

    it "should give all props if no argument is given" do
      subject.props.should eq [
          [:homepage, ["http://foob.ar"]],
          [:url, ["http://foob.ar/foo-1.2.3-mac.dmg"]],
          [:version, ["1.2.3"]],
          [:sha1, ["f5dd933b29ac2a73d5b77a5cbb29cbe5e3335462"]],
          [:link, ["Foo.app"]],
          [:no_checksum],
          [:link, ["Bar.app"]],
          [:bar, [1], [2]]
        ]
    end
 end
end

