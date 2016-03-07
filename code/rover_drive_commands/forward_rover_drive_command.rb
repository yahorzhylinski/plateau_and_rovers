module RoverDriveCommands
  class ForwardRoverDriveCommand < RoverDriveCommands::RoverDriveCommand

    def initialize(rover)
      super rover
    end

    def execute_step()
      case @rover.orientation
      when "N"
        @rover.y += 1
      when "E"
        @rover.x += 1
      when "S"
        @rover.y -= 1
      when "W"
        @rover.x -= 1
      else
      end
    end

  end
end