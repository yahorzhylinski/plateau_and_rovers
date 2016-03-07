# => todo check if x or y < 0 or more than the field size

require_relative '../../rover_drive_commands/forward_rover_drive_command.rb'

describe RoverDriveCommands::ForwardRoverDriveCommand do
  
  it "should go forward" do
    @cmd = RoverDriveCommands::RoverDriveCommand.factory('M', Models::Rover.new(1,2,'N'))
    @cmd.execute_step
    expect(@cmd.rover.y).to eql(3)
  end

  it "should turn back" do
    @cmd = RoverDriveCommands::RoverDriveCommand.factory('M', Models::Rover.new(1,2,'S'))
    @cmd.execute_step
    expect(@cmd.rover.y).to eql(1)
  end

  it "should turn left" do
    @cmd = RoverDriveCommands::RoverDriveCommand.factory('M', Models::Rover.new(1,2,'E'))
    @cmd.execute_step
    expect(@cmd.rover.x).to eql(2)
  end

  it "should turn right" do
    @cmd = RoverDriveCommands::RoverDriveCommand.factory('M', Models::Rover.new(1,2,'W'))
    @cmd.execute_step
    expect(@cmd.rover.x).to eql(0)
  end

end