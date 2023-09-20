import os
from datetime import datetime

import boto3
from botocore.exceptions import NoCredentialsError
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    def handle(self, *args, **options):
        now = datetime.now()
        date_time = now.strftime("%Y%m%d")

        sql_name = f"{date_time}060001-backup.sql"
        local_file = f"/root/django-on-docker/databse_backup/{sql_name}"
        bucket_name = os.getenv("AWS_STORAGE_SQL_BUCKET_NAME")
        s3_file_name = f"{bucket_name}/backup.sql"
        print(sql_name)
        print(local_file)
        print(s3_file_name)

        self.upload_to_aws(local_file, bucket_name)

    def upload_to_aws(self, local_file, bucket, s3_file=None):
        s3 = boto3.client(
            "s3",
            aws_access_key_id=os.getenv("AWS_SECRET_ACCESS_KEY"),
            aws_secret_access_key=os.getenv("AWS_ACCESS_KEY_ID"),
        )

        try:
            s3.upload_file(local_file, bucket, s3_file)
            print(f"Upload Successful of {local_file}")
            return True
        except FileNotFoundError:
            print("The file was not found")
            return False
        except NoCredentialsError:
            print("Credentials not available")
            return False
