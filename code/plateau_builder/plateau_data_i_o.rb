module PlateauBuilder

  # => you can inherit your class, but call parent read.
  class PlateauDataIO

    attr_reader :height, :width, :rovers

    def read lines

      @rovers = []

      @lines = lines
      if @lines.count < 3
        raise Exception.new "At least amount of lines should be greater than 2"
      end
      first_line = @lines[0].split(" ")
      @height = first_line[0].to_i
      @width =  first_line[1].to_i

      (1...@lines.count).step(2).each do | index |

        parsed_value = @lines[index].split(" ")
        cmds = @lines[index+1]
        @rovers << { x: parsed_value[0].to_i, y: parsed_value[1].to_i, orienation: parsed_value[2], cmds: cmds } 
      end
    end

    def write(result)
      raise NotImplementedError.new
    end

  end
end