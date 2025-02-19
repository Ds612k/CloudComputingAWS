import boto3

s3 = boto3.client('s3',region_name='us-east-2')
bucket_name = 'my-boto3-s3-bucket-darshan'  # Change this to a globally unique name

response = s3.create_bucket(Bucket=bucket_name,CreateBucketConfiguration={'LocationConstraint': 'us-east-2'})
print(f'Bucket {bucket_name} created successfully!')