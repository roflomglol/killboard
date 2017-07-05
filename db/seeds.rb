names = [
  'Forsaken Skipper',
  'Tau AD',
  'ja-max',
  'Ownage Activated',
  'razernc',
  'Kondorssonsson',
  'vesage Aucie',
  'Intigo',
  'Rei Ayannami',
  'Romaz Chechen',
]

names.each do |name|
  Pilot.find_or_create_by(name: name)
end
