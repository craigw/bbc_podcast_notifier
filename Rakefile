require 'rake'
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
  s.name     = "podcast_notifier"
  s.version  = "0.0.1"
  s.date     = "2008-12-15"
  s.summary  = "Put a message on a queue when a new BBC podcast is available"
  s.email    = "craig@barkingiguana.com"
  s.homepage = "http://barkingiguana.com/~craig/podcast_notifier.git"
  s.description = s.summary
  s.has_rdoc = false
  s.authors  = ["Craig R Webster"]
  s.files = FileList["lib/**/*"].to_a + FileList["spec/**/*"].to_a
  s.require_path = "lib"
  s.autorequire = "bbc"
  s.executables = %W(notifyd)
  s.extra_rdoc_files = %W(History.txt)
  s.add_dependency('doodle', '>= 0.1.9')
  # I can't find a Gem for this:
  # s.add_dependency('smqueue', '>= 0.1.9')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end