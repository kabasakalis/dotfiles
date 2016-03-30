require 'awesome_print'
AwesomePrint.irb!

if ENV['RAILS_ENV']
  rails_env = ENV['RAILS_ENV'].downcase
elsif Rails and Rails.env
  rails_env = Rails.env.downcase
end

if rails_env
  current_app = Dir.pwd.split('/').last

  black = "\033[0;30m"
  red = "\033[0;31m"
  green = "\033[0;32m"
  yellow = "\033[0;33m"
  blue = "\033[0;34m"
  purple = "\033[0;35m"
  cyan = "\033[0;36m"
  reset = "\033[0;0m"

  environment_color = case rails_env
                        when 'development'
                          green
                        when 'staging'
                          yellow
                        when 'production'
                          red
                        else
                          red
                      end

  rails_env = {'development' => 'dev', 'staging' => 'staging', 'production' => 'prod'}.fetch(rails_env) { 'unknown' }

  IRB.conf[:PROMPT][:RAILS_ENV] = {
      :PROMPT_I => "#{current_app}(#{rails_env})> ",
      :PROMPT_N => "#{current_app}(#{rails_env})> ",
      :PROMPT_S => nil,
      :PROMPT_C => "?> ",
      :RETURN => "=> %s\n"
  }

  IRB.conf[:PROMPT_MODE] = :RAILS_ENV
end

