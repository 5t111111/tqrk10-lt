require 'puredata'

Pd.start do |pd|
  canvas = pd.canvas('synth')

  osc_dump = canvas.obj('dumpOSC', 11111)
  osc_route = canvas.obj('OSCroute', '/xcd', '/ycd')
  expr = canvas.obj('expr', 'if($f1 <= 80 \, 0 \, if($f1 <= 160 \, 1 \, if($f1 <= 240 \, 2 \, if($f1 <= 320 \, 3 \, 4))))')
  sel = canvas.obj('sel', 0, 1, 2, 3, 4)
  msg_60 = canvas.msg_box(60)
  msg_62 = canvas.msg_box(62)
  msg_64 = canvas.msg_box(64)
  msg_67 = canvas.msg_box(67)
  msg_69 = canvas.msg_box(69)
  mtof = canvas.obj('mtof')
  mul_by_2 = canvas.obj('*', 2)
  sine_osc = canvas.obj('osc~')

  sub_by_400 = canvas.obj('-', 400)
  abs = canvas.obj('abs')
  div_by_400 = canvas.obj('/', 400)
  msg_box = canvas.msg_box('\$1 20 \, 0 1000 500')
  vline = canvas.obj('vline~')

  mul_audio = canvas.obj('*~')
  sub_audio_by_2 = canvas.obj('/~', 2)
  hip = canvas.obj('hip~', 5)
  dac = canvas.obj('dac~')

  osc_dump >> osc_route
  osc_route.outlet(0) >> expr
  expr >> sel
  sel.outlet(0) >> msg_60
  sel.outlet(1) >> msg_62
  sel.outlet(2) >> msg_64
  sel.outlet(3) >> msg_67
  sel.outlet(4) >> msg_69
  sel.outlet(5) >> canvas.obj('print', 'unmatch')
  msg_60 >> mtof
  msg_62 >> mtof
  msg_64 >> mtof
  msg_67 >> mtof
  msg_69 >> mtof
  mtof >> mul_by_2
  mul_by_2 >> sine_osc

  osc_route.outlet(1) >> sub_by_400
  sub_by_400 >> abs
  abs >> div_by_400
  div_by_400 >> msg_box
  msg_box >> vline

  sine_osc >> mul_audio.inlet(0)
  vline >> mul_audio.inlet(1)
  mul_audio >> sub_audio_by_2
  sub_audio_by_2 >> hip
  hip >> dac.left
  hip >> dac.right

  canvas.save
  sleep 2
end
