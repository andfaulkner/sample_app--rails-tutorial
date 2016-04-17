# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

guard :minitest do
  # with Minitest::Unit  <<< really inefficient but whatevs
  watch(%r{^test\/.*\/?test_.*\.rb$})                               { 'test' }
  watch(%r{^test\/.*_test\.rb$})                                    { 'test' }
  watch(%r{^app\/(controllers|helpers|models|views)\/.*\.e?rb$})    { 'test' }
  watch(%r{^config\/.*\.rb$})                                       { 'test' }
      # watch(%r{^lib\/(.*\/)?([^\/]+)\.rb$})                        { |m| "test\/#{m[1]}test_#{m[2]}.rb" }
      # watch(%r{^test\/test_helper\.rb$})                           { 'test' }

      # # with Minitest::Spec
      # # watch(%r{^spec/(.*)_spec\.rb$})
      # # watch(%r{^lib/(.+)\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
      # # watch(%r{^spec/spec_helper\.rb$}) { 'spec' }

      # # Rails 4
      # watch(%r{^config\/(.+)\.(rb|erb)$})                            {'test'}
      # watch(%r{^app\/models\/(.+)\.(rb|erb)$})                        {'test'}
      # watch(%r{^app\/(.+)\.(rb|erb)$})                               { |m| "test\/#{m[1]}_test.rb" }
      # watch(%r{^app\/controllers\/application_controller\.(erb|rb)$}) { 'test\/controllers' }
      # watch(%r{^app\/controllers\/(.+)_controller\.(erb|rb)$})        { |m| "test\/integration\/#{m[1]}_test.rb" }
      # watch(%r{^app\/views\/(.+)_mailer\/.+})                          { |m| "test\/mailers\/#{m[1]}_mailer_test.rb" }
      # watch(%r{^lib\/(.+)\.(erb|rb)$})                               { |m| "test\/lib\/#{m[1]}_test.rb" }
      # watch(%r{^test\/.+_test\.(erb|rb)$})                           {'test'}
      # watch(%r{^test\/test_helper\.(erb|rb)$})                       {'test'}
      # # run all tests again if views change
      # watch(%r{^app\/views/.*\.(erb|rb)$})                           {'test'}

  # Rails < 4
  # watch(%r{^app/controllers/(.*)\.rb$}) { |m| "test/functional/#{m[1]}_test.rb" }
  # watch(%r{^app/helpers/(.*)\.rb$})     { |m| "test/helpers/#{m[1]}_test.rb" }
  # watch(%r{^app/models/(.*)\.rb$})      { |m| "test/unit/#{m[1]}_test.rb" }
end



# guard :rspec, cmd: "bundle exec rspec" do
#   require "guard/rspec/dsl"
#   dsl = Guard::RSpec::Dsl.new(self)

#   # Feel free to open issues for suggestions and improvements

#   # RSpec files
#   rspec = dsl.rspec
#   watch(rspec.spec_helper) { rspec.spec_dir }
#   watch(rspec.spec_support) { rspec.spec_dir }
#   watch(rspec.spec_files)

#   # Ruby files
#   ruby = dsl.ruby
#   dsl.watch_spec_files_for(ruby.lib_files)

#   # Rails files
#   rails = dsl.rails(view_extensions: %w(erb haml slim))
#   dsl.watch_spec_files_for(rails.app_files)
#   dsl.watch_spec_files_for(rails.views)

#   watch(rails.controllers) do |m|
#     [
#       rspec.spec.("routing/#{m[1]}_routing"),
#       rspec.spec.("controllers/#{m[1]}_controller"),
#       rspec.spec.("acceptance/#{m[1]}")
#     ]
#   end

#   # Rails config changes
#   watch(rails.spec_helper)     { rspec.spec_dir }
#   watch(rails.routes)          { "#{rspec.spec_dir}/routing" }
#   watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }

#   # Capybara features specs
#   watch(rails.view_dirs)     { |m| rspec.spec.("features/#{m[1]}") }
#   watch(rails.layouts)       { |m| rspec.spec.("features/#{m[1]}") }

#   # Turnip features and steps
#   watch(%r{^spec/acceptance/(.+)\.feature$})
#   watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
#     Dir[File.join("**/#{m[1]}.feature")][0] || "spec/acceptance"
#   end

#   watch('spec/spec_helper.rb')                        { "spec" }
#   watch('config/routes.rb')                           { "spec/routing" }
#   watch('app/controllers/application_controller.rb')  { "spec/controllers" }
#   watch(%r{^spec/.+_spec\.rb$})
#   watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
#   watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" } # m1 is the fn, m2 is type e.g. erb
#   watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
#   watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }

# end