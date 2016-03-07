module Models
  class Plateau

    def initialize(height, width)
      @height = height
      @width = width
      @rovers = []
    end

    def add_rover(x, y, orientation, cmds)
      @rovers << { rover: Rover.new(x,y,orientation), cmds: cmds }
    end

    # => on execute_rovers method i set default commander
    # => you can implement or own and pass it to builder
    def set_commander(commander)
      @commander = commander
    end

    # => it also good to validate if x or y will be < 0
    def execute_rovers

      # => by default
      if !@commander
        @commander = RoverDriveCommands::RoverDriveCommand
      end

      # => finish x,y,orientation of rovers 
      result = []

      @rovers.each do | rover |
        current_rover = rover[:rover]
        rover[:cmds].split("").each do | cmd |
          command = @commander.factory cmd, current_rover
          command.execute_step
          current_rover = command.rover
        end

        result << { x: current_rover.x, y: current_rover.y, orientation: current_rover.orientation }
      end

      result
    end

  end
end