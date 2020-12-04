from kafka import KafkaProducer
import json
from data import get_registered_user
import time

def json_serializer(data):
    return json.dumps(data).encode("utf-8")

def get_partition(key, all, available):
    return 0 # 파티션을 특정할 수 있음

producer = KafkaProducer(
    bootstrap_servers=["192.168.0.2:9092"],
    value_serializer=json_serializer,
    # compression_type='snappy'
    # partitioner=get_partition
)

if __name__ == "__main__":
    while 1 == 1:
        registered_user = get_registered_user()
        print(registered_user)

        producer.send("registered-user", registered_user)
        time.sleep(0.1)