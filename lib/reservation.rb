module Hotel

  class Reservation
    attr_accessor :res_id, :start_date, :end_date, :cost, :room_id
    def initialize(input)
      @res_id = input[:res_id]
      @start_date = input[:start_date]
      @end_date = input[:end_date]
      @room_id = input[:room_id]
      @cost = total_cost
    end

    def total_cost()
      res_length = (@start_date...@end_date).to_a.length
      cost = ROOM_COST * res_length
      return cost
    end
  end
end
