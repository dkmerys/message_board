require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('create a board', {:type => :feature}) do
  it('creates a board and then goes to the board page') do
    visit('/boards')
    click_on('Add a new board')
    fill_in('board_topic', :with => 'Reggae')
    click_on('Add!')
    expect(page).to have_content('Reggae')
  end
end

describe('update') do 
  it('updates an existing board with a new topic', {:type => :feature}) do
    board = Board.new({:topic => "music", :id => nil})
    board.save
    visit('/boards')
    click_on('music')
    click_on('Change Topic Name')
    fill_in('topic', :with => "history")
    click_on('Update')
    expect(page).to have_content('history')
  end
end