#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 3}
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

get '/' do
  @barbers = Barber.order "created_at DESC"
	erb :index
end

get '/visit' do
	@c = Client.new
	erb :visit
end

post '/visit' do

	@c = Client.new params[:client]
	@c.save

  if @c.save
		erb "<h3>Спасибо, вы записаны!</h3>"
  else
    @error = @c.errors.full_messages.first
		erb :visit
  end

	# parameters = {
	# 		:username => "Введите имя",
	# 		:phone => "Введите телефон",
	# 		:datetime => "Введите дату"
	# }
  #
	# @error = parameters.select {|key, _| params[key] == ''}.values.join(", ")
  #
	# if @error != ""
	# 	return erb :visit
	# end



end

get '/contacts' do
  erb :contacts
end

post '/contacts' do

end

get '/barber/:id' do
  @barber = Barber.find(params[:id])
  erb :barber
end

get '/bookings' do
  @clients = Client.order "created_at DESC"
  erb :bookings
end

get '/client/:id' do
  @client = Client.find(params[:id])
  erb :client
end