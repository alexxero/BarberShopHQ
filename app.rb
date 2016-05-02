#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
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

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

  c = Client.new
  c.name = @username
  c.phone = @phone
  c.datestamp = @datetime
  c.barber = @barber
  c.color = @color
  c.save

	parameters = {
			:username => "Введите имя",
			:phone => "Введите телефон",
			:datetime => "Введите дату"
	}

	@error = parameters.select {|key, _| params[key] == ''}.values.join(", ")

	if @error != ""
		return erb :visit
	end

	erb "OK, #{@username}, phone number #{@phone}, you are signed to #{@barber} to change a color to #{@color} at #{@datetime}"

end

get '/contacts' do
  erb :contacts
end

post '/contacts' do

end