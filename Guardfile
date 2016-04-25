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