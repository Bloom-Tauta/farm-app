class FarmsController < ApplicationController
    #Routings

    #Get Farms
    get '/farms' do 
        farms = Farm.all
        farms.to_json
    end

    #Get Single Farm
    get '/farms/:id' do
        farm = Farm.find_by(id: params[:id])
        farm.to_json
    end


    #Add Farms
    post '/farms' do
        name = params[:name]
        location = params[:location]
        farmer_id = params[:farmer_id]
    
        if(name.present? && location.present? && farmer_id.present?)
            check_name_exists = Farm.where(name: name).count()
            puts("XXXXXXXXXXXXXXX", check_name_exists)
                 
            if check_name_exists < 1
                farm = Farm.create(name: name, location: location, farmer_id: farmer_id)
                if farm
                    message = {:success => "Farm created successfully!"}
                    message.to_json
                else 
                    message = {:error => "Farm failed to create!!"}
                    message.to_json
                end

            else
                message = {:error => "Farm exists!!"}
                message.to_json
            end

        else
            message = {:error => "All fields required!!"}
            message.to_json
        end

    end


    #Updating Farm Field
    patch '/farms/:id' do
        check_farm_existence = Farm.exists?(id: params[:id])
        if check_farm_existence
            name = params[:name]
            location = params[:location]
            farmer_id = params[:farmer_id]
             if (name.present? && location.present? && farmer_id.present?)
                #update
                farm = Farm.find_by(id: params[:id])
                farm.update(name: name, location: location, farmer_id: farmer_id)
                message = {:success => "Farm updated successfully!"}
                message.to_json
             else
                message = {:error => "Farm not updated!!"}
                message.to_json
             end
        else
            message = {:success => "Farm already updated!!"}
            message.to_json
        end

    end


    #Delete Farm
    delete '/farms/:id' do
        count_farms = Farm.where(id: params[:id]).count()
        if count_farms > 0
            farm = Farm.find(params[:id])
            farm.destroy
            message = {:success => "Farm deleted successfully!"}
            message.to_json

        else
            message = {:error => "Farm already deleted!!"}
            message.to_json
        end 
    end


end