# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user_object
doorkeeper_application = Doorkeeper::Application.new(name: user_object.first[0], uid: 'd-YWZ9snZeWq0xAGsJm_WniaaQjoTi-wIUeCybt6OXY', secret: '3y3IoosAveNu5LL2B8cr7eIZxHCC6Kn9rTZCV2r3Xfc', redirect_uri: redirect_uri, owner_id: user.id, owner_type: "Admin", company_name: "#{user_object.first[0]} Company", application_description: "This is application description for #{user_object.first[0]}")      doorkeeper_application.save(validate: false)


