# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# 2. Creamos los 10 usuarios
users = 10.times.map do |i|
  User.create!(
    email:      "user#{i+1}@example.com",
    first_name: "First#{i+1}",
    last_name:  "Last#{i+1}"
  )
end

# 3. Creamos 10 chats
chats = users.each_cons(2).map do |sender, receiver|
  Chat.create!(
    sender_id:   sender.id,
    receiver_id: receiver.id
  )
end

# Hacemos un chat entre el primer y el ultimo usuario
chats << Chat.create!(sender_id: users.last.id, receiver_id: users.first.id)

# 4. creamos 10 mensajes con autores aleatorios
chats.first(10).each_with_index do |chat, idx|
  author = idx.even? ? users[idx] : users[(idx+1) % users.size]
  Message.create!(
    chat_id: chat.id,
    user_id: author.id,
    body:    "Test message ##{idx+1} from #{author.first_name}"
  )
end

puts "Seed finished:"
puts "  Users:    #{User.count}"
puts "  Chats:    #{Chat.count}"
puts "  Messages: #{Message.count}"
