task :test_rake_task do
	puts "test_rake_task task ran just fine :)"
end

desc "Display the environment variables"
task :env do
	ENV.each_pair {|key, val| puts "#{key}: #{val}" }.sort
end
