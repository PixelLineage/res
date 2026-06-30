## Installation

### Notes
- By installing this ROM, you accept all risks and agree to the [disclaimer](https://github.com/PixelLineage/res/blob/main/disclaimer.md).
- Recommended firmware is [OS1.0.2.0.TKHMIXM](https://xmfirmwareupdater.com/firmware/alioth/stable/OS1.0.2.0.TKHMIXM/).

### Steps
- Firstly install HyperOS 1.0.2.0.TKHMIXM (must do for better stability)
- Download [installation kit](https://littlechest365-my.sharepoint.com/personal/quick_skinow_skin/_layouts/15/download.aspx?share=IQADo1mk7WwoT785OKIST1YKAUessX6uCMlZDdRD9Tps0s8)
- Reboot to fastboot mode (Vol Down + Power)
- Flash boot, dtbo and vendor_boot images:  
  ```sh
  fastboot flash boot boot.img
  fastboot flash dtbo dtbo.img
  fastboot flash vendor_boot vendor_boot.img
  ```
- Reboot to recovery: `fastboot reboot recovery`
- Go to "Apply update" then "Apply from ADB"
- Flash rom `adb sideload rom-file.zip`
- Tap yes to reboot recovery and then format data
- After entering recovery again, "Reboot system" :)
