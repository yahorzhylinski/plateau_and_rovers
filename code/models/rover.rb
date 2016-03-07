module Models
  class Rover

    attr_accessor :x, :y

    def initialize(x,y,orientation)
      @x = x
      @y = y
      @orientation = orientation_to_integer.find_index(orientation)
    end

    def orientation
      orientation_to_integer[@orientation]
    end

    # => at the class the orientation is an integer
    # => but from outside it's N,E,S or W
    def change_orientation(value)
      @orientation += value
      if @orientation < 0
        @orientation = 3
      end
      @orientation %= 4
    end

    private

      def orientation_to_integer
        %w{N E S W}
      end

  end
end