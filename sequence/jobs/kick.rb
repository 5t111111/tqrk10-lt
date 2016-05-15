require 'rukawa'
require 'nilsteps'

class KickIntro1 < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, osc_port: 22222)
    seq.setup_steps(0 => 'C1', 4 => 'C1', 8 => 'C1', 12 => 'C1')
    seq.play(4)
  end
end

class KickIntro2 < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, osc_port: 22222)
    seq.setup_steps(0 => 'C1', 4 => 'C1', 8 => 'C1', 12 => 'C1')
    seq.play(8)
  end
end

class KickBassIn < KickIntro2
end

class KickPadIn1 < KickBassIn
end

class KickPadIn2 < KickPadIn1
end

class KickVoiceIn1 < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, length: 64, osc_port: 22222)
    seq.setup_steps(0 => 'C1', 6 => 'C1', 12 => 'C1', 16 => 'C1', 20 => 'C1', 24 => 'C1', 28 => 'C1',
                    32 => 'C1', 36 => 'C1', 40 => 'C1', 44 => 'C1', 48 => 'C1', 52 => 'C1', 56 => 'C1', 60 => 'C1', 62 => 'C1')
    seq.play(1)
  end
end

class KickVoiceIn2 < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, osc_port: 22222)
    seq.setup_steps(0 => 'C1', 4 => 'C1', 8 => 'C1', 12 => 'C1')
    seq.play(4)
  end
end

class KickVoiceIn3 < KickVoiceIn1
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, length: 64, osc_port: 22222)
    seq.setup_steps(0 => 'C1', 2 => 'C1', 4 => 'C1', 5 =>'C1', 8 => 'C1', 10 => 'C1', 12 => 'C1', 14 => 'C1',
                    16 => 'C1', 20 => 'C1', 24 => 'C1', 28 => 'C1', 30 => 'C1',
                    32 => 'C1', 36 => 'C1', 40 => 'C1', 44 => 'C1', 48 => 'C1', 52 => 'C1', 56 => 'C1', 60 => 'C1', 62 => 'C1')
    seq.play(1)
  end
end

class KickVoiceIn4 < KickVoiceIn2
end
