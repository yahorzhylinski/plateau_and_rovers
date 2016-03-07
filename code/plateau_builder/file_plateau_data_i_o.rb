require 'digest/md5'
module PlateauBuilder

  # => to test example i use files.
  # => but you can create test data using parent class as i did at the rspec
  class FilePlateauDataIO < PlateauBuilder::PlateauDataIO

    def initialize file_input, file_output=nil
      @file_input = file_input
      # => if output file name is nil we need to generate it 
      @file_output = file_output || (0...8).map { (65 + rand(26)).chr }.join
    end

    def read
      lines = []

      File.open(@file_input, "r") do |f|
        f.each_line do |line|
          lines << line.tr("\n","")
        end
      end

      super lines
    end

    def write(result)
      result = result.map { | rover | rover[:x].to_s + " " + rover[:y].to_s + " " + rover[:orientation].to_s + "\n" }.join
      File.write(@file_output, result)
    end

  end
end