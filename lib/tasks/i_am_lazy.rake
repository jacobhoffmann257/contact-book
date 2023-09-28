task(:howdy) do
  pp "Hello!"
end
task(:world) do
  pp "World!"
end
task(:test => :environment) do
#Contact.all.order({:last_name)
Contact.all.order({ :last_name => :asc })
end
task(:oldest => :environment) do 
   x = Contact.where({:date_of_birth => Contact.maximum(:date_of_birth)})
   pp x
end
task(:youngest => :environment) do
  x = Contact.where({:date_of_birth => Contact.minimum(:date_of_birth)})
  pp x
end
task(:ca => :environment) do 
  x = Contact.all.where({:state => "CA"})
  pp x.length
end
task(:g => :environment) do
  x = Contact.all.where("last_name LIKE ?", "%g%")
  pp x.length
end
task(:sample_contacts => :environment) do
  if Rails.env.development?
    Contact.destroy_all
  end
  200.times do 
    x= Contact.new
    x.first_name = Faker::Name.first_name
    x.last_name = Faker::Name.last_name
    x.date_of_birth = Faker::Date.birthday(min_age: 0, max_age: 120)
    x.street_address_1 = Faker::Address.street_address
    x.street_address_2  = Faker::Address.secondary_address
    x.city = Faker::Address.city
    x.state = Faker::Address.state_abbr
    x.zip = Faker::Address.zip
    x.phone = Faker::PhoneNumber.phone_number
    x.notes = Faker::Movies::HarryPotter.quote

    x.save
  end
  x= Contact.new
  x.first_name = "Minnie"
  x.last_name = "Mouse"
  x.date_of_birth = "November 18, 1928"
  x.save
  
  x = Contact.new 
  x.first_name = "Mickey"
  x.last_name = "Mouse"
  x.date_of_birth = "May 15, 1928"
  x.save
end
