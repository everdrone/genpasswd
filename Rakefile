require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :default => :test

task :standalone do
  mkdir_p 'build'
  File.open('build/genpasswd', 'w+') do |f|
    f.puts '#!/usr/bin/env ruby'
    f.puts File.read('bin/genpasswd').split("require 'genpasswd'\n")[1].prepend(File.read('lib/genpasswd.rb'))
  end

  sh 'chmod +x build/genpasswd'
end

desc 'install standalone script'
task :mklink => :standalone do
  prefix = ENV['PREFIX'] || ENV['prefix'] || '/usr/local'

  mkdir_p "#{prefix}/bin"
  cp 'build/genpasswd', "#{prefix}/bin/genpasswd"
end
