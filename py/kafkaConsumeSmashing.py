import json
from kafka import KafkaConsumer
import requests

knpTenant = 'smashing'
ipAddress = 'IPADDRESS'

def readsendTenant(tenant):
    global knpTenant
    consumer = KafkaConsumer(knpTenant, group_id='smash-group', bootstrap_servers=[ipAddress+':9092'])
    for message in consumer:
        if message.key == '{}'.format(tenant).encode():
            jDct = json.loads(message.value.decode('utf-8'))
            print('Sending new Testresults of {}'.format(tenant))
            requests.post("http://{}:5000/widgets/{}".format(ipAddress, tenant), json=jDct)
            # consume earliest available messages, don't commit offsets
    KafkaConsumer(bootstrap_servers=[ipAddress+':9092'], auto_offset_reset='earliest', enable_auto_commit=False)

def main():
    ############VIALIS##############
    readsendTenant('vialis')


if __name__ == "__main__":
    main()