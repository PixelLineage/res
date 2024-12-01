## Installation

### Notes
- TWRP SKKK works, but not recommended, utilize it at your own risk.
- Firmware is included with the rom.

### Steps
- Download [boot](https://t.me/QuickDump/85) and [vendor_boot](https://t.me/QuickDump/85) images
- Reboot to fastboot mode (Vol Down + Power)
- Flash boot and vendor_boot: `fastboot flash boot boot.img` and `fastboot flash vendor_boot vendor_boot.img`
- Reboot to recovery: `fastboot reboot recovery`
- Go to ADB Sideload and flash rom `adb sideload rom-file.zip`
- Tap yes to reboot recovery and then format data
- Reboot system :)
