require 'pry'
require 'date'

module Hotel
  ROOM_COST = 200

  class FrontDesk
    attr_accessor :rooms_list, :reservations

    def initialize()
      @rooms_list = (1..20).to_a
      @reservations = []
    end

    def create_reservation(room_id, start_day,end_day)
      id = @reservations.length + 1
      new_res = ""
      start_date = Date.parse(start_day)
      end_date = Date.parse(end_day)

      if start_date < DateTime.now
        raise ArgumentError.new("Reservation must start after today!")
      end

      if (start_date == end_date)
        raise ArgumentError.new("The reservation cannot start and end on the same date!")
      end

      new_res = Hotel::Reservation.new(res_id: id, room_id: room_id, start_date: start_date, end_date: end_date)
      @reservations << new_res
      return new_res
    end

    def search_res_by_date(date)
      day = Date.parse(date)
      res_on_day = []
      @reservations.each do |reservation|
        if reservation.start_date <= day && reservation.end_date > day
          res_on_day << reservation
        end
      end
      return res_on_day
    end

    def find_res_by_id(id)
      @reservations.each do |res|
        return res if res.res_id == id
        raise ArgumentError.new("Reservation ID does not exist!")
        return nil
      end
    end

    def res_cost(res_id)
      res = find_res_by_id(res_id)
      return res.total_cost
    end

    def find_available_rooms(start_date, end_date)
      available_rooms = []
      @reservations.each do |res|
        
      end
    end


    # def find_available_room(start_day, end_day)
    #   (start_day...end_day).each do |date|
    #     rooms_list.each do |room|
    #       while room.reserved_days != date
    #         #I DONT KNOW. IS THIS LOOP RIGHT?
    #
    #       end
    #     end
    #   end
    # end
    # Do stuff with date
  end
end
