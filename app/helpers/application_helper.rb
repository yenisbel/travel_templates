require 'open-uri'
require 'json'

module ApplicationHelper

  def head_url( meth )
    key = '7zbmzs6jveeb8ck93rr5wu6f'
    return "https://api.eancdn.com/ean-services/rs/hotel/v3/#{meth}?cid=55505&minorRev=99&apiKey=#{key}&locale=en_US&currencyCode=USD"   
  end

  def hotel_json( options = {} )
    head = head_url('list')
    options[:city] ||= "Seattle"
    options[:state] ||= "WA"
    options[:country] ||= "US"
    options[:per_page] ||= "4"

    xml = "%3CHotelListRequest%3E%0A%20%20%20%20%3Ccity%3E#{options[:city]}%3C%2Fcity%3E%0A%20%20%20%20%3CstateProvinceCode%3E#{options[:state]}%3C%2FstateProvinceCode%3E%0A%20%20%20%20%3CcountryCode%3E#{options[:country]}%3C%2FcountryCode%3E%0A%20%20%20%20%3CarrivalDate%3E5%2F15%2F2014%3C%2FarrivalDate%3E%0A%20%20%20%20%3CdepartureDate%3E5%2F17%2F2014%3C%2FdepartureDate%3E%0A%20%20%20%20%3CRoomGroup%3E%0A%20%20%20%20%20%20%20%20%3CRoom%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3CnumberOfAdults%3E2%3C%2FnumberOfAdults%3E%0A%20%20%20%20%20%20%20%20%3C%2FRoom%3E%0A%20%20%20%20%3C%2FRoomGroup%3E%0A%20%20%20%20%3CnumberOfResults%3E#{options[:per_page]}%3C%2FnumberOfResults%3E%0A%3C%2FHotelListRequest%3E"

    url_of_json_service = "#{head}&xml=#{xml}"
    @hotels = JSON.parse(open(url_of_json_service).read)['HotelListResponse']['HotelList']['HotelSummary']
  end

  def room_json( hotel_id = '106347' )
    head = head_url 'avail'
    xml = "%3CHotelRoomAvailabilityRequest%3E%0A%20%20%20%20%3ChotelId%3E#{hotel_id}%3C%2FhotelId%3E%0A%20%20%20%20%3CarrivalDate%3E5%2F15%2F2014%3C%2FarrivalDate%3E%0A%20%20%20%20%3CdepartureDate%3E5%2F17%2F2014%3C%2FdepartureDate%3E%0A%20%20%20%20%3CincludeDetails%3Etrue%3C%2FincludeDetails%3E%0A%20%20%20%20%3CRoomGroup%3E%0A%20%20%20%20%20%20%20%20%3CRoom%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3CnumberOfAdults%3E2%3C%2FnumberOfAdults%3E%0A%20%20%20%20%20%20%20%20%3C%2FRoom%3E%0A%20%20%20%20%3C%2FRoomGroup%3E%0A%3C%2FHotelRoomAvailabilityRequest%3E"


    url_of_json_service = "#{head}&xml=#{xml}"
    @rooms = JSON.parse(open(url_of_json_service).read)['HotelRoomAvailabilityResponse']['HotelRoomResponse']

  end

end
