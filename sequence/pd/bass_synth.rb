require 'puredata'

Pd.start do |pd|
  canvas = pd.canvas('bass_synth')

  osc_dump = canvas.obj('dumpOSC', 33333)
  osc_route = canvas.obj('OSCroute', '/C1', '/D1', '/E1', '/F#1', '/G1', '/A1', '/B1', '/C2', '/D2', '/E2', '/F#2', '/G2', '/A2', '/B2')

  osc_dump >> osc_route

  notes = [24, 26, 28, 30, 31, 33, 35, 36, 38, 40, 42, 43, 45, 47]

  mtof = canvas.obj('mtof')

  osc_route_outlets = notes.each_with_index do |note, index|
    outlet = osc_route.outlet(index)
    msg_box = canvas.msg_box(note)

    outlet >> msg_box
    msg_box >> mtof
  end

  phasor = canvas.obj('phasor~')

  mul_by_two = canvas.obj('*', 2)
  phasor_high = canvas.obj('phasor~')

  lores = canvas.obj('lores~', 700)

  mtof >> phasor
  phasor >> lores
  phasor >> mul_by_two
  mul_by_two >> phasor_high
  phasor_high >> lores

  msg_box_two = canvas.msg_box(2)
  msg_box_for_vline = canvas.msg_box('\$1 20 \, 0 180 150')
  vline = canvas.obj('vline~')

  mtof >> msg_box_two
  msg_box_two >> msg_box_for_vline
  msg_box_for_vline >> vline

  mul_audio = canvas.obj('*~')

  lores >> mul_audio.inlet(0)
  vline >> mul_audio.inlet(1)

  hip = canvas.obj('hip~', 50)
  vol = canvas.obj('*~', 0.5)

  mul_audio >> hip
  hip >> vol

  dac = canvas.obj('dac~')

  vol >> dac.left
  vol >> dac.right

  canvas.save
  sleep 2
end
