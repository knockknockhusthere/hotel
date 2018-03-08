require_relative 'spec_helper'

describe 'reservation' do
  before do
    @new_res = Hotel::Reservation.new(room_id: 1, start_date: '2018-04-19', end_date: '2018-04-23')
  end

  describe 'initialize method' do
    it 'can create an instance of reservation' do
      @new_res.must_be_instance_of Hotel::Reservation
    end
  end

  describe 'total_cost method' do
    it 'can calculate total cost of that reservation' do
      @new_res.total_cost.must_equal 800
    end
  end
end
