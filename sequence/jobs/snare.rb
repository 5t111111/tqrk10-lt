require 'rukawa'
require 'nilsteps'

class SnareA < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, length: 32, osc_port: 22222)
    seq.setup_steps(4 => 'D1', 12 => 'D1', 20 => 'D1', 28 => 'D1', 31 => 'D1')
    seq.play(12)
  end
end

class SnareB < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, length: 16, osc_port: 22222)
    seq.setup_steps(4 => 'D1', 7 => 'D1', 9 => 'D1', 12 => 'D1', 15 => 'D1')
    seq.play(7)
  end
end

class SnareC < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, length: 64, osc_port: 22222)
    seq.setup_steps(0 => 'D1', 6 => 'D1', 12 => 'D1', 15 => 'D1', 
                    20 => 'D1', 28 => 'D1', 31 => 'D1',
                    36 => 'D1', 44 => 'D1', 47 => 'D1',
                    52 => 'D1', 60 => 'D1', 63 => 'D1')
    seq.play(1)
  end
end

class SnareD < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, osc_port: 22222)
    seq.setup_steps(4 => 'D1', 12 => 'D1', 15 => 'D1')
    seq.play(4)
  end
end

class SnareE < SnareC
end

class SnareF < SnareD
end

class SnareRoll < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, length: 16, osc_port: 22222)
    seq.setup_steps(0 => 'D1', 1 => 'D1', 2 => 'D1', 3 => 'D1',
                    4 => 'D1', 5 => 'D1', 6 => 'D1', 7 => 'D1',
                    8 => 'D1', 9 => 'D1', 10 => 'D1', 11 => 'D1',
                    12 => 'D1', 13 => 'D1', 14 => 'D1', 15 => 'D1')
    seq.play(1)
  end
end
