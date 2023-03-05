class FarmsController < ApplicationController


    get '/farms' do 
        farms = Farm.all
        farms.to_json
    end
end