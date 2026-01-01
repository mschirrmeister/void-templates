# void-templates

Native `aarch64` build templates for the Void Linux Syndicate. Focused on high-performance kernel builds and bootloader support for next-gen ARM hardware.

## The Stash
This repository contains specialized source packages (blueprints) for:
- **ARM Trusted Firmware (ATF):** Modular builds for RK35xx SoCs.
- **U-Boot:** Dedicated builds with optimized boot flows (Distro Boot).
- **Linux Mainline (msc-rc):** Lean, surgical kernel builds with BTF support enabled for Cilium/eBPF cartel operations.

## The Infrastructure
Blueprints are built natively on an **M4 Pro MacBook** using a RAM-disk accelerated `xbps-src` jailhouse.

### Quick Start: Weaponize the Factory

1. Clone the official Void Linux factory:
   ```bash
   git clone --depth 1 https://github.com/void-linux/void-packages.git ~/void-packages
   cd ~/void-packages
   ./xbps-src binary-bootstrap
   ```

2. Clone this repo and link the blueprints:
   ```bash
   git clone https://github.com/mschirrmeister/void-templates.git ~/void-templates
   cd ~/void-templates
   ./scripts/setup-factory.sh
   ```

3. Fire the M4 Pro engine:
   ```bash
   cd ~/void-packages
   ./xbps-src pkg linux6.19-msc-rc
   ```

## Binary Repository
Signed binaries are stashed at: `https://mschirrmeister.github.io/voidrepo/`

### Trust the Authority
To install signed cargo from this repository, import the public key:
```bash
FP="d6:e0:46:a7:79:30:23:d4:31:ce:d1:35:1e:cf:db:44"
sudo curl -L -o "/var/db/xbps/keys/${FP}.plist" "https://mschirrmeister.github.io/voidrepo/msc-syndicate.plist"
```

## Maintainer
**Marco Schirrmeister** - [mschirrmeister@gmail.com](mailto:mschirrmeister@gmail.com)

*Rolling coal on the digital highway since 1995. Stayer of the sweet spot.*
