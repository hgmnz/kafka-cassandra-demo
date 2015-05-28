require 'poseidon'
require 'json'

url = JSON.parse(ENV['KAFKA_URL'])['kafka']
producer = Poseidon::Producer.new([url], 'producer')

loop do
  message = Poseidon::MessageToSend.new("demoday", "Message #{Time.now}")
  producer.send_messages([message])
end
