## Installation

### Notes
- By installing this ROM, you accept all risks and agree to the [disclaimer](https://github.com/PixelLineage/res/blob/main/disclaimer.md).
- Recommended firmware is [OS1.0.9.0.ULMMIXM](https://xmfirmwareupdater.com/firmware/munch/stable/OS1.0.9.0.ULMMIXM/).
- Indian users, kindly use this firmware: [OS1.0.7.0.ULMINXM](https://xmfirmwareupdater.com/firmware/munch/stable/OS1.0.7.0.ULMINXM/)

### Steps
- Firstly install HyperOS 1.0.9.0.ULMMIXM (or OS1.0.7.0.ULMINXM if Indian user) (optional step, recommended for better stability)
- Download [installation kit](https://littlechest365-my.sharepoint.com/personal/quick_skinow_skin/_layouts/15/download.aspx?share=IQCfuwt8Y0czQbXKKnlX0GWTAWnPoW_KcrEFLLDEBaS5zow)
- Reboot to fastboot mode (Vol Down + Power)
- Flash boot, dtbo and vendor_boot images:  
  ```sh
  fastboot flash boot boot.img
  fastboot flash dtbo dtbo.img
  fastboot flash vendor_boot vendor_boot.img
  ```
- Reboot to recovery: `fastboot reboot recovery`
- Go to ADB Sideload and flash rom `adb sideload rom-file.zip`
- Tap yes to reboot recovery and then format data
- Reboot system :)
