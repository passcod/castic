require 'pathname'
require_relative '../lib/castic'

describe "Castic in Formula mode" do
  subject {
    f = Pathname.new __FILE__
    Castic.new f.dirname.join("support/bar.rb"), :Formula
  }
  describe "#tree" do
    it "should be a tree representing the parsed source" do
      subject.tree.should eq [
        [nil, :require, ["formula"]],
        [
          [nil, :Bar],
          [nil, :Formula],
          [
            [nil, :url, ["http://foob.ar/bar-0.123.tar.gz"]],
            [nil, :homepage, ["http://foob.ar"]],
            [nil, :sha1, ["19f904d63d045194885639c381a607ca86a319b5"]],
            [:patches,
              [],
              [[[:p3], ["http://foob.ar/export/12345/trunk/bar/files/patch-src-bar-lib--bar.c.diff"]]]
            ],
            [:install, [],
              [
                [nil, :system, ["./configure"], ["--disable-debug"], ["--disable-dependency-tracking"], [["--prefix="], [nil, :prefix]]],
                [nil, :system, ["make install"]]
              ]
            ]
          ]
        ]
      ]
    end
  end

  describe "#name" do
    it "should be the class name of the file" do
      subject.name.should eq "Bar"
    end
  end

  describe "#expected_name" do
    it "should be the classified filename" do
      subject.expected_name.should eq "Bar"
    end
  end

  describe "#props" do
    it "should return formula properties" do
      subject.props(:url).should eq [[:url, ["http://foob.ar/bar-0.123.tar.gz"]]]
    end
  end
end

