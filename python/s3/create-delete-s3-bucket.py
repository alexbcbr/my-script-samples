#!/usr/bin/python

import boto

conn = boto.connect_s3()

bucket = conn.create_bucket('alexbc.mybucket.1')
bucket = conn.delete_bucket('alexbc.mybucket.1')


