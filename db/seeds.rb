Restaurant.destroy_all
User.destroy_all

# Creando usuarios
puts "Creando usuarios"
User.create!(email: "pedro@gmail.com", password: "123456")
User.create!(email: "juan@gmail.com", password: "123456")

# Creando restaurantes
puts "Creando restaurantes"
Restaurant.create!(name: "El lomo feroz", address:"Av. Providencia 3500", user: User.first)
Restaurant.create!(name: "La carnecita roja", address:"Av. Las Condes 6780", user: User.first)
Restaurant.create!(name: "Los tres cerditos al spiedo", address:"Av. Recoleta 560", user: User.last)

