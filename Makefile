.PHONY: help build run shell chat chat-sandbox

help:
 @echo "Gemini Development Environment"
 @echo "Available commands:"
 @echo "  make build        - Build the container"
 @echo "  make run          - Start the environment"
 @echo "  make shell        - Access the container"
 @echo "  make chat         - Start interactive Gemini chat"
 @echo "  make chat-sandbox - Start Gemini chat in sandbox mode (safer)"

build:
 docker compose build gemini

run:
 docker compose up -d gemini

shell:
 docker compose exec gemini /bin/bash

chat:
 @echo "Starting Gemini AI chat session..."
 @docker compose up -d gemini > /dev/null 2>&1
 @sleep 1
 @echo "Tip: Type 'exit' to end the session"
 @docker compose exec gemini gemini -m

chat-sandbox:
 @echo "Starting Gemini AI chat in sandbox mode (restricted access)..."
 @docker compose up -d gemini > /dev/null 2>&1
 @sleep 1
 @echo "Tip: Type 'exit' to end the session"
 @docker compose exec gemini gemini -m --sandbox