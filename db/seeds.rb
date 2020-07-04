# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Interest.destroy_all
Detail.destroy_all
Event.destroy_all
Asso.destroy_all
User.destroy_all

puts "create admin ."
User.create(pseudo: 'Admin', email: 'admin@smart.com', password: 'password', password_confirmation: 'password', admin: true)

print "create single users "
(1..10).each do |i|
  pseudo = "single_user_#{i}"
  email = "single_user_#{i}@gmail.com"
  password = 'password'
  register = "#{i}12HJ3432IO#{i}"
  user = User.new(pseudo: pseudo, email: email, password: password, password_confirmation: password) #, admin: false
  user.save
  print '.u'
  user.build_detail(description:"Le #{i}ème plus beau et plus fort ").save
  print 'd'
  if i.even?
    event = user.events.build(event_name:"Papaïou Party_#{i}")
    event.save
    print 'e'
    event.build_detail(description:'frisson frisson').save
    print 'd'
  end
  Interest.create(user_id: user.id, couple_status: InterestCoupleStatus::COUPLE_STATUSES.sample)
  print 'i'
end

puts
print "create referent users + assos "
(1..10).each do |i|
  pseudo = "user_referent_#{i}"
  email = "user_referent_#{i}@gmail.com"
  password = 'password'
  register = "#{i}12HJ3432IO#{i}"
  name = "association_#{i}"
  user = User.new(pseudo: pseudo, email: email, password: password, password_confirmation: password) # , admin: false
  user.save
  print '.u'
  user.build_detail(description:"Le #{i}ème associatif").save
  print 'd'
  asso = Asso.new(register: register, user_id: user.id, name: name)
  asso.save
  print 'a'
  asso.build_detail(description:'Panou panou').save
  print 'd'
  if i.even?
    event= asso.events.build(event_name:"À la queue leu leu_#{i}")
    event.save
    print 'e'
    event.build_detail(description:'Pata pata').save
    print 'd'
  end
end




