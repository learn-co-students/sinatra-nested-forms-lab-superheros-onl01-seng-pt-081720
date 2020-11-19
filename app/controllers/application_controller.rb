require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/teams' do
        @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
        @hero_one = Hero.new(name: params[:member1_name], power: params[:member1_power], bio: params[:member1_bio])
        @hero_two = Hero.new(name: params[:member2_name], power: params[:member2_power], bio: params[:member2_bio])
        @hero_three = Hero.new(name: params[:member3_name], power: params[:member3_power], bio: params[:member3_bio])
 
        erb :team
    end
end
