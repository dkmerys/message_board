class Board
  attr_reader :topic, :id
  attr_accessor :topic, :id
  @@boards = {}
  @@total_rows = 0

  def initialize(attributes)
    @topic = attributes.fetch(:topic)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end
  
  def self.all
    @@boards.values()
  end

  def self.clear
    @@boards = {}
    @@total_rows = 0
  end
  
  def ==(board_to_compare)
    self.topic() == board_to_compare.topic()
  end

  def update(new_topic)
    @topic = new_topic
  end


  def save
    @@boards[self.id] = Board.new({:topic => self.topic, :id => self.id})
  end

end