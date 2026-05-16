FROM node:24

WORKDIR /app

# Enable pnpm v11
RUN corepack enable && corepack prepare pnpm@11.1.2 --activate

# 1. COPY WORKSPACE MAP (Essential for pnpm workspaces)
# We copy the root files AND the sub-package manifests
COPY pnpm-lock.yaml pnpm-workspace.yaml package.json ./
COPY apps/api/package.json ./apps/api/
COPY apps/worker/package.json ./apps/worker/
COPY apps/web/package.json ./apps/web/
COPY packages/ ./packages/

# 2. Install dependencies (Cached unless package.json/lock changes)
RUN pnpm install --frozen-lockfile

# 3. Copy source code
COPY . .

# 4. Run the build script
RUN pnpm --filter worker build

CMD ["node", "apps/worker/dist/main"]