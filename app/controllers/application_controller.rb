require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/teams' do
        @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])

        members = params[:team][:members]

        members.each do |member|
            Superhero.new(name: member[:name], power: member[:power], bio: member[:bio])
        end

        @super_heroes = Superhero.all

        erb :team
    end

end
