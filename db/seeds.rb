# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

luke = User.create(name: 'Luke Skywalker', email: 'luke@rebelalliace.org')
leia = User.create(name: 'Leia Skywalker', email: 'leia@rebelalliace.org')
han_solo = User.create(name: 'Han Solo', email: 'hansolo@bol.com.br')
chewie = User.create(name: 'Chewbacca', email: 'chewbacca@kashyyyk.gov')
obiwan = User.create(name: 'Obi-Wan Kenobi', email: 'kenobi@jediconcil.org')
vader = User.create(name: 'Darth Vader', email: 'vader@galacticempire.gov')
emperor = User.create(name: 'Sheev Palpatine', email: 'emperor@galacticempire.gov')

red_crystal = Product.create(name: 'Red Crystal', value: 1500.00)
blue_crystal = Product.create(name: 'Blue Crystal', value: 2500.00)
green_crystal = Product.create(name: 'Green Crystal', value: 5500.00)
white_crystal = Product.create(name: 'White Crystal', value: 50000.00)
black_crystal = Product.create(name: 'Black Crystal', value: 1500000.00)
pistol = Product.create(name: 'DH-17 blaster pistol', value: 500.00)
rifle = Product.create(name: 'E-11 blaster rifle', value: 750.00)
jedi_robe = Product.create(name: 'Jedi Robe', value: 50.00)
lego_millennium_falcon = Product.create(name: 'Lego Millennium Falcon', value: 1500.00)
hair_conditioner = Product.create(name: 'Hair Conditioner - Plus Size', value: 200.00)
bowcaster = Product.create(name: 'Bowcaster', value: 500.00)
xwing = Product.create(name: 'X-wing starfighter', value: 100000.00)
tie_fighter = Product.create(name: 'TIE Fighter', value: 200000.00)
tie_advanced = Product.create(name: 'TIE Advanced x1', value: 500000.00)

lukes_order = Order.create(user: luke, origin_device: 2)
leias_order = Order.create(user: leia, origin_device: 2)
obiwans_order = Order.create(user: obiwan, origin_device: 3)
han_solos_order = Order.create(user: han_solo, origin_device: 3)
chewies_order = Order.create(user: chewie, origin_device: 1)
vaders_order = Order.create(user: vader, origin_device: 2)
emperors_order = Order.create(user: emperor, origin_device: 1)

lukes_order.add_item(blue_crystal, blue_crystal.value)
lukes_order.add_item(green_crystal, green_crystal.value)
lukes_order.add_item(pistol, pistol.value)
lukes_order.add_item(xwing, xwing.value)

leias_order.add_item(pistol, pistol.value)
10.times do
  leias_order.add_item(xwing, xwing.value)
end

obiwans_order.add_item(blue_crystal, blue_crystal.value)
obiwans_order.add_item(jedi_robe, jedi_robe.value)

han_solos_order.add_item(pistol, pistol.value)
han_solos_order.add_item(lego_millennium_falcon, lego_millennium_falcon.value)

chewies_order.add_item(bowcaster, bowcaster.value)
chewies_order.add_item(hair_conditioner, hair_conditioner.value)

vaders_order.add_item(red_crystal, red_crystal.value)
vaders_order.add_item(tie_advanced, tie_advanced.value)

30.times do
  emperors_order.add_item(tie_fighter, tie_fighter.value)
end

