#!/bin/bash
# setup-factory.sh - Verified Surgical Sync

FACTORY_DIR="$HOME/void-packages"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

if [ ! -d "$FACTORY_DIR/srcpkgs" ]; then
    echo "[-] ERROR: Factory at $FACTORY_DIR/srcpkgs not found!"
    exit 1
fi

echo "[+] Syncing Cartel Blueprints from $TEMPLATE_ROOT into $FACTORY_DIR..."

# 1. Loop through all directories in the repo root
for d in "$TEMPLATE_ROOT"/*/; do
    pkg=$(basename "$d")

    # 2. Skip the usual suspects
    case "$pkg" in
        scripts|files|patches|.git) continue ;;
    esac

    # 3. THE SECURITY CHECK: Only sync if it has a 'template' file
    if [ -f "$d/template" ]; then
        echo "  -> Surgical drop for: $pkg"
        rsync -a --delete "$TEMPLATE_ROOT/$pkg/" "$FACTORY_DIR/srcpkgs/$pkg/"
    else
        # 4. Warn about unauthorized cargo in the root
        echo "  [!] Skipping unauthorized folder: $pkg (No template found)"
    fi
done

echo "[+] Operation complete. Factory at $FACTORY_DIR is now weaponized. Only verified cargo was moved."
