import numpy as np
import tensorflow as tf
import random

def generator():
    for x in range(1000):
        yield np.random.random([10,10])

dataset = tf.data.Dataset.from_generator(generator,tf.float32,[10,10])
dataset = dataset.filter(
    lambda x: x[0][0] >0.5
)
iterator = dataset.make_one_shot_iterator()
feature = iterator.get_next()

with tf.train.MonitoredTrainingSession() as sess:
    count = 0
    while not sess.should_stop():
        result = sess.run(feature)
        print(count)
        count += 1
        # print(result)