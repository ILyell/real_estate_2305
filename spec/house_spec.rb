require "./lib/room"
require "./lib/house"

RSpec.describe House do

    it 'exist' do
        house = House.new("$400000", "123 sugar lane")

        expect(house).to be_a(House)
    end

    it 'Holds an price and a address' do
        house = House.new("$400000", "123 sugar lane")

        expect(house.price).to eq(400000)
        expect(house.address).to eq("123 sugar lane")
    end

    it 'Starts with no rooms by default' do
        house = House.new("$400000", "123 sugar lane")

        expect(house.rooms).to eq([])
    end

    it 'Can add rooms' do
        house = House.new("$400000", "123 sugar lane")
        room1 = Room.new(:bedroom, 10, '13')
        room2 = Room.new(:bedroom, 11, '15')

        expect(house.rooms).to eq([])
        house.add_room(room1)
        expect(house.rooms).to eq([room1])
        house.add_room(room2)
        expect(house.rooms).to eq([room1, room2])
    end

    it 'can check if above market average' do 
        house1 = House.new("$400000", "123 sugar lane")
        house2 = House.new("$600000", "123 sugar lane")
        
        expect(house1.above_market_average?).to eq(false)
        expect(house2.above_market_average?).to eq(true)
    end

    it 'Can list rooms by category' do
        house = House.new("$400000", "123 sugar lane")
        room1 = Room.new(:bedroom, 10, '13')
        room2 = Room.new(:bedroom, 11, '15')
        room3 = Room.new(:living_room, 25, '15')
        room4 = Room.new(:basement, 30, '41')

        house.add_room(room1)
        house.add_room(room2)
        house.add_room(room3)
        house.add_room(room4)

        expect(house.rooms_from_category(:bedroom)).to eq([room1, room2])
        expect(house.rooms_from_category(:basement)).to eq([room4])
    end

    it 'Can list the total area of rooms' do
        house = House.new("$400000", "123 sugar lane")
        room1 = Room.new(:bedroom, 10, '13')
        room2 = Room.new(:bedroom, 11, '15')
        room3 = Room.new(:living_room, 25, '15')
        room4 = Room.new(:basement, 30, '41')

        house.add_room(room1)
        house.add_room(room2)
        house.add_room(room3)
        house.add_room(room4)

        expect(house.area).to eq(1900)
    end

    it 'Will list a hash with the price and address' do
        house = House.new("$400000", "123 sugar lane")
        room1 = Room.new(:bedroom, 10, '13')
        room2 = Room.new(:bedroom, 11, '15')
        room3 = Room.new(:living_room, 25, '15')
        room4 = Room.new(:basement, 30, '41')

        house.add_room(room1)
        house.add_room(room2)
        house.add_room(room3)
        house.add_room(room4)

        expect(house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
    end

    it 'Can calculate price per square foot' do
        house = House.new("$400000", "123 sugar lane")
        room1 = Room.new(:bedroom, 10, '13')
        room2 = Room.new(:bedroom, 11, '15')
        room3 = Room.new(:living_room, 25, '15')
        room4 = Room.new(:basement, 30, '41')

        house.add_room(room1)
        house.add_room(room2)
        house.add_room(room3)
        house.add_room(room4)

        expect(house.price_per_square_foot).to eq(210.53)
    end

    it 'can sort rooms by area in a list with each room from greatest to least area' do 
        house = House.new("$400000", "123 sugar lane")
        room1 = Room.new(:bedroom, 10, '13')
        room2 = Room.new(:bedroom, 11, '15')
        room3 = Room.new(:living_room, 25, '15')
        room4 = Room.new(:basement, 30, '41')

        house.add_room(room1)
        house.add_room(room2)
        house.add_room(room3)
        house.add_room(room4)

        expect(house.rooms_sorted_by_area).to eq(room4, room3, room2, room1)
    end

    it 'Can list rooms in a hash by category' do 
        house = House.new("$400000", "123 sugar lane")
        room1 = Room.new(:bedroom, 10, '13')
        room2 = Room.new(:bedroom, 11, '15')
        room3 = Room.new(:living_room, 25, '15')
        room4 = Room.new(:basement, 30, '41')

        house.add_room(room1)
        house.add_room(room2)
        house.add_room(room3)
        house.add_room(room4)

        expect(house.rooms_by_category).to eq({:bedroom=>[room1, room2], :living_room=>[room3], :basement=>[room4]})
    end
end