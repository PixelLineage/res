# art
cd art
git fetch https://github.com/PixelLineage/art refs/heads/qpr2
git cherry-pick 134039aeb238d8d7615c920769a6b87f51b7010c
git cherry-pick 134039aeb238d8d7615c920769a6b87f51b7010c..5d617258e0ba2009ccf516fecc3bc0afd8b3c326
cd ..

# build
cd build/make
git fetch https://github.com/PixelLineage/build refs/heads/qpr2
git cherry-pick cd44eb76b1dc592d9de3e465887086bd749dd9bf
git cherry-pick cd44eb76b1dc592d9de3e465887086bd749dd9bf..f74b68728e215bef562cb3dc66ab887ee15dd0a6
cd ../..

# build/soong
cd build/soong
git fetch https://github.com/PixelLineage/build_soong refs/heads/qpr2
git cherry-pick 83a25ab65baf49e0450ab73644a5f08f5181b382
git cherry-pick 83a25ab65baf49e0450ab73644a5f08f5181b382..fdd9af5aa319361b21d5cf3b851e59b58ba85732
cd ../..

# bionic
cd bionic
git fetch https://github.com/PixelLineage/bionic refs/heads/qpr2
git cherry-pick 8be0495eb7e15910776d3582787511c2c57e58b6
git cherry-pick 8be0495eb7e15910776d3582787511c2c57e58b6..662fcd8cea9294cb4b6033497d0bbe149d69a194
cd ..

# bootable_recovery
cd bootable/recovery
git fetch https://github.com/PixelLineage/bootable_recovery refs/heads/qpr2
git cherry-pick 4e92d616cd30925eecfeeed23d64ce65d72053b9
cd ../..

# external/skia
cd external/skia
git fetch https://github.com/PixelLineage/external_skia refs/heads/qpr2
git cherry-pick 18217a3d77b5a44c6192a742c78a1b5b3e30e149
git cherry-pick 18217a3d77b5a44c6192a742c78a1b5b3e30e149..bf2d484c933c433bd2aee80a8408bd89b0074128
cd ../..

# lineage-sdk
cd lineage-sdk
git fetch https://github.com/PixelLineage/lineage-sdk refs/heads/qpr2
git cherry-pick d0acab6ab4aa30b18474c0ee932e5574d07a90f8
cd ..

# uclamp sm8250
cd hardware/qcom-caf/sm8250/display
git fetch https://github.com/PixelLineage/hardware_qcom-caf_sm8250_display refs/heads/a15-new
git cherry-pick 7212ec1109931b7bdc861998c0401654d179a3c9
git cherry-pick 7212ec1109931b7bdc861998c0401654d179a3c9..11b93afbe8f99cd482be5d59b40d6542cc0f4975
cd ../../../..

# fw base
cd frameworks/base
git fetch https://github.com/PixelLineage/frameworks_base refs/heads/qpr2
git cherry-pick 0ef52a671d0c1eb8e05e7569d0b65b2d66f2068d
git cherry-pick 0ef52a671d0c1eb8e05e7569d0b65b2d66f2068d..8476f3d116a3c50abc52b5d7c0742ccad718af83
cd ../..

# fw native
cd frameworks/native
git fetch https://github.com/PixelLineage/frameworks_native refs/heads/qpr2
git cherry-pick 3a98e4bd2df3a44f9f947ed5acad6da4c4c777f9
git cherry-pick 3a98e4bd2df3a44f9f947ed5acad6da4c4c777f9..a3d774d06fcb15a7dd8dd4d9281a46531813a9a5
cd ../..

# vendor
cd vendor/lineage
git fetch https://github.com/PixelLineage/vendor_lineage refs/heads/qpr2
git cherry-pick 68d08386a386496d980d2287957ba5e9ee5108fc
git cherry-pick 68d08386a386496d980d2287957ba5e9ee5108fc..34310a48ee86b3a37e9310dfc65de0df1d09f39c
cd ../..

# vendor overlays
cd packages/overlays/Lineage
git fetch https://github.com/PixelLineage/packages_overlays_Lineage refs/heads/qpr2
git cherry-pick 25bd8075dfabfab43e21fe088a29674461cf4fed 
git cherry-pick 25bd8075dfabfab43e21fe088a29674461cf4fed..1de4235f2c81735fd9bd63309cee55c1f1f90dfa
cd ../../..

# settings
cd packages/apps/Settings
git fetch https://github.com/PixelLineage/packages_apps_Settings refs/heads/qpr2
git cherry-pick 71abb73fc1ef3c9e53d275e33a758d22e65871b5
git cherry-pick 71abb73fc1ef3c9e53d275e33a758d22e65871b5..7f3d5148aea467cd48fd974183b51a595b54f5a0
cd ../../..

# system core
cd system/core
git fetch https://github.com/PixelLineage/system_core refs/heads/qpr2
git cherry-pick 8e4c97b52bccbb1a54fab3514036e016731a49b7
git cherry-pick 8e4c97b52bccbb1a54fab3514036e016731a49b7..791c8b304265274a0527a33c7af8771173aa17b5
cd ../..

# updater
cd packages/apps/Updater
git fetch https://github.com/PixelLineage/packages_apps_Updater refs/heads/qpr2
git cherry-pick 34396181117f6a6bed2932cc676f160e351457f1
git cherry-pick 34396181117f6a6bed2932cc676f160e351457f1..0468adf23ecc3f188ad57a0165c6eda0e4b4b3b1
cd ../../..

# disable lineage stats
cd packages/apps/LineageParts
git fetch https://github.com/PixelLineage/packages_apps_LineageParts refs/heads/qpr2
git cherry-pick 036403c7c6852cbd939b154181602e71fb288068
git cherry-pick 036403c7c6852cbd939b154181602e71fb288068..8b85b648d133750ab2c9adc99df9568e3f3884f7
cd ../../..

# device_lineage_sepolicy
cd device/lineage/sepolicy
git fetch https://github.com/PixelLineage/device_lineage_sepolicy refs/heads/qpr2
git cherry-pick 226a9e1471a1a16939a9dcab0a3094223612619e
cd ../../..

# system/security
cd system/security
git fetch https://github.com/PixelLineage/system_security refs/heads/qpr2
git cherry-pick 321b1f83d3a2682de9d373ab3db6121a1f521aa4
git cherry-pick 321b1f83d3a2682de9d373ab3db6121a1f521aa4..c2b8b0b828baf30eec72e66ecf918b579a223745
cd ../..

# boringssl
cd external/boringssl
git fetch https://github.com/PixelLineage/external_boringssl refs/heads/qpr2
git cherry-pick f2d51ab5094f553128f1ec77d85d98dfa4394e46
cd ../..