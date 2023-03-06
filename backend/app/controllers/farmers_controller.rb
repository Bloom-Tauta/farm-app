class FarmersController < ApplicationController
    #Routings

    #Get Farmers
    get '/farmers' do
        farmers = Farmer.all
        farmers.to_json
    end

    #Get Single Farmer
    get '/farmers/:id' do
        farmer = Farmer.find_by(id: params[:id])
        farmer.to_json
    end

    #Add Farmer
    post '/farmers' do
        name = params[:name]
        phone = params[:phone]
    
        if(name.present? && phone.present?)
            check_name_exists = Farmer.where(name: name).count()
            puts("XXXXXXXXXXXXXXX", check_name_exists)
                 
            if check_name_exists < 1
                farmer = Farmer.create(name: name, phone: phone)
                if farmer
                    message = {:success => "Farmer created successfully!"}
                    message.to_json
                else 
                    message = {:error => "Farmer failed to create!!"}
                    message.to_json
                end

            else
                message = {:error => "Farmer exists!!"}
                message.to_json
            end

        else
            message = {:error => "All fields required!!"}
            message.to_json
        end

    end

    #Updating Farmer
    patch '/farmers/:id' do
        check_farmer_existence = Farmer.exists?(id: params[:id])
        if check_farmer_existence
            name = params[:name]
            phone = params[:phone]
            
             if (name.present? && phone.present?)
                #update
                farmer = Farmer.find_by(id: params[:id])
                farmer.update(name: name, phone: phone)
                message = {:success => "Farmer updated successfully!"}
                message.to_json
             else
                message = {:error => "Farmer not updated!!"}
                message.to_json
             end
        else
            message = {:success => "Farmer already updated!!"}
            message.to_json
        end

    end

    #Delete Farmer
    delete '/farmers/:id' do
        count_farmers = Farmer.where(id: params[:id]).count()
        if count_farmers > 0
            farmer = Farmer.find(params[:id])
            farmer.destroy
            message = {:success => "Farmer deleted successfully!"}
            message.to_json

        else
            message = {:error => "Farmer does not exist!!"}
            message.to_json
        end 
    end


end