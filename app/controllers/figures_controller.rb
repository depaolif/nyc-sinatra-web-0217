class FiguresController < ApplicationController
	get '/figures/new' do
		erb :'figures/new'
	end

	get '/figures' do
		@figures = Figure.all
		erb :'figures/all'
	end

	get '/figures/:id' do
		@figure = Figure.find(params[:id])
		erb :'figures/show'
	end

	get '/figures/:id/edit' do
		@figure = Figure.find(params[:id])
		erb :'figures/edit'
	end

	post '/figures' do
		@figure = Figure.create(params[:figure])
		if params[:title][:name] != ""
			@figure.titles << Title.create(params[:title])
		end
		if params[:landmark][:name] != ""
			@figure.landmarks << Landmark.create(params[:landmark])
		end
		@figure.save
		redirect "/figures"
	end

	patch '/figures/:id' do
		@figure = Figure.find(params[:id])
		@figure.update(params[:figure])
		if params[:title][:name] != ""
			@figure.titles << Title.create(params[:title])
		end
		if params[:landmark][:name] != ""
			@figure.landmarks << Landmark.create(params[:landmark])
		end
		@figure.save
		redirect "/figures/#{@figure.id}"
	end


end