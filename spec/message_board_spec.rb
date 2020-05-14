require 'rspec'
require 'pry'
require 'message_board'

describe '#Board' do

  before (:each) do
    Board.clear()
  end
  
  describe('#save') do
    it("save a message board") do
      board = Board.new({:topic => "music", :id => nil})
      board.save()
      board2 = Board.new({:topic => "politics", :id => nil})
      board2.save()
      expect(Board.all).to(eq([board, board2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no boards") do
      expect(Board.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      board = Board.new({:topic => "music", :id => nil})
      board.save()
      board2 = Board.new({:topic => "politics", :id => nil})
      board2.save()
      Board.clear()
      expect(Board.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same board if it has the same attributes as another board") do
      board = Board.new({:topic => "music", :id => nil})
      board2 = Board.new({:topic => "music", :id => nil})
      expect(board).to(eq(board2))
    end
  end

  describe('#update') do
    it("updates an board with new topic") do
      board = Board.new({:topic => "music", :id => nil})   
      board.save
      board.update("politics")   
      expect(board.topic).to(eq("politics"))
    end
  end

  describe('#delete') do
    it("deletes a board") do
      board = Board.new({:topic => "music", :id => nil})
      board.save
      board2 = Board.new({:topic => "politics", :id => nil})
      board2.save
      board.delete()
      expect(Board.all).to(eq([board2]))
    end
  end

  describe('.find') do
    it("finds a board by id") do
      board = Board.new({:topic => "music", :id => nil})
      board.save
      board2 = Board.new({:topic => "politics", :id => nil})
      board2.save
      expect(Board.find(board.id)).to(eq(board))
    end
  end
end
