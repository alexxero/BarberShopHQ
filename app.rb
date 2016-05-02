#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	validates :name, presence: true
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
	erb :visit
end

post '/visit' do

	c = Client.new params[:client]
	c.save

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

	erb "<h3>Спасибо, вы записаны!</h3>"

end

get '/contacts' do
  erb :contacts
end

post '/contacts' do

end