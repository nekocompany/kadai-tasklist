(1..100).each do |number|
  Task.create(content: 'test contetnt ' + number.to_s, status: 'stat' + number.to_s)
end
