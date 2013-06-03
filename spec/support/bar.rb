require 'formula'

class Bar < Formula
  url 'http://foob.ar/bar-0.123.tar.gz'
  homepage 'http://foob.ar'
  sha1 '19f904d63d045194885639c381a607ca86a319b5'

  def patches
    # Fix OS X-specific bug in bar 0.123; see http://foob.ar/blah
    # This has been fixed upstream and should be included in the next release.
    { :p3 => 'http://foob.ar/export/12345/trunk/bar/files/patch-src-bar-lib--bar.c.diff' }
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end

