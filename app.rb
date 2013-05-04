require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'koala'

get '/' do
  if session[:user] != 'thomas'
    erb :index
  else
    redirect '/home'
  end
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
    if @password == 'eulerpi'
      session[:user] = 'thomas'
      redirect '/home'
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

get '/home' do
  # return redirect '/' unless session[:user] == 'thomas'
  @graph = Koala::Facebook::API.new
  @picture = @graph.get_picture('thomasjring')
  
  # Make the image URL point to the large image
  # 't' for small
  # 's' for normal
  # 'n' for large
  # 'q' for square
  size = 'n'
  @picture[@picture.length - 5] = size
  
  erb :home
end
