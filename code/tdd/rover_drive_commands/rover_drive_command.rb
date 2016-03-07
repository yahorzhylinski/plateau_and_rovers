# => todo check if x or y < 0 or more than the field size

require_relative '../../rover_drive_commands/rover_drive_command.rb'

describe RoverDriveCommands::RoverDriveCommand do
  
  before :each do
    @rover = Models::Rover.new(1,2,'N')
  end

  it "should return L cmd" do
    expect(RoverDriveCommands::RoverDriveCommand.factory('L', @rover).class).to eql(RoverDriveCommands::LeftRoverDriveCommand)
  end

  it "should return R cmd" do
    expect(RoverDriveCommands::RoverDriveCommand.factory('R', @rover).class).to eql(RoverDriveCommands::RightRoverDriveCommand)
  end

  it "should return M cmd" do
    expect(RoverDriveCommands::RoverDriveCommand.factory('M', @rover).class).to eql(RoverDriveCommands::ForwardRoverDriveCommand)
  end

  it "should raise exception" do
    expect {
      RoverDriveCommands::RoverDriveCommand.factory('q', @rover).class
    }.to raise_error(Exception)
  end

  it "should initialize rover" do
    expect(RoverDriveCommands::RoverDriveCommand.factory('M', @rover).rover).to eql(@rover)
  end

  it "should raise exception if call parent method withoud overridign" do
    expect {
      RoverDriveCommands::RoverDriveCommand.new(@rover).execute_step
    }.to raise_error(Exception)
  end

end