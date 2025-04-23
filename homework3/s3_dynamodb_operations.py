import boto3
from botocore.exceptions import ClientError

# ---------- CONFIG ----------
BUCKET_NAME = 'my-cli-s3-bucket'
DDB_TABLE_NAME = 'MyTestTable'
REGION = 'us-east-2'

# ---------- INIT CLIENTS ----------
s3 = boto3.client('s3')
dynamodb = boto3.client('dynamodb', region_name=REGION)

# ---------- 1. LIST FILES IN S3 ----------
def list_s3_files(bucket):
    print(f"Files in bucket '{bucket}':")
    try:
        response = s3.list_objects_v2(Bucket=bucket)
        if 'Contents' in response:
            for obj in response['Contents']:
                print(f"- {obj['Key']}")
        else:
            print("Bucket is empty.")
    except ClientError as e:
        print(f"Error: {e}")

# ---------- 2. CREATE DYNAMODB TABLE ----------
def create_dynamodb_table(table_name):
    try:
        existing_tables = dynamodb.list_tables()['TableNames']
        if table_name in existing_tables:
            print(f"Table '{table_name}' already exists.")
            return

        response = dynamodb.create_table(
            TableName=table_name,
            KeySchema=[
                {'AttributeName': 'ID', 'KeyType': 'HASH'}
            ],
            AttributeDefinitions=[
                {'AttributeName': 'ID', 'AttributeType': 'S'}
            ],
            ProvisionedThroughput={
                'ReadCapacityUnits': 5,
                'WriteCapacityUnits': 5
            }
        )
        print(f"Creating table '{table_name}'... Please wait.")
        waiter = boto3.client('dynamodb', region_name=REGION).get_waiter('table_exists')
        waiter.wait(TableName=table_name)
        print("Table created successfully.")
    except ClientError as e:
        print(f"Error creating table: {e}")

# ---------- 3. INSERT ITEM INTO DYNAMODB ----------
def insert_item(table_name):
    try:
        ddb = boto3.resource('dynamodb', region_name=REGION)
        table = ddb.Table(table_name)
        response = table.put_item(
            Item={
                'ID': '123',
                'Name': 'Darshan',
                'Timestamp': '2025-04-22'
            }
        )
        print("Item inserted successfully.")
    except ClientError as e:
        print(f"Error inserting item: {e}")

# ---------- MAIN ----------
if __name__ == '__main__':
    list_s3_files(BUCKET_NAME)
    create_dynamodb_table(DDB_TABLE_NAME)
    insert_item(DDB_TABLE_NAME)
