# => todo check if x or y < 0 or more than the field size

require_relative '../../rover_drive_commands/right_rover_drive_command.rb'

describe RoverDriveCommands::RightRoverDriveCommand do
  
  it "should turn left" do
    @cmd = RoverDriveCommands::RoverDriveCommand.factory('R', Models::Rover.new(1,2,'N'))
    @cmd.execute_step
    expect(@cmd.rover.orientation).to eql('E')
  end

end