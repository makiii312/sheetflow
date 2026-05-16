FROM node:24

WORKDIR /app

RUN corepack enable && corepack prepare pnpm@11.1.2 --activate

# 1. Copy Workspace manifests ONLY (This keeps dependency layer cached)
COPY pnpm-lock.yaml pnpm-workspace.yaml package.json ./
COPY apps/api/package.json ./apps/api/
COPY apps/worker/package.json ./apps/worker/
COPY apps/web/package.json ./apps/web/
COPY packages/ ./packages/

# 2. Install dependencies (Cached unless package.json/lock changes)
RUN pnpm install --frozen-lockfile

# 3. Copy source code
COPY . .

# 4. Run the shared build script so internal packages link up correctly
RUN sh scripts/build.sh

EXPOSE 5173

# Ensure Vite listens on 0.0.0.0 so you can access it from Windows
CMD ["sh", "scripts/dev.sh", "--host", "0.0.0.0"]