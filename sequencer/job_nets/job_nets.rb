class SongSequence < Rukawa::JobNet
  class << self
    def dependencies
      {
        KickIntro1 => [],
        KickIntro2 => [KickIntro1],
        SnareA => [KickIntro1],
        HihatA => [KickIntro1],
        KickBassIn => [KickIntro2],
        BassA => [KickIntro2],
        KickPadIn1 => [KickBassIn],
        Pad => [KickBassIn],
        KickPadIn2 => [KickPadIn1],
        SnareB => [SnareA],
        HihatB => [HihatA],
        Voice => [KickPadIn2],
        SnareRoll => [SnareB],
        KickVoiceIn1 => [KickPadIn2],
        SnareC => [SnareRoll],
        BassB => [BassA],
        BassC => [BassB],
        KickVoiceIn2 => [KickVoiceIn1],
      }
    end
  end
end
