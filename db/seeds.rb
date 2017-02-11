# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.delete_all
loc = Location.new(name:"Los Angeles", slug:"los-angeles")
loc.save

Partner.delete_all
partner = Partner.new(name: "The Bay Foundation", slug:"the_bay_foundation",
  logo_aws_url: "https://s3.amazonaws.com/climatecents/logos/Bay-Foundation-logo-155x155.png")
partner.save

partner = Partner.new(name: "MEND - Meet Each Need with Dignity", slug: "MEND_meet_each_need_with_dignity",
  logo_aws_url: "https://s3.amazonaws.com/climatecents/logos/MEND-logo.jpg")
partner.save

partner = Partner.new(name: "Isidore Electronics Recycling", slug: "isidore_electronics_recycling",
  logo_aws_url: "https://s3.amazonaws.com/climatecents/logos/Isidore-Logo-155.png")
partner.save

partner = Partner.new(name: "GRID Alternatives", slug: "GRID_alternatives",
  logo_aws_url: "https://s3.amazonaws.com/climatecents/logos/GridAlternativeslogo.png")
partner.save
