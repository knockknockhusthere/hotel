require_relative 'spec_helper'

describe 'reservation' do
  before do
    @new_reservation = Hotel::Reservation.new(room_id: 1, start_date: Time.now, end_date: Time.now)
  end

  describe 'initialize method' do
    it 'can create an instance of reservation' do
      @new_reservation.must_be_instance_of Hotel::Reservation
    end
  end
end
