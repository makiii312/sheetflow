#!/bin/bash

echo "Starting SheetFlow services..."

# Run backend services in the background
pnpm --filter api dev &
pnpm --filter worker dev &

# Run web in the foreground and pass all script arguments (like --host)
pnpm --filter web dev "$@"

wait