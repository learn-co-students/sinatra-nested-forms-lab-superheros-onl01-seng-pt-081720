require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do 

        erb :super_hero

    end

    post "/teams" do 
        binding.pry
        @team_name = params[:team][:name]
        @team_motto = params[:team][:motto]
        all_heros = params[:team][:members]
        all_heros.each do |hero|

            Hero.new(hero)

        end

        @heroes = Hero.all
        erb :team

    end


end
