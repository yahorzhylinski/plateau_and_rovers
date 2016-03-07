# => todo check if x or y < 0 or more than the field size

require_relative '../../models/rover.rb'

describe Models::Rover do
  
  before :each do
    @rover = Models::Rover.new(1,2,'N')
  end

  it "should be 1 1 N" do
    expect(@rover.x).to eql(1)
    expect(@rover.y).to eql(2)
    expect(@rover.orientation).to eql('N')
  end

  it "should change x +1" do
    @rover.x += 1 
    expect(@rover.x).to eql(2)
    expect(@rover.y).to eql(2)
    expect(@rover.orientation).to eql('N')
  end

  it "should change x -1" do
    @rover.x -= 1 
    expect(@rover.x).to eql(0)
    expect(@rover.y).to eql(2)
    expect(@rover.orientation).to eql('N')
  end

  it "should change y +1" do
    @rover.y += 1 
    expect(@rover.x).to eql(1)
    expect(@rover.y).to eql(3)
    expect(@rover.orientation).to eql('N')
  end

  it "should change y -1" do
    @rover.y -= 1 
    expect(@rover.x).to eql(1)
    expect(@rover.y).to eql(1)
    expect(@rover.orientation).to eql('N')
  end

  it "should change orientation to E" do
    @rover.change_orientation(1)
    expect(@rover.x).to eql(1)
    expect(@rover.y).to eql(2)
    expect(@rover.orientation).to eql('E')
  end

  it "should change orientation to W" do
    @rover.change_orientation(-1)
    expect(@rover.x).to eql(1)
    expect(@rover.y).to eql(2)
    expect(@rover.orientation).to eql('W')
  end

  it "should change orientation to N" do
    @rover.change_orientation(1)
    @rover.change_orientation(1)
    @rover.change_orientation(1)
    @rover.change_orientation(1)

    expect(@rover.x).to eql(1)
    expect(@rover.y).to eql(2)
    expect(@rover.orientation).to eql('N')
  end

  it "should change orientation to N" do
    @rover.change_orientation(-1)
    @rover.change_orientation(-1)
    @rover.change_orientation(-1)
    @rover.change_orientation(-1)

    expect(@rover.x).to eql(1)
    expect(@rover.y).to eql(2)
    expect(@rover.orientation).to eql('N')
  end

end