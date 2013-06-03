Gem::Specification.new do |s|
  s.name        = 'castic'
  s.version     = '0.2.0'
  s.date        = Time.new.to_s.split.first
  s.summary     = 'Static parser for Homebrew Cask formulae'
  s.description = s.summary
  s.authors     = ['Felix Saparelli']
  s.email       = 'me@passcod.name'
  s.files       = Dir['lib/**/**.rb']
  s.homepage    = 'https://github.com/passcod/castic'
end
