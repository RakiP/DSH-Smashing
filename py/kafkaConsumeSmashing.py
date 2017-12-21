import json
from kafka import KafkaProducer, KafkaClient, KafkaConsumer

#import requests

knpTenant = 'smashing'

def readsendTenant(producer, topic):
    global knpTenant
    consumer = KafkaConsumer(topic, group_id='smash-group', bootstrap_servers=['localhost:9092'])
    for message in consumer:
        if message.key == b'Testresults':
            jDct = json.loads(message.value.decode('utf-8'))
            print('Sending new Testresults of {}'.format(topic))
            producer.send(knpTenant, key='{}'.format(topic).encode(), value=jDct)

def main(): 
    producer = KafkaProducer(bootstrap_servers='localhost:9092', value_serializer=lambda v: json.dumps(v).encode('utf-8'))
    kafka = KafkaClient("127.0.0.1:9092")    
    kafka.ensure_topic_exists(knpTenant)
    
    ############VIALIS##############
    readsendTenant(producer, 'vialis')
    #requests.post("http://localhost:5000/widgets/{}".format(topic), json=jDct)

if __name__ == "__main__":
    main()
