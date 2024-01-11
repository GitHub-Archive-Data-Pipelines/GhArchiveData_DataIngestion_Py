FROM public.ecr.aws/lambda/python:3.8

# set arguments
ARG DEST_BUCKET_NAME
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_DEFAULT_REGION
ARG AWS_BUCKET
ARG AWS_USE_PATH_STYLE_ENDPOINT

# install required packages
COPY requirements.txt  .
RUN  pip3 install -r requirements.txt

# Copy function code
COPY app.py ${LAMBDA_TASK_ROOT}

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "app.handler" ] 