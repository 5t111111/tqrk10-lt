require 'rukawa'
require 'nilsteps'

class BassA < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, length: 32, osc_port: 33333)
    seq.setup_steps(
      0 => 'D1', 2 => 'D1', 4 => 'D1', 6 => 'D1', 8 => 'D1', 10 => 'D1', 12 => 'D1', 14 => 'D1',
      16 => 'E1', 18 => 'E1', 20 => 'E1', 22 => 'F#1', 24 => 'F#1', 26 => 'F#1', 27 => 'F#1', 28 => 'A1', 29 => 'A1', 30 => 'F#1'
    )
    seq.play(12)
  end
end

class BassB < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, length: 64, osc_port: 33333)
    # seq.setup_steps(
    #   0 => 'D1', 6 => 'D1', 12 => 'D1', 14 => 'D1',
    #   16 => 'E1', 18 => 'E2', 20 => 'E1', 22 => 'F#2', 24 => 'F#1', 26 => 'F#2', 27 => 'F#1', 28 => 'A2', 29 => 'A2', 30 => 'F#1',
    #   32 => 'D1', 34 => 'D2', 36 => 'D1', 38 => 'D2', 40 => 'D1', 42 => 'D2', 44 => 'D1', 46 => 'D2',
    #   48 => 'E1', 50 => 'E2', 52 => 'E1', 54 => 'F#2', 56 => 'F#1', 58 => 'F#2', 59 => 'F#1', 60 => 'A2', 61 => 'A2', 62 => 'F#1'
    # )
    seq.setup_steps(
      0 => 'D1', 6 => 'D1', 12 => 'D1', 14 => 'D1',
      16 => 'E1', 18 => 'E2', 20 => 'E1', 22 => 'F#2', 24 => 'F#1', 26 => 'F#2', 27 => 'F#1', 28 => 'A2', 29 => 'A2', 30 => 'F#1',
      32 => 'D1', 34 => 'D1', 36 => 'D1', 38 => 'D1', 40 => 'D1', 42 => 'D1', 44 => 'D1', 46 => 'D1',
      48 => 'E1', 50 => 'E2', 52 => 'E1', 54 => 'F#2', 56 => 'F#1', 58 => 'F#2', 59 => 'F#1', 60 => 'A2', 61 => 'A2', 62 => 'F#1'
    )
    seq.play(1)
  end
end

class BassC < Rukawa::Job
  def run
    seq = Nilsteps::Sequencer.new(bpm: 133, length: 32, osc_port: 33333)
    seq.setup_steps(
      0 => 'D1', 2 => 'D1', 4 => 'D1', 6 => 'D1', 8 => 'D1', 10 => 'D1', 12 => 'D1', 14 => 'D1',
      16 => 'E1', 18 => 'E2', 20 => 'E1', 22 => 'F#2', 24 => 'F#1', 26 => 'F#2', 27 => 'F#1', 28 => 'A2', 29 => 'A2', 30 => 'F#1'
    )
    seq.play(3)
  end
end
