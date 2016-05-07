require 'rukawa'
require 'nilsteps'

class Voice < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, length: 32, osc_port: 22222)
    seq.setup_steps(0 => 'D2')
    seq.play(8)
  end
end

