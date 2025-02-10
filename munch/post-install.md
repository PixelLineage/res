## Post Install Instructions
This guide includes optional random setup tweaks that may deliver better experience, know what you are doing, before following.

***

### Display Size
Recommended display size for better visiblity and usage, use "412".  
Settings -> System -> Developer Options -> Smallest Width  
> Tip: You can disable developer options after setting this as this particular option is persistent.

***

### Emergency SOS
1. **Enable Emergency SOS**:  
   - Go to **Settings** → **Safety & emergency** → **Emergency SOS**.  
   - Turn it on if it's not already enabled.  
   - Set up your **region’s emergency code**.
2. **Add Emergency Information**:  
   - Go back to **Safety & emergency** → **Emergency Information**.
   - Add **emergency contacts** and fill in your **personal information** as needed.

***

### Enabling Auto HBM
I Recommend to enable it, to have nice experience in direct sunlight.  
Settings -> Display -> High Brightness Mode -> Auto HBM

***

### Fake Smoothness | Reduce Animations
If you would like to feed OCD, you can get some fake smoothness by tweaking animator scale duration.  
Let's boost little animations to get a little satisfaction without losing the animated' feel.  
You can set them to 0.9x
```sh
adb shell
settings put global animator_duration_scale 0.9
```
Note
> Developer options must be on, and if you turn it off, this value will be overwritten to 1.0.

***

### i've planned more.
- will be added soon!
