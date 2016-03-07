# => test with default commander

require_relative '../../models/plateau.rb'
require_relative '../../models/rover.rb'
require_relative '../../models/plateau.rb'
require_relative '../../plateau_builder/plateau_data_i_o.rb'
require_relative '../../plateau_builder/file_plateau_data_i_o.rb'
require_relative '../../plateau_builder/plateau_builder.rb'
require_relative '../../rover_drive_commands/rover_drive_command.rb'
require_relative '../../rover_drive_commands/left_rover_drive_command.rb'
require_relative '../../rover_drive_commands/right_rover_drive_command.rb'
require_relative '../../rover_drive_commands/forward_rover_drive_command.rb'

describe Models::Plateau do
  
  it "should exec input_1" do
    plateau_from_file = PlateauBuilder::PlateauDataIO.new
    plateau_from_file.read ["5 5","1 2 N","LMLMLMLMM"]

    plateau_builder = PlateauBuilder::PlateauBuilder.new plateau_from_file.height, plateau_from_file.width
    plateau_from_file.rovers.each do | rover |
      plateau_builder.add_rover(rover[:x], rover[:y], rover[:orienation], rover[:cmds])
    end
    result = plateau_builder.build.execute_rovers
    expect(result[0][:x].to_i).to eql(1)
    expect(result[0][:y]).to eql(3)
    expect(result[0][:orientation]).to eql('N')
  end

  it "should exec input_2" do
    plateau_from_file = PlateauBuilder::PlateauDataIO.new
    plateau_from_file.read ["5 5","3 3 E","MMRMMRMRRM"]

    plateau_builder = PlateauBuilder::PlateauBuilder.new plateau_from_file.height, plateau_from_file.width
    plateau_from_file.rovers.each do | rover |
      plateau_builder.add_rover(rover[:x], rover[:y], rover[:orienation], rover[:cmds])
    end
    result = plateau_builder.build.execute_rovers
    expect(result[0][:x].to_i).to eql(5)
    expect(result[0][:y]).to eql(1)
    expect(result[0][:orientation]).to eql('E')
  end

  it "should exec input_3 with empty rovers list" do
    plateau_from_file = PlateauBuilder::PlateauDataIO.new
    expect {
      plateau_from_file.read ["5 5"]
    }.to raise_error(Exception)
  end

  it "should exec input_4" do
    plateau_from_file = PlateauBuilder::PlateauDataIO.new
    plateau_from_file.read ["5 5","1 2 N","L"]

    plateau_builder = PlateauBuilder::PlateauBuilder.new plateau_from_file.height, plateau_from_file.width
    plateau_from_file.rovers.each do | rover |
      plateau_builder.add_rover(rover[:x], rover[:y], rover[:orienation], rover[:cmds])
    end
    result = plateau_builder.build.execute_rovers
    expect(result[0][:x].to_i).to eql(1)
    expect(result[0][:y]).to eql(2)
    expect(result[0][:orientation]).to eql('W')
  end

  it "should exec input_5" do
    plateau_from_file = PlateauBuilder::PlateauDataIO.new
    plateau_from_file.read ["5 5","1 2 N","M"]

    plateau_builder = PlateauBuilder::PlateauBuilder.new plateau_from_file.height, plateau_from_file.width
    plateau_from_file.rovers.each do | rover |
      plateau_builder.add_rover(rover[:x], rover[:y], rover[:orienation], rover[:cmds])
    end
    result = plateau_builder.build.execute_rovers
    expect(result[0][:x].to_i).to eql(1)
    expect(result[0][:y]).to eql(3)
    expect(result[0][:orientation]).to eql('N')
  end

end