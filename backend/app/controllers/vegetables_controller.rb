class VegetablesController < ApplicationController
    #Get Vegetables
    get '/vegetables' do 
        vegetables = Vegetable.all
        vegetables.to_json
    end

    #Get Single Vegetable
    get '/vegetables/:id' do
        vegetable = Vegetable.find_by(id: params[:id])
        vegetable.to_json
    end


    #Add Vegetable
    post '/vegetables' do
        name = params[:name]
        description = params[:description]
        review = params[:review]
        farm_id = params[:farm_id]
        farmer_id = params[:farmer_id]

    
        if(name.present? && description.present? && review.present? && farm_id.present? && farmer_id.present?)
            check_name_exists = Vegetable.where(name: name).count()
            puts("XXXXXXXXXXXXX", check_name_exists)
                 
            if check_name_exists < 1
                vegetable = Vegetable.create(name: name, description: description, review: review, farm_id: farm_id, farmer_id: farmer_id)
                if vegetable
                    message = {:success => "Vegetable created successfully!"}
                    message.to_json
                else 
                    message = {:error => "Vegetable failed to create!!"}
                    message.to_json
                end

            else
                message = {:error => "Vegetable exists!!"}
                message.to_json
            end

        else
            message = {:error => "All fields required!!"}
            message.to_json
        end

    end


    #Updating Vegetbale
    patch '/vegetables/:id' do
        check_vegetable_existence = Vegetable.exists?(id: params[:id])
        if check_vegetable_existence
            name = params[:name]
            description = params[:description]
            review = params[:review]
            farm_id = params[:farm_id]
            farmer_id = params[:farmer_id]
            
             if (name.present? && description.present? && review.present? && farm_id.present? && farmer_id.present?)
                #update
                vegetable = Vegetable.find_by(id: params[:id])
                vegetable.update(name: name, description: description, review: review, farm_id: farm_id, farmer_id: farmer_id)
                message = {:success => "Vegetable updated successfully!"}
                message.to_json
             else
                message = {:error => "Vegetable not updated!!"}
                message.to_json
             end
        else
            message = {:success => "Vegetable already updated!!"}
            message.to_json
        end

    end


    #Deleting Vegetable
    delete '/vegetables/:id' do
        count_vegetables = Vegetable.where(id: params[:id]).count()
        if count_vegetables > 0
            vegetable = Vegetable.find(params[:id])
            vegetable.destroy
            message = {:success => "Vegetable deleted successfully!"}
            message.to_json

        else
            message = {:error => "Vegetable already deleted!!"}
            message.to_json
        end 
    end

end