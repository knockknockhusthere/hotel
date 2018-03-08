require_relative 'spec_helper'
require 'pry'

describe 'FrontDesk class' do

  before do
    @new_front_desk = Hotel::FrontDesk.new()
  end
  describe 'initialize method' do
    it 'can create an instance of front desk' do
      @new_front_desk.must_be_instance_of Hotel::FrontDesk
    end

    it 'can create a array of 20 instances of rooms' do
      @new_front_desk.rooms_list.length.must_equal 20
      @new_front_desk.rooms_list.must_be_kind_of Array
      # @new_front_desk.rooms_list[0].must_be_instance_of Hotel::Room
    end
  end

  describe 'create_reservation method' do
    before do
      @new_res = @new_front_desk.create_reservation(4, '2018-03-09', '2018-3-14')
    end

    it 'can create a new instance of reservation' do
      @new_res.must_be_instance_of Hotel::Reservation
    end

    it 'gets added to room list of reservations' do
      @new_front_desk.reservations.length.must_equal 1
    end

    it 'begin and end date attributes are instances of date' do
      @new_res.start_date.must_be_instance_of Date
      @new_res.end_date.must_be_instance_of Date
    end

    it 'raises an error if start date is before today' do
      proc{@new_front_desk.create_reservation(4, '2018-03-01', '2018-3-14')}.must_raise ArgumentError
    end

    it 'raises an error if start date and end date are the same' do
      proc{@new_front_desk.create_reservation(4, '2018-03-14', '2018-3-14')}.must_raise ArgumentError
    end
  end

  describe 'search_res_by_date method' do
    before do
      @new_front_desk.create_reservation(4, '2018-03-09', '2018-3-24')
      @new_front_desk.create_reservation(5, '2018-03-10', '2018-3-14')
      @new_front_desk.create_reservation(6, '2018-03-15', '2018-3-30')
    end

    it 'can create an array of reservations falling on a certain day' do
      res_list = @new_front_desk.search_res_by_date('2018-03-15')
      res_list.must_be_kind_of Array
      res_list.length.must_equal 2
      res_list[1].room_id.must_equal 6
    end

    it 'does not include if date is reservation end date' do
      res_list = @new_front_desk.search_res_by_date('2018-03-14')
      res_list.must_be_kind_of Array
      res_list.length.must_equal 1
      res_list[0].room_id.must_equal 4
    end
  end

  describe 'find_res_by_id method' do
    before do
      @new_front_desk.create_reservation(4, '2018-03-09', '2018-3-24')
      @new_front_desk.create_reservation(5, '2018-03-10', '2018-3-14')
    end

    it 'returns the reservation instance' do
      found = @new_front_desk.find_res_by_id(1)
      found.must_be_instance_of Hotel::Reservation
      found.room_id.must_equal 4
    end

    it 'raises error if no id match' do
      proc{@new_front_desk.find_res_by_id(4)}.must_raise ArgumentError
    end
  end

  describe 'res_cost method' do
    before do
      @new_front_desk.create_reservation(4, '2018-03-09', '2018-3-24')
      @new_front_desk.create_reservation(5, '2018-03-10', '2018-3-14')
      @new_front_desk.create_reservation(6, '2018-03-15', '2018-3-30')
    end
    it 'can return the total cost of selected reservation' do
      @new_front_desk.res_cost(1).must_equal 3000
    end

    it 'can raise error if id does not exist' do
      proc{ @new_front_desk.res_cost(30) }.must_raise ArgumentError
    end
  end
end

#out of rooms handle
