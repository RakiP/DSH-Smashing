import json
from kafka import KafkaConsumer
import requests

knpTenant = 'smashing'
ipAddress = '172.22.0.1:9092'

def readsendTenant(tenant):
    global knpTenant
    consumer = KafkaConsumer(knpTenant, group_id='smash-group', bootstrap_servers=[ipAddress])
    for message in consumer:
        if message.key == '{}'.format(tenant).encode():
            jDct = json.loads(message.value.decode('utf-8'))
            #print('Sending new Testresults of {}'.format(tenant))
            requests.post("http://localhost:5000/widgets/{}".format(tenant), json=jDct)

def main():
    ############VIALIS##############
    readsendTenant('vialis')


if __name__ == "__main__":
    main()
