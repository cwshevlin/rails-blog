namespace :db do

desc "Drop Create and Migrate yo DB"
  task :yolo => ["db:drop", "db:create", "db:migrate"]

end
