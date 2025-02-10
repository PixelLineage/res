# Emergency SOS Migration ⚠️  

> **Only applicable to users coming from 10 Feb and older builds**  

## Important Notice  

We were previously using the Pixel implementation for the Emergency SOS feature and other functionalities within the **Personal Safety** application. However, recent updates have made these features increasingly dependent on the Pixel framework, which can't be implemented as it's generally a very hacky solution.  

To ensure better stability and reliablity, we have **completely dropped the Pixel implementation** and transitioned to the **default LineageOS SOS feature**.  

- If you are **upgrading from a previous build**, follow the steps outlined below to ensure a smooth transition.
- If you are **clean installing**, no additional steps are required—simply set up the SOS feature as usual.

### Upgrade Instructions 🛠️  

1. **Uninstall the Personal Safety application** from the app drawer.  
2. **Grant necessary permissions**:  
   - Go to **Settings** → **Apps** → **All Apps**.  
   - Tap the **three-dot menu** (top-right corner) and select **"Show system"**.  
   - Search for **Emergency Information** and ensure that **Contacts** and **Phone** permissions are granted (if not already).  

#### Normal SOS Setup  
1. **Enable Emergency SOS**:  
   - Go to **Settings** → **Safety & emergency** → **Emergency SOS**.  
   - Turn it on if it's not already enabled.  
   - Set up your **region’s emergency code**.
2. **Add Emergency Information**:  
   - Go back to **Safety & emergency** → **Emergency Information**.
   - Add **emergency contacts** and fill in your **personal information** as needed.

✅ Your setup is now complete!
