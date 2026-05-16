#!/bin/bash

echo "Building all packages..."

pnpm --filter shared-types build
pnpm --filter validation build
pnpm --filter spreadsheet build
pnpm --filter mongodb build

pnpm --filter api build
pnpm --filter worker build
pnpm --filter web build