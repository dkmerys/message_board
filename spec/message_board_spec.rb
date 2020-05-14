require 'rspec'
require 'pry'
require 'message_board'

describe '#Board' do
  
 describe('#save') do
   it("save a message board") do
     board = Board.new({:topic => "music", :id => nil})
     board.save()
     board2 = Board.new({:topic => "politics", :id => nil})
     board.save()
     expect(Board.all).to(eq([board, board2]))
   end
 end

end
