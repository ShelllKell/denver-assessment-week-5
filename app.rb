require "sinatra"
require "./lib/database"
require "./lib/contact_database"
require "./lib/user_database"

class ContactsApp < Sinatra::Base
  enable :sessions

  def initialize
    super
    @contact_database = ContactDatabase.new
    @user_database = UserDatabase.new

    jeff = @user_database.insert(username: "Jeff", password: "jeff123")
    hunter = @user_database.insert(username: "Hunter", password: "puglyfe")

    @contact_database.insert(:name => "Spencer", :email => "spen@example.com", user_id: jeff[:id])
    @contact_database.insert(:name => "Jeff D.", :email => "jd@example.com", user_id: jeff[:id])
    @contact_database.insert(:name => "Mike", :email => "mike@example.com", user_id: jeff[:id])
    @contact_database.insert(:name => "Kirsten", :email => "kirsten@example.com", user_id: hunter[:id])
  end

  get "/" do
    erb :root
  end

  get "/login" do
    # @entity = @user_database.find(session[:user_id])[:username]
    # erb :login, :locals => {:entity => @entity}

    erb :login
  end

  get "/homepage" do
    erb :homepage
  end

  post "/login" do
    # entity = find_user

    entity = {:username => params[:username], :password => params[:password]}
    session[:user_id] = entity[:id]
    redirect "/homepage"

  end

  def find_user
    #this iterates through the @user_database array, finds the hash that has the target name and password, and returns it outside the array (that's what the [0] does). This is flawed right now because you could make a user with the same username but a different password. ALSO, I modified the user_database.rb file and removed the .dup from @user in the all method. That's the only way I could get select to work!
    @user_database.all.select { |x| x[:username] == params[:username] && x[:password] == params[:password] }[0]
  end


end
