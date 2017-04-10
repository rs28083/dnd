class CharCreateController < ApplicationController
skip_before_action :verify_authenticity_token
    def new
        @character = Character.new(character_params)
    end
    
    def create
        @statString = params["str"] + "," + params["dex"] + "," + params["con"] + "," + params["int"] + "," + params["wis"] + "," + params["cha"]
        character_params = { :stats => @statString, :race => params["race"], :charclass => params["class"], :userid => 1, :label => params["label"], :name => params["name"]}
        @character = Character.create(stats: @statString, race: params["race"],charclass: params["class"], userid: 1, label: params["label"], name: params["name"])

        render 'show'
       
    end
    
    def show 
        @character = Character.find(params[:id])
    end
    
    def edit
        @character = Character.find(params[:id])
    end
    
    def update 
        @character = Character.find(params[:id])
        if @character.update(character_params)
            redirect_to @Character
        else
            render 'edit'
        end
    end
    
    def delete
        @character = Character.find(params[:id])
        @character.destroy
        
        redirect_to 'welcome/index'
    end
end