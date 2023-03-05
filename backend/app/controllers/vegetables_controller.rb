class VegetablesController < ApplicationController


    get '/vegetables' do 
        vegetables = Vegetable.all
        vegetables.to_json
    end
end