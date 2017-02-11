# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.delete_all
Partner.delete_all
Project.delete_all

loc = Location.new(name:"Los Angeles", slug:"los-angeles")
loc.save

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

project = Project.new(
  location_id: loc.id,
  partner_id: partner.id,
  name: "Solar Panels for Youth",
  blurb: "Climate Cents is partnering with GRID Alternatives to install solar power systems for nonprofits serving the poorest Angelenos. Solar produces no greenhouse gas emissions, which is especially important compared to the dirty coal which fuels too much of L.A.'s electricity. We're starting with Safe Place for Youth in Venice, which serves homeless youth.",
  description: "Climate Cents enables you to partner with GRID Alternatives to install solar power systems, free of charge, on the roofs of nonprofits serving our city’s most vulnerable population — homeless children and teens, women and men.\n
  Rooftop solar cuts their energy bills to almost nothing, allowing them to focus resources on serving those in need.")
project.save
