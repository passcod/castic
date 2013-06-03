class Foo < Cask
  homepage 'http://foob.ar'
  url 'http://foob.ar/foo-1.2.3-mac.dmg'
  version '1.2.3'
  sha1 'f5dd933b29ac2a73d5b77a5cbb29cbe5e3335462'
  link 'Foo.app'
  no_checksum
  link 'Bar.app'
  bar 1, 2
end

