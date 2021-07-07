require 'csv'

# Create users
csv_text = File.read(Rails.root.join('lib', 'seeds', 'users.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = User.new
  t.id = row['id']
  t.username = row['email']
  t.password = 'password'
  t.first_name = row['firstName']
  t.last_name = row['lastName']
  t.initials = row['initials']
  t.email = row['email']
  
  date  = row['created_at'].split('/')
  t.created_at = date[1] + '/' + date[0] + '/' + date[2]
  t.updated_at = date[1] + '/' + date[0] + '/' + date[2]
  t.save
  puts "#{t.username} saved"
end

puts "There are now #{User.count} rows in the user table"

# Create products
csv_text = File.read(Rails.root.join('lib', 'seeds', 'products.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Product.new
  t.id = row['id']
  t.name = row['name']
  t.price = row['price'][1..-1]
  
  date  = row['created_at'].split('/')
  t.created_at = date[1] + '/' + date[0] + '/' + date[2]
  t.updated_at = date[1] + '/' + date[0] + '/' + date[2]
  t.save
  puts "#{t.name} saved"
end

puts "There are now #{Product.count} rows in the product table"

# Create orders
csv_text = File.read(Rails.root.join('lib', 'seeds', 'orders.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Order.new
  t.id = row['id']
  t.user_id = row['user_id']
  
  date  = row['created_at'].split('/')
  t.created_at = date[1] + '/' + date[0] + '/' + date[2]
  t.updated_at = date[1] + '/' + date[0] + '/' + date[2]
  t.save
  puts "#{t.id} saved"
end

puts "There are now #{Order.count} rows in the order table"

# Create quantities
csv_text = File.read(Rails.root.join('lib', 'seeds', 'quantities.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Quantity.new
  t.product_id = row['product_id']
  t.order_id = row['order_id']
  t.quantity = row['qty']
  t.save
  puts "#{t.product_id} - #{t.order_id} saved"
end

puts "There are now #{Quantity.count} rows in the quantity table"