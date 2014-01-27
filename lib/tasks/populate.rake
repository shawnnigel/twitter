namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    
    j=30
    i=8
    
    
    User.populate 100 do |person|

      person.name    = Faker::Name.name
     
      person.email   = Faker::Internet.email
      person.phone   = Faker::PhoneNumber.phone_number
      person.sign_in_count=3
    end
  end
end