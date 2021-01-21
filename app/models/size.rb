class Size < ActiveHash::Base
  self.data =[
   { id: 1, name: '--' },
   { id: 2, name: '22cm' },
   { id: 3, name: '22.5cm' },
   { id: 4, name: '23cm' },
   { id: 5, name: '23.5cm' },
   { id: 6, name: '24cm' },
   { id: 7, name: '24.5cm' },
   { id: 8, name: '25cm' },
   { id: 9, name: '25.5cm' },
   { id: 10, name: '26cm' },
   { id: 11, name: '26.5cm' },
   { id: 12, name: '27cm' },
   { id: 13, name: '27.5cm' },
   { id: 14, name: '28cm' },
   { id: 15, name: '28.5cm' },
   { id: 16, name: '29cm' },
   { id: 17, name: '29.5cm' },
   { id: 18, name: '30cm' }
 ]
  
 include ActiveHash::Associations
 has_many :users
 has_many :items

end
