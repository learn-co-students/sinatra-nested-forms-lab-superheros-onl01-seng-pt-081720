require 'sinatra/base'

class App < Sinatra::Base

    configure do
        set :views, Proc.new { File.join(root, "../views/") }
    end

    get '/' do
        erb :index
    end

    post '/teams' do
        @hash = params
        binding.pry
    end


end
