organizations = Organization.create([
  { name: 'AviaSales' },
  { name: 'GreatBank' },
  { name: 'CodingGuys' }
])
categories = Category.create([
  { name: 'first_course' },
  { name: 'main_course' },
  { name: 'drinks' }
])

first_course_items = Item.create([
  { name: 'Loaded Potato Soup',       price: 100, category: categories[0] },
  { name: 'Beef Daube Provencal',     price: 80,  category: categories[0] },
  { name: 'Tortilla Meatball Soup',   price: 110, category: categories[0] },
  { name: 'Shallot Soup',             price: 105, category: categories[0] },
  { name: 'Broccoli and Cheese Soup', price: 105, category: categories[0] },
  { name: 'Tomato-Basil Soup',        price: 115, category: categories[0] },
  { name: 'Beef and Guinness Stew',   price: 125, category: categories[0] }
])
main_course_items = Item.create([
  { name: 'Aida’s Coriander Chicken',     price: 130, category: categories[1] },
  { name: 'Apple and Sausage Pie',        price: 100, category: categories[1] },
  { name: 'Apricot Chicken',              price: 110, category: categories[1] },
  { name: 'Arroz Con Pollo',              price: 105, category: categories[1] },
  { name: 'Artichoke and Shrimp Risotto', price: 105, category: categories[1] },
  { name: 'Bacon-wrapped Pork Roast',     price: 115, category: categories[1] },
  { name: 'Baked Chicken Parmesan',       price: 125, category: categories[1] }
])
drinks_items = Item.create([
  { name: 'Black tea', price: 30,  category: categories[2] },
  { name: 'Coca-Cola', price: 80,  category: categories[2] },
  { name: 'Dark-Beer', price: 140, category: categories[2] },
  { name: 'Sprite',    price: 70,  category: categories[2] },
  { name: 'Dr Pepper', price: 110, category: categories[2] }
])

# (1..5).each do |day_id|
#   DayMenu.create(
#     day_id: day_id,
#     items:  first_course_items.sample(3) + main_course_items.sample(3) + drinks_items.sample(3)
#     created_at: DateTime.now - 8.days
#   )
# end
(0..6).each do |day_id|
  DayMenu.create(
    day_id: day_id,
    items:  first_course_items.sample(3) + main_course_items.sample(3) + drinks_items.sample(3)
    created_at: DateTime.now - 8.days
  )
end