# frozen_string_literal: true

require "bundler/gem_tasks"
require "github_changelog_generator/task"

task default: [:test]

task :test do
  puts "Please write some tests..."
end

GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  config.user = "ccollins"
  config.project = "digital_cable"
end


# bundle exec magic_frozen_string_literal
# bundle exec standardrb --fix
# cd ./javascript && yarn run prettier-standard cable_ready.js
