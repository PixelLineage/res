# art
cd art
git fetch https://github.com/PixelLineage/art refs/heads/q2
git cherry-pick be78c36f215bd7632a4334f2ff3c0c6aeb21070d
git cherry-pick be78c36f215bd7632a4334f2ff3c0c6aeb21070d..a53e12d0d760eeaa97d4a400fb7e379e1e1250aa
cd ..

# build
cd build/make
git fetch https://github.com/PixelLineage/build refs/heads/a16
git cherry-pick 64f50670dc86ecfba82aa67a55f61b143f594384
git cherry-pick 64f50670dc86ecfba82aa67a55f61b143f594384..114a1564b22d7a6e9c8d8d64d57bfa02a3e9f2b7
cd ../..

# build/soong
cd build/soong
git fetch https://github.com/PixelLineage/build_soong refs/heads/q2
git cherry-pick 5431c27ff60f9234f0f5eeac811eea82175b9423
git cherry-pick 5431c27ff60f9234f0f5eeac811eea82175b9423..daee004e6a00f52f843f7502621a771d71f74cf6
git revert --no-edit 00f0f12293c56309a55bfb2c674a19e6af734ead # rm jemalloc fix later

# peter fix
git revert --no-edit 5d5ec9bb94d22288f24aaa5e1b72f10239eea968
git revert --no-edit 2f11f7125083bd39d321933744e90b16d52cbc41
git revert --no-edit e28a2eae962ec559578211c3c452f13aaf65886f
git revert --no-edit 6db11ffea72411f726ee1d4bd81a39bff34956ed

# revolut check
git cherry-pick a9d0e04d478f157ebc063d30949ee96e9342c032

cd ../..

# bionic
cd bionic
git fetch https://github.com/PixelLineage/bionic refs/heads/q2
git cherry-pick da71ebfc8d3caf706c260b61542ebd8331b25c7b
git cherry-pick da71ebfc8d3caf706c260b61542ebd8331b25c7b..949a46c3063d7b1e506103bf30af3ae754f8296e
cd ..

# # bpf - eman kernel booting fixes
# cd system/bpf
# git fetch https://github.com/PixelLineage/system_bpf
# git cherry-pick 1d16349406245e8af702ca487fc886ccd83f3c3a
# git cherry-pick 1d16349406245e8af702ca487fc886ccd83f3c3a..cb6687df303676ae05a9c1f006dd8cd9551b06aa
# cd ../..

# Connectivity - eman kernel booting fixes
cd packages/modules/Connectivity
git fetch https://github.com/PixelLineage/packages_modules_Connectivity refs/heads/bq2
git cherry-pick 7dba8af6e8405469c7513eb931a46cfbcd5fc74e
git cherry-pick 2cac40a2e85621bb8c764912d02627e28d7bdddb
git cherry-pick 22d1be2000842204f07e19e4798cb04d882b31f2
git cherry-pick ec44cf04f64d92d79563b0d01301d5e7e75741f3
cd ../../..

# kernel/configs - eman kernel booting fixes
cd kernel/configs
git fetch https://github.com/PixelLineage/android_kernel_configs refs/heads/sixteen-qpr2
git cherry-pick dd6267a47cdc8b4bbbb9d6c56431886627c91616
cd ../..

# external/skia - optimization
cd external/skia
git fetch https://github.com/PixelLineage/external_skia refs/heads/qpr2
git cherry-pick 18217a3d77b5a44c6192a742c78a1b5b3e30e149
git cherry-pick 18217a3d77b5a44c6192a742c78a1b5b3e30e149..bf2d484c933c433bd2aee80a8408bd89b0074128
cd ../..

# external/lz4 - optimization
cd external/lz4
git fetch https://github.com/PixelLineage/external_lz4 refs/heads/qpr2
git cherry-pick 92aec625f11184e6dc00f861a361aec5f0ddad6f
git cherry-pick 92aec625f11184e6dc00f861a361aec5f0ddad6f..a2d4dfb993756b0917f3b040fd0b67ef452fbbc2
cd ../..

# uclamp sm8250 - optimization
cd hardware/qcom-caf/sm8250/display
git fetch https://github.com/PixelLineage/hardware_qcom-caf_sm8250_display refs/heads/qpr2-new
git cherry-pick 511e625736506dbed29129de3580b16506893099
git cherry-pick 511e625736506dbed29129de3580b16506893099..eac5f120021faaa3ce448b794829878fbcb49f72
cd ../../../..

# frameworks/av - lto fix
cd frameworks/av
git fetch https://github.com/PixelLineage/frameworks_av refs/heads/q2
git cherry-pick 5fe32e255528306ed923feea5c0ee48c83ce7c60
cd ../..

# frameworks/base
cd frameworks/base
git fetch https://github.com/PixelLineage/frameworks_base refs/heads/q2
git cherry-pick f280238c2ddf89f85860278601a4a0df695f9f32
git cherry-pick f280238c2ddf89f85860278601a4a0df695f9f32..2141ecd9af2b654b3837f8cd9929054252c29e2e
cd ../..

# frameworks/native - optimization
cd frameworks/native
git fetch https://github.com/PixelLineage/frameworks_native refs/heads/q2
git cherry-pick afaf501a27bcbfd93b3c985c82d49b8ea52f9039
git cherry-pick afaf501a27bcbfd93b3c985c82d49b8ea52f9039..9706c75efa3578c935fad0b9f11b4c251f1e567d
cd ../..

# vendor
cd vendor/lineage
git fetch https://github.com/PixelLineage/vendor_lineage refs/heads/q2
git cherry-pick 95f24a4c94e7fb776b2988ea0cba9c6012230055
git cherry-pick 95f24a4c94e7fb776b2988ea0cba9c6012230055..7b1720bc
cd ../..

# settings
cd packages/apps/Settings
git fetch https://github.com/PixelLineage/packages_apps_Settings refs/heads/q2
git cherry-pick fb3a6d14013fd44cb2a85df6070dbcbd0378bbdf
git cherry-pick fb3a6d14013fd44cb2a85df6070dbcbd0378bbdf..7d3700d7214
cd ../../..

# lineage-sdk
cd lineage-sdk
git fetch https://github.com/PixelLineage/lineage-sdk refs/heads/qpr2-new --depth 10
git cherry-pick b5094bdcb284a6634ea76066fd51e9b3d74e3619
git cherry-pick b5094bdcb284a6634ea76066fd51e9b3d74e3619..70498cfcaa478c21677a68ea0e2e3dc537dc7340
cd ..

# LineageParts
cd packages/apps/LineageParts
git fetch https://github.com/PixelLineage/packages_apps_LineageParts refs/heads/q2
git cherry-pick d246c5b646c1fa0e0547314fa297b3912eb4e758
git cherry-pick d246c5b646c1fa0e0547314fa297b3912eb4e758..802487d185bb7d7b15eb54967e621dbd29fad085
cd ../../..

# settings intelligence
cd packages/apps/SettingsIntelligence
git fetch https://github.com/PixelLineage/packages_apps_SettingsIntelligence refs/heads/qpr2
git cherry-pick 80cb150197fc16560ca74929efb103d01d45e6ed
git cherry-pick 80cb150197fc16560ca74929efb103d01d45e6ed..98109c1d9ec899244be1968835a5e7e2f0a73d66
cd ../../..

# system core - kernel booting fix
cd system/core
git fetch https://github.com/PixelLineage/system_core refs/heads/q2
git cherry-pick a1a995619113f0caf32dc06593af18df45c91833
git cherry-pick a1a995619113f0caf32dc06593af18df45c91833..eeafce19e080bb68927e2107dfccddf0d6cd54f4
git revert --no-edit 7c9d074741d2e7947ae58ec014078f4813e1cdd5 # rm jemalloc fix later
cd ../..

# updater
cd packages/apps/Updater
git fetch https://github.com/PixelLineage/packages_apps_Updater refs/heads/a16
git cherry-pick ac04611d6f54f89e764ec0186b633e316fd82559
cd ../../..

# hw ximi
rm -rf hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_xiaomi hardware/xiaomi -b lineage-23.2

# # zlib-ng
# rm -rf external/zlib
# git clone https://github.com/yaap/external_zlib-ng external/zlib -b sixteen --depth 1

# jemalloc
#rm -rf external/jemalloc_new
#git clone https://github.com/yaap/external_jemalloc_new external/jemalloc_new -b sixteen --depth 1

# face unlock pos
rm -rf packages/apps/ParanoidSense
git clone https://github.com/PixelOS-AOSP/android_packages_apps_ParanoidSense packages/apps/ParanoidSense -b sixteen-qpr2 --depth 1

# lineage compat - drop megvii - paranoidsense conflict
cd hardware/lineage/compat
git fetch https://github.com/PixelLineage/hardware_lineage_compat
git cherry-pick 7d22a8df8d25c1c0e35c867fb2454eb4726825af
git cherry-pick 7d22a8df8d25c1c0e35c867fb2454eb4726825af..1f05e32bd3d40fb8fa15baec6a7e614daced1d11
cd ../../..

# GMS PARTY
rm -rf vendor/pixel
git clone --depth 1 -b sixteen-qpr2 https://gitlab.com/PixelOS-AOSP/proprietary_vendor_pixel_clocks.git vendor/pixel/clocks
git clone --depth 1 -b q2 https://gitlab.com/username0136/vendor-pixel-gms.git vendor/pixel/gms
git clone --depth 1 -b sixteen-qpr2 https://gitlab.com/PixelOS-AOSP/proprietary_vendor_pixel_gsans.git vendor/pixel/gsans
git clone --depth 1 -b sixteen-qpr2 https://gitlab.com/PixelOS-AOSP/proprietary_vendor_pixel_launcher.git vendor/pixel/launcher
git clone --depth 1 -b sixteen-qpr2 https://gitlab.com/PixelOS-AOSP/proprietary_vendor_pixel_sounds.git vendor/pixel/sounds
git clone --depth 1 -b q2 https://gitlab.com/username0136/vendor-pixel-themepicker.git vendor/pixel/themepicker
