def process_titles_in_directory(data_directory)
  queue, channel = connect_to_rabbitmq_queue
  Dir.foreach('data/' + data_directory) do |item|
    next if File.extname(item) != '.json'
    data = File.read('data/' + data_directory + '/' + item)
    channel.default_exchange.publish(data, routing_key: queue.name, content_type: 'application/json')
  end

  wait_for_queue_to_be_consumed(channel, queue.name)
end

def process_titles_from_data(title_data)
  queue, channel = connect_to_rabbitmq_queue
  channel.default_exchange.publish(title_data, routing_key: queue.name, content_type: 'application/json')
  wait_for_queue_to_be_consumed(channel, queue.name)
end

def wait_for_queue_to_be_consumed(channel, queue_name)
  consumed = false
  wait_start_time = Time.now

  def timed_out(start_time)
    return (Time.now - start_time).to_f > $QUEUE_WAIT_TIMEOUT
  end

  while not (consumed || timed_out(wait_start_time))
    response = channel.queue_declare(queue = queue_name, opts = { passive: true })
    consumed = response.message_count == 0
    sleep(0.5)
  end

  if not consumed
    fail('Timed out when waiting for the feeder to consume titles from the queue')
  end
end

def connect_to_rabbitmq_queue
  conn = Bunny.new($INCOMING_QUEUE_HOSTNAME)
  conn.start
  ch = conn.create_channel
  q = ch.queue($INCOMING_QUEUE, durable: true)
  [q, ch]
end

def insert_caution_title
  process_titles_in_directory('caution')
  @title = {
    title_number: 'AGL1004',
    postcode: 'PL9 7FN',
    town: 'Narniaville',
    house_no: '29',
    house_alpha: 'A',
    street_name: 'Magical Avenue',
    address_string: '29A Magical Avenue, Narniaville, PL9 7FN',
    lr_uprns: '9407140'
  }
  wait_until_elasticsearch_updater_finished
  make_title_searchable
end

def insert_title_with_multiple_index_polygons
  process_titles_in_directory('multiple-index-polygons')
  @title = {
    title_number: 'AGL1005',
    postcode: 'PL9 7FN',
    town: 'Plymouth',
    house_no: '23',
    house_alpha: 'A',
    street_name: 'Murhill Lane',
    address_string: '23A Murhill Lane, Plymouth, PL9 7FN',
    lr_uprns: '9407140'
  }
  wait_until_elasticsearch_updater_finished
  make_title_searchable
end

def insert_title_non_private_individual_owner
  process_titles_in_directory('non-private-individual-owner')
  @title = {
    title_number: 'AGL1000',
    last_changed: '02 July 1996 at 00:59:59',
    owners: ['HEATHER POOLE PLC'],
    postcode: 'PL9 7FN',
    town: 'Plymouth',
    street_name: 'Murhill Lane',
    closure_status: 'OPEN',
    tenure_type: 'Freehold',
    house_no: '23',
    house_alpha: 'A',
    street_name: 'Murhill Lane',
    address_string: '23A Murhill Lane, Plymouth, PL9 7FN',
    lr_uprns: '9407140'
  }
  wait_until_elasticsearch_updater_finished
  make_title_searchable
end

def insert_title_charity_non_private_individual_owner
  process_titles_in_directory('charity-non-private-individual-owner')
  @title = {
    title_number: 'AGL1003',
    last_changed: '28 August 2003 at 14:45:50',
    owners: ['HEATHER JONES', 'JOHN JONES', 'HEATHER SMITH'],
    street_name: 'Murhill Lane',
    closure_status: 'OPEN',
    postcode: 'PL9 7FN',
    town: 'Plymouth',
    house_no: '23',
    house_alpha: 'A',
    address_string: '23A Murhill Lane, Plymouth, PL9 7FN',
    lr_uprns: '9407140'
  }
  wait_until_elasticsearch_updater_finished
  make_title_searchable
end

def insert_title_charity_private_individual_owner
  process_titles_in_directory('charity-private-individual-owner')
  @title = {
    title_number: 'AGL1002',
    last_changed: '28 August 2003 at 14:45:50',
    postcode: 'PL9 7FN',
    town: 'Plymouth',
    house_no: '23',
    house_alpha: 'A',
    street_name: 'Murhill Lane',
    address_string: '23A Murhill Lane, Plymouth, PL9 7FN',
    lr_uprns: '9407140'
  }
  wait_until_elasticsearch_updater_finished
  make_title_searchable
end

def insert_unverified_title
  process_titles_in_directory('unverified_title')
  @title = {
    title_number: 'AGL1013',
    application_reference: 'J991DWW',
    last_app_timestamp: '2003-08-28T14:45:50+01:00',
    verified: 'false'
  }
  wait_until_elasticsearch_updater_finished
  make_title_searchable
end
