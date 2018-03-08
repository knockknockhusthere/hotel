require 'pry'
require 'date'

module Hotel
  ROOM_COST = 200
  NUM_OF_ROOMS = 20

  class FrontDesk
    attr_accessor :rooms_list, :reservations

    def initialize()
      @rooms_list = (1..NUM_OF_ROOMS).to_a
      @reservations = []
    end

    def create_reservation(room_id, start_day, end_day)
      id = @reservations.length + 1
      new_res = ""

      throw_date_args(start_day,end_day)
      start_date = Date.parse(start_day)
      end_date = Date.parse(end_day)

      available_rooms = find_available_rooms(start_day, end_day)

      if (available_rooms.include?room_id)
        new_res = Hotel::Reservation.new(res_id: id, room_id: room_id, start_date: start_date, end_date: end_date)
        @reservations << new_res
        return new_res
      else
        raise ArgumentError.new("Sorry, this room is not available on these dates!")
      end
    end

    def throw_date_args(start_day,end_day)
      start_date = Date.parse(start_day)
      end_date = Date.parse(end_day)

      if start_date < DateTime.now
        raise ArgumentError.new("Reservation must start after today!")
      end

      if (start_date == end_date || start_date > end_date)
        raise ArgumentError.new("The reservation must end after the start date!")
      end
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

    def overlap?(range1,range2)
      dates = [range1, range2]
      overlap = dates.inject(:&)
      if overlap.length > 0
        return true
      else
        return false
      end
    end

    def find_available_rooms(start_date,end_date)
      throw_date_args(start_date,end_date)
      available_rooms = @rooms_list
      search_range = (Date.parse(start_date)...Date.parse(end_date)).to_a

      @reservations.each do |res|
        if available_rooms.include?(res.room_id)
          res_range = ((res.start_date)...(res.end_date)).to_a
          occupied = overlap?(search_range,res_range)
          if occupied
            available_rooms.delete(res.room_id)
          end
        end
      end
      if available_rooms.length == 0
        puts "Sorry, we are fully booked! There are no available rooms"
        return nil
      else
        return available_rooms
      end
    end
  end
end
