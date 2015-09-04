desc "Custom namespace for personal Database tasks"
namespace :database do 
    desc "Run special database rest procdeure of drop,create,migrate,seed"
    task :database_reseter do
        puts "running task: 'rake db:drop'"
        Rake::Task["db:drop"].invoke
        puts "Success"
        puts "running task: 'rake db:create'"
        Rake::Task["db:create"].invoke
        puts "Success"
        puts "running task: 'rake db:migrate'"
        Rake::Task["db:migrate"].invoke
        puts "Success"
        puts "running task: 'rake db:seed'"
        Rake::Task["db:seed"].invoke
        puts "Success"
    end

    desc "Run Database Commands on Heroku"
    task :heroku_database_reset do
        puts "running task: 'rake db:migrate'"
        Rake::Task["db:migrate"].invoke
        puts "Success"
        puts "running task: 'rake db:seed'"
        Rake::Task["db:seed"].invoke
        puts "Success"
    end
end