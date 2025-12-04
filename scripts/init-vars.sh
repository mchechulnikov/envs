#!/usr/bin/env bash

set -euo pipefail

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "Initializing environment variables..."

# Check if fish is available
if ! command -v fish &> /dev/null; then
    echo -e "${YELLOW}Warning: Fish shell not found. Variables will not be set.${NC}"
    echo "Please install Fish shell or set these variables manually:"
    echo "  - SRC_PATH=/Users/$USER/sources"
    echo "  - WG_CONF_PATH=/Users/$USER/.wg"
    echo "  - WG_CONF=default"
    exit 1
fi

# Set universal variables in Fish
fish -c "set -Ux SRC_PATH /Users/$USER/sources"
echo "✓ SRC_PATH set to /Users/$USER/sources"

fish -c "set -Ux WG_CONF_PATH /Users/$USER/.wg"
echo "✓ WG_CONF_PATH set to /Users/$USER/.wg"

fish -c "set -Ux WG_CONF default"
echo "✓ WG_CONF set to default"

echo -e "${GREEN}✓ Environment variables initialized successfully${NC}"
