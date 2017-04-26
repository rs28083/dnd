class CharCreateController < ApplicationController
skip_before_action :verify_authenticity_token
    def new
        @character = Character.new(character_params)
    end
    
    def create
        @id = 1
        if session[:current_user_id] then
            @id = session[:current_user_id]
        end
        @statString = params["str"] + "," + params["dex"] + "," + params["con"] + "," + params["int"] + "," + params["wis"] + "," + params["cha"]
        character_params = { :stats => @statString, :race => params["race"], :charclass => params["class"], :userid => 1, :label => params["label"], :name => params["name"]}
        @character = Character.create(stats: @statString, race: params["race"],charclass: params["class"], userid: @id, label: params["label"], name: params["name"])

        render 'show'
       
    end
    
    def show 
        @character = Character.find(params[:id])
        @statString = @character.stats
    end
    
    def edit
        @character = Character.find(params[:id])
        render 'edit'
    end
    
    def upd
            @character = Character.find(params[:char_create_id])
            @statString = params["str"] + "," + params["dex"] + "," + params["con"] + "," + params["int"] + "," + params["wis"] + "," + params["cha"]
            @character.update_attributes(stats: @statString, race: params["race"],charclass: params["class"], userid: session[:current_user_id], label: params["label"], name: params["name"])
            render 'show'
    end
    
    def del
        @character = Character.find(params[:char_create_id])
        @statString = @character.stats
        @character.destroy
        
        redirect_to '/welcome/index'
    end
    
    def list
        @id = 1
        if session[:current_user_id] then
            @id = session[:current_user_id]
        else
            redirect_to '/register'
            return
        end
        @characters = Character.where(userid: @id)
    end
    
    def dice()
        @sides = params['sides']
        @roll = params['roll']
        @res = diceRoll(@sides,@roll)
        render 'roll'
    end
    def dice2()
        @res = charRoll()
        render 'roll'
    end
    def diceRoll(sides, num)
        @res = 0
        @total = 0
        @rollArray = Array.new()
        $i = 1
        until $i >  Integer(num)  do
            @res = rand(Integer(sides)) + 1
            @total += @res
            @rollArray.push(@res)
            $i += 1;
        end
        
        return @res
    end
    
    def charRoll 
        @res2 = 0
        @rollArray = Array.new()
            $i = 1
            until $i > 6 do 
                @res2 = rand(18) + 1
                if @res2 == 1 
                    @res2 += 2
                elsif @res2 == 2
                    @res2 += 1
                else
                    @res2 = @res2
                end
            @rollArray.push(@res2)
            $i += 1
            end
        return @res2
    end
    
end