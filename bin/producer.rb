require 'poseidon'
require 'json'

url = JSON.parse(ENV['KAFKA_URL'])['kafka']
producer = Poseidon::Producer.new([url], 'producer')

1000.times do |i|
  message = Poseidon::MessageToSend.new("demoday", "Message #{i}")
  producer.send_messages([message])
end
