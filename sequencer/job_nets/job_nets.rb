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
        BassB => [BassA],
        SnareC => [SnareRoll],
        KickVoiceIn2 => [KickVoiceIn1],
        BassC => [BassB],
        SnareD => [SnareC],
        KickVoiceIn3 => [KickVoiceIn2],
        BassD => [BassC],
        SnareE => [SnareD],
        KickVoiceIn4 => [KickVoiceIn3],
        BassE => [BassD],
        SnareF => [SnareE],
      }
    end
  end
end
