desc 'Runs rails_best_practices'
task :rails_best_practices do
  system 'rails_best_practices'
  exit false if $?.exitstatus > 0
end

