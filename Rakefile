require 'rake'
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
  s.name     = "podcast_notifier"
  s.version  = "0.0.2"
  s.date     = "2009-01-15"
  s.summary  = "Put a message on a queue when a new BBC podcast is available"
  s.email    = "craig@barkingiguana.com"
  s.homepage = "http://barkingiguana.com/~craig/code/podcast_notifier.git"
  s.description = s.summary
  s.has_rdoc = false
  s.authors  = ["Craig R Webster <http://barkingiguana.com/~craig>"]
  s.files = FileList["lib/**/*"].to_a + FileList["spec/**/*"].to_a
  s.require_path = "lib"
  s.autorequire = "bbc"
  s.executables = %W(notifyd)
  s.extra_rdoc_files = %W(History.txt)
  s.add_dependency('doodle', '>= 0.1.9')
  # To generate smqueue-0.1.0 see my post at:
  # http://barkingiguana.com/2009/01/01/writing-rubystomp-clients-with-smqueue
  s.add_dependency('smqueue', '>= 0.1.0')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end