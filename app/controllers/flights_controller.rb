require 'open-uri'
require 'json'


class FlightsController < ApplicationController

  # GET /flights
  # GET /flights.json
  def index
    dic_tem = [
      {
        :aeroline => "algo",
        :start => "algo",
      },
       {
        :aeroline => "algo",
        :start => "algo",
      }
    ]
    @flights = dic_tem            
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
  end

end


