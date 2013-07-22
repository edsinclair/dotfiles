def unbundled_require(gem, options = {})
  if defined?(::Bundler) && gem != "irb/ext/save-history"
    spec_path = Dir.glob("#{Gem.dir}/specifications/#{gem}-*.gemspec").last
    if spec_path.nil?
      warn "Couldn't find #{gem}"
      return
    end

    spec = Gem::Specification.load spec_path
    spec.activate
  end

  begin
    require options[:require] || gem
    yield if block_given?
  rescue Exception => err
    warn "Couldn't load #{gem}: #{err}"
  end
end

require "rubygems" unless defined? Gem

unbundled_require "irb/ext/save-history" do
  IRB.conf[:USE_READLINE] = true
  IRB.conf[:SAVE_HISTORY] = 100
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
end

unbundled_require "hirb" do
  Hirb.enable
end

unbundled_require "bond" do
  Bond.start
end

unbundled_require "fancy_irb" do
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
end

unbundled_require "awesome_print" do
  AwesomePrint.irb!
end
