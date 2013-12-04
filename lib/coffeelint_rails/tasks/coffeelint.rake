

namespace :lint do
  desc 'lint Coffeescript files with Coffeelint'
  task :coffeescript do
    puts 'Linting all the things!2'
    path = Rails.root.join('app', 'asssets', 'javascripts', '**', '*.coffee')

    Dir.glob(path).each do |file|
      puts "Linting #{file}"
    end

    Dir[Rails.root.join('app/assets/javascript/**/*.coffee').to_s].each do |file|
      puts "linting #{file}"
    end
  end
end

