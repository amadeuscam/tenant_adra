# import os
# from datetime import datetime
# from pathlib import Path
#
# import boto3
# from botocore.exceptions import NoCredentialsError
# from decouple import Config, RepositoryEnv
# from dotenv import load_dotenv
#
# dotenv_path = Path("/root/django-on-docker/.env.prod")
# load_dotenv(dotenv_path=dotenv_path)
#
#
# class BackupTenantSql:
#     def __init__(self) -> None:
#         self.now = datetime.now()
#         self.date_time = self.now.strftime("%Y%m%d")
#         self.sql_name = f"{self.date_time}060001-backup.sql"
#         self.local_files = f"/root/django-on-docker/databse_backup/{self.sql_name}"
#         self.bucket_name = str(os.getenv("AWS_STORAGE_SQL_BUCKET_NAME"))
#
#     def upload_to_aws(self, local_file, bucket, s3_file=None):
#         s3 = boto3.client(
#             "s3",
#             aws_access_key_id=str(os.getenv("AWS_ACCESS_KEY_ID")),
#             aws_secret_access_key=str(os.getenv("AWS_SECRET_ACCESS_KEY")),
#         )
#
#         if s3_file is None:
#             s3_file = os.path.basename(local_file)
#
#         try:
#             s3.upload_file(local_file, bucket, s3_file)
#             print(f"Upload Successful of {local_file}")
#             return True
#         except FileNotFoundError:
#             print("The file was not found")
#             return False
#         except NoCredentialsError:
#             print("Credentials not available")
#             return False
#
#     def run(self):
#         self.upload_to_aws(self.local_files, self.bucket_name)
#
#
# if __name__ == "__main__":
#     BackupTenantSql().run()
