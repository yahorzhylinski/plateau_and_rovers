module RoverDriveCommands
  class RightRoverDriveCommand < RoverDriveCommands::RoverDriveCommand

    def initialize(rover)
      super(rover)
    end

    def execute_step
      @rover.change_orientation(1)
    end

  end
end