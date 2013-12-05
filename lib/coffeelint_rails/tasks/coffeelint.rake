require 'coffeelint'

namespace :lint do
  DEFAULT_CONFIG_FILE = 'config/coffeelint.json'

  def lint_and_report(file, config_file = DEFAULT_CONFIG_FILE)
    puts "Linting #{file}"
    options = { }
    options[:config_file] = config_file if config_file
    errors = Coffeelint.lint_file(file, options)

    if errors.length == 0
      puts "  No errors"
      return
    end

    errors.each do |error|
      puts "  Line #{error['lineNumber']}: #{error['message']} (#{error['context']})"
    end

  end

  desc 'lint Coffeescript files with Coffeelint'
  task :coffeescript, :path do |t, args|

    path = args[:path] || 'app/assets/javascripts'

    files = find_targets(path)

    config_file = ENV['COFFEELINT_CONFIG'] || DEFAULT_CONFIG_FILE

    if files.length == 0
      puts "#{path} didn't match any files"
      return
    else
      puts "Linting #{files.length} files against #{config_file}"
      files.each do |file|
        lint_and_report(file, config_file)
      end
    end
  end

  # Recursively discover files matching the given regex
  def find_targets(path, pattern = /\.coffee$/i)
    return [path] if File.file?(path) && path[pattern]

    if File.directory?(path)
      return Dir.glob(File.join(path, '*')).map do |p|
        find_targets(p)
      end.flatten
    end

    []
  end
end

