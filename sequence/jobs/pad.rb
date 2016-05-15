require 'rukawa'
require 'nilsteps'

class Pad < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, length: 32, osc_port: 22222)
    seq.setup_steps(0 => 'C2')
    seq.play(16)
  end
end
