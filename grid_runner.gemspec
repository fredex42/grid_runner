# Ensure we require the local version and not one we might have installed already

spec = Gem::Specification.new do |s| 
  s.name = 'grid_runner'
  s.version = '0.0.10' 
  s.author = 'NickyPStraightStylinOnEm'
  s.email = 'np1249a@gmail.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A lil appy to run them small apz'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.bindir = 'bin'
  s.executables << 'grid_runner'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.13.4')
  s.add_runtime_dependency('rainbow')
end
