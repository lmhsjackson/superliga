director = Player.create(first_name: 'Juan', email: 'juan@something.com', last_name: 'Palotes', rank: '6K')
today = Date.today
l = League.create([
  { name: 'Superliga', start_date: today, end_date: today + 4.weeks, director: director },
  { name: 'Torneo 2', start_date: today + 1.year, end_date: today + 2.years, director: director }
])
