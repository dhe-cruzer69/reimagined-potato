#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Running cross-package lint..."

# Python
echo "→ Linting cad-automation..."
cd packages/cad-automation
ruff check src/
ruff format --check src/
mypy src/
cd ../..

echo "→ Linting ai-agents..."
cd packages/ai-agents
ruff check agents/
ruff format --check agents/
mypy agents/
cd ../..

# TypeScript
echo "→ Linting web-dashboard..."
cd packages/web-dashboard
npm run lint
npm run type-check
cd ../..

echo ""
echo "✅ Lint complete!"
