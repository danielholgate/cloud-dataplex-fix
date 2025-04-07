#!/bin/bash

# Edit PROJECT_ID and REGION to match your environment
PROJECT_ID=PROJECT_ID
REGION=us-central1

IMAGE_NAME="dataplex-oracle-pyspark"
IMAGE_VERSION="0.0.2"
IMAGE=${IMAGE_NAME}:${IMAGE_VERSION}
REPO_IMAGE=${REGION}-docker.pkg.dev/${PROJECT_ID}/docker-repo/${IMAGE_NAME}

docker build -t "${IMAGE}" .

# Tag and push to GCP container registry
gcloud config set project ${PROJECT_ID}
gcloud auth configure-docker ${REGION}-docker.pkg.dev
docker tag "${IMAGE}" "${REPO_IMAGE}"
docker push "${REPO_IMAGE}"
