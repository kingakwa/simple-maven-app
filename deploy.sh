#!/bin/bash

echo "Deploying application..."

# Find the JAR file and run it in the background on port 8080
JAR_FILE=$(ls target/*.jar | head -n 1)

if [[ -f "$JAR_FILE" ]]; then
  chmod +x "$JAR_FILE"
  echo "Running $JAR_FILE..."
  nohup java -jar "$JAR_FILE" > app.log 2>&1 &
  echo "Application deployed and running in background."
else
  echo "No JAR file found in target/. Deployment failed."
  exit 1
fi
