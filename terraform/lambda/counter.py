import json
import boto3
import os

dynamodb = boto3.resource("dynamodb")
table_name = os.environ["TABLE_NAME"]
table = dynamodb.Table(table_name)


def lambda_handler(event: any, context: any):
    #create a DDB Client
    #get number of visits
    response = table.get_item(Key={
        "user": '1'
        
    })
    #Increment visits
    views = response['Item']['views'] 
    views = int(views) + 1
    print(views)
    
    #put the new visit count into the table
    response = table.put_item(Item={
        'user': '1',
        "views" : views
    })
    
    return views