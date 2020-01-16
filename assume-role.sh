#!/bin/bash

function assume_role {
    echo "Assuming Role: $1 with Session Name: $2"
    credentials="$(aws sts assume-role --role-arn "$1" --role-session-name "$2")"
    AWS_ACCESS_KEY_ID="$(echo "$credentials" | jq -r .Credentials.AccessKeyId)"
    AWS_SECRET_ACCESS_KEY="$(echo "$credentials" | jq -r .Credentials.SecretAccessKey)"
    AWS_SESSION_TOKEN="$(echo "$credentials" | jq -r .Credentials.SessionToken)"
    export AWS_ACCESS_KEY_ID
    export AWS_SECRET_ACCESS_KEY
    export AWS_SESSION_TOKEN
    echo "Assumed Role: $1"
}
