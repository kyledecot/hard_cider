# frozen_string_literal: true

require 'pry'
require 'hard_cider'

desc 'Start a pry console'
task :console do
  Pry.start(HardCider)
end
