require "rubygems" unless defined? Gem
require "irb/ext/save-history"
require "hirb"
require "bond"
require "fancy_irb"
require "awesome_print"

IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

FancyIrb.start :colorize => {
  :rocket_prompt => [:blue],
  :result_prompt => [:blue],
  :input_prompt  => nil,
  :irb_errors    => [:red],
  :stderr        => [:red, :bright],
  :stdout        => [:white],
  :input         => nil,
  :output        => true,
}

Bond.start
Hirb.enable
AwesomePrint.irb!
