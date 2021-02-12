#!/bin/sh

# Setup tools for interacting with Google Cloud.

# Install gcloud if it doesn't already exist.
if ! command -v gcloud &> /dev/null
then
  homebrew install google-cloud-sdk
  # exit
fi

