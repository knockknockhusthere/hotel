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

    it 'begin and end date attributes are instances of time' do
      @new_res.start_date.must_be_instance_of Date
      @new_res.end_date.must_be_instance_of Date
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
    # check for last date as available
  end
end
