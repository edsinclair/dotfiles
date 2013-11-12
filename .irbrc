def unbundled_require(gem, options = {})
  if defined?(::Bundler) && gem != "irb/ext/save-history"
    spec_path = Dir.glob("#{Gem.dir}/specifications/#{gem.gsub('/','-')}-*.gemspec").last
    if spec_path.nil?
      warn "Couldn't find #{gem}"
      return
    end

    spec = Gem::Specification.load spec_path
    begin
      spec.activate
    rescue Gem::LoadError => err
      warn "Couldn't activate #{gem}: #{err}"
    end
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

# http://tagaholic.me/hirb/
unbundled_require "hirb" do
  Hirb.enable
end

# http://tagaholic.me/bond/
unbundled_require "bond" do
  Bond.start
end

# https://github.com/janlelis/fancy_irb
unbundled_require "paint"
unbundled_require "unicode/display_width"
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

# https://github.com/michaeldv/awesome_print
unbundled_require "awesome_print" do
  AwesomePrint.irb!
end
