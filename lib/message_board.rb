class Board
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
  
  def save
    @@boards[self.id] = Board.new({:topic => self.topic, :id => self.id})
  end

  def self.find(id)
    @@boards[id]
  end

  def update(new_topic)
    @topic = new_topic
  end
  
  def delete
    @@boards.delete(self.id)
  end
  
  def ==(board_to_compare)
    self.topic() == board_to_compare.topic()
  end

  def self.search(search_topic)
    array = @@boards.values.select {|board| board.topic == search_topic}
    return array
  end
  

end