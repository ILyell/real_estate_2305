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

    it 'starts with no rooms by default' do
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
end