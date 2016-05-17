load_libraries :oscP5

import 'oscP5'
import 'netP5'

SIZE = 20

def settings
  size 400, 400
  smooth
end

def setup
  colorMode HSB, 100
  background 0
  frameRate 30

  @ripples = []

  0.upto(SIZE) do |i|
    @ripples[i] = Ripple.new
  end

  @oscP5 = OscP5.new(self, 55555)
  @remote_location = NetAddress.new('127.0.0.1', 11111)
end

def draw
  background 0
  colorMode RGB, 256
  noStroke 
  fill 0, 255, 255, 40
  rect 0, 0, 80, 400
  fill 0, 255, 255, 80
  rect 80, 0, 80, 400
  fill 0, 255, 255, 120
  rect 160, 0, 80, 400
  fill 0, 255, 255, 160
  rect 240, 0, 80, 400
  fill 0, 255, 255, 200
  rect 320, 0, 80, 400

  @ripples.each do |ripple|
    if ripple.flag
      ripple.move
      ripple.draw_ripple
    end
  end
end

def mouse_pressed
  SIZE.downto(1) do |i|
    @ripples[i] = Ripple.new.create_ripple(@ripples[i - 1])
  end

  @ripples[0].re_initialize(mouseX, mouseY, random(5, 15), random(10, 80).to_i)

  osc_bundle = OscBundle.new

  osc_message = OscMessage.new('/xcd')
  osc_message.add(mouseX)
  osc_bundle.add(osc_message)
  
  osc_message.clear

  osc_message.setAddrPattern('/ycd')
  osc_message.add(mouseY)
  osc_bundle.add(osc_message)
 
  @oscP5.send(osc_bundle, @remote_location)
end

class Ripple
  FRICTION = 0.985
  
  attr_reader :x, :y, :speed, :color_h, :dia, :flag

  def initialize
    @x = 0
    @y = 0
    @speed = 0
    @color_h = 0
    @dia = 0.0
    @flag = false
  end

  def re_initialize(x, y, speed, color_h)
    @x = x
    @y = y
    @speed = speed
    @color_h = color_h
    @dia = 0.0
    @flag = true
  end

  def create_ripple(original)
    @x = original.x
    @y = original.y
    @speed = original.speed
    @color_h = original.color_h
    @dia = original.dia
    @flag = original.flag
    self
  end

  def draw_ripple
    noFill

    if @speed > 1.0
      stroke(color_h, 60, 99, 100*(@speed-1)/3)
      strokeWeight(4)
      ellipse(x, y, @dia, @dia)
    end

    if @speed > 1.5
      stroke(color_h, 60, 99, 100*(@speed-1.5)/3)
      strokeWeight(2)
      ellipse(@x, @y, @dia*0.7, @dia*0.7);
    end

    if @speed > 2.0
      stroke(color_h, 60, 99, 100*(@speed-2)/3);
      strokeWeight(1);
      ellipse(@x, @y, @dia*0.6, @dia*0.6);
    end
  end

  def move
    @dia += @speed;
    @speed *= FRICTION;

    @flag = false if @speed < 0.5
  end
end
