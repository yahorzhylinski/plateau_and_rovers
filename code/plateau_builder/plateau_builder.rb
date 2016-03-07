module PlateauBuilder
  class PlateauBuilder

    def initialize(height, width)
      @plateau = ::Models::Plateau.new height, width
    end

    def add_rover(x, y, orientation, cmds)
      @plateau.add_rover(x, y, orientation, cmds)
      self
    end

    def set_commander(commander)
      @plateau.set_commander(commander)
      self
    end

    def build
      @plateau
    end

  end
end