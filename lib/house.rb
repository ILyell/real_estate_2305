class House

    attr_reader  :address, :rooms
    
    def initialize(price, address)
        @price = price
        @address = address
        @rooms = []
    end
    
    def price
        @price.tr("$","").to_i
    end

    def add_room(room)
        @rooms << room
    end

    def above_market_average?
        above = false
        above = true if price > 500000
        above
    end

    def rooms_from_category(category)
        rooms.find_all do |room|
            room.category == category
        end
    end

    def area
        total_area = 0
        rooms.each do |room|
            total_area += room.area
        end
        total_area
    end

    def details
        details = {
            "price" => price,
            "address" => address
        }
    end
end