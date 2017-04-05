class CharCreateController < ApplicationController
    def new
        @character = character.new(character_params)
    end
    def create
        @character = character.new(character_params)

        if @character.save
            redirect_to @character
        else
            render 'new'
        end
    end

    def edit
        
    end
    
    def delete
        
    end
    
end

    private 
        def char_params
            params.require(:character).permit()
        end