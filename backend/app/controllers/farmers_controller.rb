class FarmersController < ApplicationController
    #Routings
    get '/farmers' do
        farmers = Farmer.all
        farmers.to_json
    end


    # get '/farmers' do 
    #     farmers = Farmer.all
    #     farmers.to_json
    # end

    #add farmer
    # post '/farmers' do
    #     farmer = params[:farmer]
    #     farm = params[:farm]
    #     vegetable = params[:vegetable]

    #     if(farmer.present? && farm.present? && vegetable.present?)
    #         farmer = Faremr.create(farmer: farmer, vegetable: vegeteable)
    # end

    # #delete
    # delete 'farmers/:id' do
    #     count_farmers = Farmer.where(id: params[:id]).count()
    #     if count_farmers > 0
    #         farmer = Farmer.find(params[:id])
    #         farmer.destroy
    #         message = {success: => "Farmer deleted successfully!"}
    #         message.to_json

    #     else
    #         message = {:error => "Farmer does not exist!"}
    #         message.to_json
    #     end
    # end
end