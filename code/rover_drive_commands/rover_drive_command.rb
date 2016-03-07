module RoverDriveCommands
  class RoverDriveCommand

    def self.factory command, rover
      if !%w{L R M}.include? command
        raise Exception.new "the command should be L, R or M"
      end
      
      { "L" => LeftRoverDriveCommand, "R" => RightRoverDriveCommand, "M" => ForwardRoverDriveCommand }[command].new rover
    end

    attr_reader :rover

    def initialize(rover)
      @rover = rover
    end

    def execute_step
      raise NotImplementedError.new "you need to implement execute_step method"
    end

  end
end