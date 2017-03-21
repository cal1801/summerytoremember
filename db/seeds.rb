# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'contacts.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Contact.new
  t.f_name = row['f_name']
  t.l_name = row['l_name']
  t.email = row['email']
  t.save

  camp = Camp.find_by_name row['camp']
  camp.update_column('contact_id', t.id)
  puts "#{t.f_name}, #{t.l_name} saved for #{camp.name}"

  user = User.create(email:t.email,password:"pccca_2017",:password_confirmation => "pccca_2017")
end

puts "There are now #{Contact.count} rows in the contacts table"
