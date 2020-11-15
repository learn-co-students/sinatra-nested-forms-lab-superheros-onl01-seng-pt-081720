require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :'/super_hero'
    end

    post '/teams' do
        @team = Teams.new(params[:team])
        
        params[:team][:members].each { |member| Heroes.new(member) }
        @heroes = Heroes.all

        erb :'/team'
    end
end
