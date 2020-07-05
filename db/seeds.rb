# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Dropping models'
puts 'Tags'
Tag.destroy_all
puts 'Field'
Field.destroy_all
puts 'Interest'
Interest.destroy_all
puts 'Detail'
Detail.destroy_all
puts 'Event'
Event.destroy_all
puts 'Asso'
Asso.destroy_all
puts 'User'
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
  Interest.create(user_id: user.id,
                  couple_status: InterestCoupleStatus::COUPLE_STATUSES.sample,
                  my_research: InterestMyResearch::MY_RESEARCHES.sample
                  )
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
puts 'create followers relationships'
array_of_users = User.all[1..10]
array_of_users[0].follow(array_of_users[5])
array_of_users[0].follow(array_of_users[8])
array_of_users[1].follow(array_of_users[3])
array_of_users[1].follow(array_of_users[7])
array_of_users[2].follow(array_of_users[3])
array_of_users[2].follow(array_of_users[6])
array_of_users[3].follow(array_of_users[0])
array_of_users[3].follow(array_of_users[2])
array_of_users[4].follow(array_of_users[2])
array_of_users[4].follow(array_of_users[9])
array_of_users[5].follow(array_of_users[8])

puts 'create fields'
%w[loisirs humanitaire action_sociale soirées jeux sports prévention droits culture].each do |field_name|
  Field.create(name: field_name)
end
puts 'create tags'
assos = Asso.all
fields = Field.all
(1..11).each do |asso_id|
  asso = assos[asso_id%11]
  tag = Tag.create(asso:asso,field:fields.sample)
  print '.'
end





