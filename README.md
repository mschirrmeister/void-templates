# void-templates

Void Linux build templates for aarch64, focused on mainline kernels and bootloaders for Rockchip RK35xx boards.

## Contents

- ARM Trusted Firmware (ATF) with modular builds for RK35xx SoCs.
- U-Boot with Distro Boot support.
- Mainline Linux kernels (`msc-rc`), kept lean and built with BTF so Cilium and other eBPF tools work fully.

The packages are built natively on an M4 Pro MacBook, using `xbps-src` with a RAM disk to speed up builds.

## Quick start

1. Clone void-packages and bootstrap the build environment:
   ```bash
   git clone --depth 1 https://github.com/void-linux/void-packages.git ~/void-packages
   cd ~/void-packages
   ./xbps-src binary-bootstrap
   ```

2. Clone this repository and link the templates:
   ```bash
   git clone https://github.com/mschirrmeister/void-templates.git ~/void-templates
   cd ~/void-templates
   ./scripts/setup-factory.sh
   ```

3. Build a package, for example the current mainline kernel:
   ```bash
   cd ~/void-packages
   ./xbps-src pkg linux7.3-msc-rc
   ```

## Binary repository

Signed binaries are published at `https://mschirrmeister.github.io/voidrepo/`. See [voidrepo](https://github.com/mschirrmeister/voidrepo) for setup. To trust the repository, import the public key:

```bash
FP="d6:e0:46:a7:79:30:23:d4:31:ce:d1:35:1e:cf:db:44"
sudo curl -L -o "/var/db/xbps/keys/${FP}.plist" "https://mschirrmeister.github.io/voidrepo/msc-syndicate.plist"
```

## Maintainer

Marco Schirrmeister ([mschirrmeister@gmail.com](mailto:mschirrmeister@gmail.com))
