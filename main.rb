require_relative './code/models/rover.rb'
require_relative './code/models/plateau.rb'
require_relative './code/plateau_builder/plateau_data_i_o.rb'
require_relative './code/plateau_builder/file_plateau_data_i_o.rb'
require_relative './code/plateau_builder/plateau_builder.rb'
require_relative './code/rover_drive_commands/rover_drive_command.rb'
require_relative './code/rover_drive_commands/left_rover_drive_command.rb'
require_relative './code/rover_drive_commands/right_rover_drive_command.rb'
require_relative './code/rover_drive_commands/forward_rover_drive_command.rb'

# => read from file test data
plateau_from_file = PlateauBuilder::FilePlateauDataIO.new "input1"
plateau_from_file.read

# => build a plateau
plateau_builder = PlateauBuilder::PlateauBuilder.new plateau_from_file.height, plateau_from_file.width

# => set all rovers
plateau_from_file.rovers.each do | rover |
  plateau_builder.add_rover(rover[:x], rover[:y], rover[:orienation], rover[:cmds])
end

# =>  it sets by default
# => plateau_builder.set_commander RoverDriveCommands::RoverDriveCommand

plateau = plateau_builder.build

# => result we write to file
result = plateau.execute_rovers
plateau_from_file.write result
