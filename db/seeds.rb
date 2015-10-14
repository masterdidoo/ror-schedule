country = Country.create(name: 'US')
state = State.create(name: 'NC', country: country)
raleigh = City.create({name: 'RALEIGH', state: state})
City.create([
                {name: 'ABERDEEN', state: state},
                {name: 'BROADWAY', state: state},
                {name: 'BUNNLEVEL', state: state},
                {name: 'BUTNER', state: state},
                {name: 'CAMERON', state: state},
                {name: 'CARTHAGE', state: state},
                {name: 'CLINTON', state: state},
                {name: 'CREEDMOOR', state: state},
                {name: 'DUNN', state: state},
                {name: 'DURHAM', state: state},
                {name: 'EASTOVER', state: state},
                {name: 'ERWIN', state: state},
                {name: 'FAIRMONT', state: state},
                {name: 'FAYETTEVILLE', state: state},
                {name: 'FORT BRAGG', state: state},
                {name: 'HAMPSTEAD', state: state},
                {name: 'HILLSBOROUGH', state: state},
                {name: 'HOPE MILLS', state: state},
                {name: 'LAURINBURG', state: state},
                {name: 'LILLINGTON', state: state},
                {name: 'LINDEN', state: state},
                {name: 'LUMBER BRIDGE', state: state},
                {name: 'LUMBERTON', state: state},
                {name: 'MAXTON', state: state},
                {name: 'PARKTON', state: state},
                {name: 'PEMBROKE', state: state},
                {name: 'PINEHURST', state: state},
                {name: 'RAEFORD', state: state},
                {name: 'ROCKINGHAM', state: state},
                {name: 'ROSEBORO', state: state},
                {name: 'SALEMBURG', state: state},
                {name: 'SANFORD', state: state},
                {name: 'SOUTHERN PINES', state: state},
                {name: 'SPRING LAKE', state: state},
                {name: 'STEDMAN', state: state},
                {name: 'WEST END', state: state},
                {name: 'WHITE OAK', state: state},
                {name: 'WHITEVILLE', state: state}
            ])

address = Address.create({city: raleigh, zip: '27603', raw_line: '1505 S BLOUNT ST'})

Point.create({
                 address: address,
                 name: 'Larkin LLC',
                 phone: ''
             })

City.all.each do |city|
  Point.create({
                   address: Address.create({city: city, zip: '27603', raw_line: '1505 S BLOUNT ST'}),
                   name: 'Test Client in '+city.name,
                   phone: ''
               })
end

Driver.create([
                  {
                      name: 'Driver 1',
                      schedule: 0,
                      truck: Truck.create({
                                              start_address: address,
                                              number: '123',
                                              volume: 1000
                                          })
                  },
                  {
                      name: 'Driver 2',
                      schedule: 1,
                      truck: Truck.create({
                                              start_address: address,
                                              number: '321',
                                              volume: 1000
                                          })
                  }
              ])