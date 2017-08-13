require 'thor'
require 'gems'

module Praise
  class Runner < Thor
    desc 'list', 'Show all gems'
    def list
      kv_pair = gems.map do |gem|
        info = Gems.info(gem)
        github_uri = info['source_code_uri'] || info['homepage_uri']
        [gem, github_uri]
      end

      say Hash[kv_pair]
    end

    private

    def gems
      File
        .read('Gemfile')
        .split("\n")
        .map do |line|
          match_data = /^\s*gem (['"])(.*?)(['"])/.match(line)
          match_data ? match_data[2] : nil
        end
        .compact
    end
  end
end
