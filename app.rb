require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index   
end

get '/login' do
  # @username = params[:username]
#   @password = params[:password]
#   if @username == 'thomas'
#     if @password == 'ring'
#       redirect "http://google.com"
#     else 
#       @error = "Wrong Password"
#       erb :index
#     end
#   else
#     @error = "Wrong Name"
#     erb :index
#   end
#   
#   puts @error
  redirect "/"
end

post '/login' do
  @username = params[:username].downcase
  @password = params[:password]
  
  if @username == 'thomas'
    if @password == 'ring'
      erb :home
    else
      @error = "Wrong Password"
      erb :index
    end
  else
    @error = "Wrong Username"
    erb :index
  end
end

get '/name' do
  @name = (params[:name] || "Nobody").downcase
  erb :name
end
