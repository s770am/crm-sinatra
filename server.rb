require 'sinatra'

require_relative 'Contact'

get '/' do
    redirect to('/home')
end

get '/crm' do
    redirect to('/home')
end

get '/home' do
    @title = "Home"

    @contacts = Contact.all
    erb :home
end

get '/about' do
    @title = "About"
    erb :about
end

get '/add_contact_form' do
    @title = "Add contact"
    erb :add_contact_form
end

post "/add_contact" do
contact = Contact.new
contact.first_name = params[:first_name]
contact.last_name = params[:last_name]
contact.number = params[:number]
contact.email = params[:email]
contact.save
    redirect to('/home')
end



get '/update_contact_form/:id' do
    @title = "Update contact"
    @contact = Contact.find(params[:id])
    erb :update_contact_form
end

post "/update_contact/:id" do
    contact = Contact.find(params[:id])
    contact.first_name = params[:first_name]
    contact.last_name = params[:last_name]
    contact.number = params[:number]
    contact.email = params[:email]
    contact.save
    redirect to('/home')
end

get "/delete/:id" do
    Contact.find(params[:id]).delete
    redirect to('/home')
end