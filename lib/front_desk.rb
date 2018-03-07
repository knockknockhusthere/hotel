require 'pry'
require 'date'

module Hotel
  class FrontDesk
    attr_accessor :rooms_list, :reservations

    def initialize()
      @rooms_list = (1..20).to_a
      @reservations = []
    end

    def create_reservation(room_id, start_day,end_day)
     id = @reservations.length + 1
     start_date = Date.parse(start_day)
     end_date = Date.parse(end_day)
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

    # def created_rooms()
    #   all_rooms = []
    #
    #   NUM_OF_ROOMS.times do |i, trip|
    #     trip = Hotel::Room.new(room_id: i)
    #     all_rooms << trip
    #   end

    #   return all_rooms
    # end

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
# end
    # end

    #

    # def search_res_by_date(date)
    #
    # end
  end
end
