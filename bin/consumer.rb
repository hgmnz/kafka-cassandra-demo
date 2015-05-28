require 'kafka'
require 'json'

host, port = JSON.parse(ENV['KAFKA_URL'])['zk'].split(":")

consumer = Kafka::Consumer.new(host: host, port: port, topic: 'demoday')
puts consumer.consume.inspect
puts consumer.fetch_latest_offset
consumer.loop do |messages|
  puts "Received: #{messages}"
end
