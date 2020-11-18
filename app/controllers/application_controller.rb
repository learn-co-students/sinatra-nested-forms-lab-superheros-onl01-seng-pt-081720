require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/team' do
        @team = Team.new(params[:team])
        params[:team][:member].each do |member_params|
            Superhero.new(member_params)
        end
        @super_heroes = Superhero.all
        erb :team
    end
end
