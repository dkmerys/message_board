require('sinatra')
require('sinatra/reloader')
require('./lib/message_board')
require('pry')
also_reload('lib/**/*.rb')

get('/boards') do
  @boards = Board.all
  erb(:boards)
end

post('/boards') do
  new_topic = params[:new_topic]
  board = Board.new({:topic => new_topic, :id => nil})
  board.save
  @boards = Board.all()
  erb(:boards)
end

get('/boards/new') do
  erb(:new_board)
end

get('/boards/search') do
  @search_results = Board.search(params[:user_search])
  erb(:search_result)
end

get('/board/:id') do
  @board = Board.find(params[:id].to_i())
  erb(:board)
end

patch('boards/:id') do
  @board = Board.find(params[:id].to_i())
  @board.update(params[:topic])
  @boards = Board.all
  redirect('/boards')
end