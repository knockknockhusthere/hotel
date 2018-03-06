module Hotel
  class Reservation
    attr_accessor :res_id, :start_date, :end_date, :cost

    def initialize(input)
      @res_id = input[:res_id]
      @start_date = input[:start_date]
      @end_date = input[:end_date]
      @cost = input[:total_cost]
      @room_id = nil
    end
  end
end
