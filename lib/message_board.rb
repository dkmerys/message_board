class Board
  attr_reader :topic
  @@boards = {}
  @@total_rows = 0

  def initialize(attributes)
    @topic = attributes.fetch(:topic)
    @id = attributes.fetch(:id || @@total_rows += 1)
  end

end