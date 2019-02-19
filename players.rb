class Players
  attr_reader :name
  attr_accessor :life, :turn

  def initialize(name = 'Player')
    @name = name
    @life = 3
    @turn = false
  end

end