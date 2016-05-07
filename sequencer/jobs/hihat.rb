require 'rukawa'
require 'nilsteps'

class HihatA < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, osc_port: 22222)
    seq.setup_steps(2 => 'F#1', 6 => 'F#1', 10 => 'F#1', 14 => 'F#1')
    seq.play(24)
  end
end

class HihatB < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, osc_port: 22222)
    seq.setup_steps(0 => 'F#1', 2 => 'A#1', 4 => 'F#1', 6 => 'A#1', 8 => 'F#1', 10 => 'A#1', 12 => 'F#1', 14 => 'A#1', 15 => 'A#1')
    seq.play(16)
  end
end

