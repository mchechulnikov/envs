#!/usr/bin/env bash

set -euo pipefail

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "Installing devbox..."
if ! command -v devbox &> /dev/null; then
    curl -fsSL https://get.jetify.com/devbox | bash
    echo -e "${GREEN}✓ devbox installed successfully${NC}"
else
    echo -e "${YELLOW}devbox is already installed${NC}"
fi

echo ""
echo "Setting global environment variables from .env.global..."

if [ ! -f .env.global ]; then
    echo -e "${YELLOW}Warning: .env.global file not found${NC}"
    exit 0
fi

while IFS='=' read -r key value || [ -n "$key" ]; do
    # Skip empty lines and comments
    if [ -z "$key" ] || [[ "$key" =~ ^[[:space:]]*# ]]; then
        continue
    fi

    # Trim whitespace
    key=$(echo "$key" | xargs)
    value=$(echo "$value" | xargs)

    echo "Setting $key globally..."

    # Try to set in Fish shell if available, fallback to bash export
    if command -v fish &> /dev/null; then
        fish -c "set -Ux $key $value" 2>/dev/null || export "$key=$value"
    else
        export "$key=$value"
    fi
done < .env.global

echo -e "${GREEN}✓ Global environment variables set successfully${NC}"
