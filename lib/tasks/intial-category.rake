require "#{Rails.root}/lib/tasks/utils"

namespace :db do
    desc "Reseed the categories."
    task :categories => :environment do
        # use :environment task to initial rails and other nessary env.
        sh 'rake db:drop && rake db:migrate'
        categories = YAML.load(  File.read("#{Rails.root}/db/category/seeds.yml") )
        Utils::CreateCate.new.render( categories, parent_id = 0)
    end
end