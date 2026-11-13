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

# build/soong (jemalloc dropped; peter-fix reverts + revolut check included)
cd build/soong
git fetch https://github.com/PixelLineage/build_soong refs/heads/a17
git cherry-pick 71fed84ccf1a20e860ed8a937ebe0a70f2b44c2a
git cherry-pick 71fed84ccf1a20e860ed8a937ebe0a70f2b44c2a..9aad58505430fd818f6b5a32d1dfe897d7f40146
cd ../..

# bionic
cd bionic
git fetch https://github.com/PixelLineage/bionic refs/heads/a17
git cherry-pick 8e5d93d4032a89e23a8bf7ade44897888479bd63
git cherry-pick 8e5d93d4032a89e23a8bf7ade44897888479bd63..57896ac0960755fd91412de2e1fa4149d560a106
cd ..

# bootable_recovery
cd bootable/recovery
git fetch https://github.com/PixelLineage/bootable_recovery refs/heads/qpr2
git cherry-pick 4e92d616cd30925eecfeeed23d64ce65d72053b9
cd ../..

# bpf - BPF-less kernel support (fuck-bpf)
cd system/bpf
git fetch https://github.com/PixelLineage/system_bpf refs/heads/a17
git cherry-pick 4f2e414cbc6ee899bb89315d67e9863eb74f4f90
git cherry-pick 4f2e414cbc6ee899bb89315d67e9863eb74f4f90..7482a25e253a74e7f6868d22648efc89c6eaa518
cd ../..

# netd - BPF-less kernel support (fuck-bpf)
cd system/netd
git fetch https://github.com/PixelLineage/system_netd refs/heads/a17
git cherry-pick 6325e02f64542c6f84b5c3c733862a6b26537a8d
git cherry-pick 6325e02f64542c6f84b5c3c733862a6b26537a8d..5760abb08d9775b9ce1445ccf5266461e3294b67
cd ../..

# DnsResolver - BPF-less kernel support (fuck-bpf)
cd packages/modules/DnsResolver
git fetch https://github.com/PixelLineage/packages_modules_DnsResolver refs/heads/a17
git cherry-pick 1e946799ba08f79754109d482c9de7d725ee5a4b
cd ../../..

# Connectivity - eman kernel booting fixes
cd packages/modules/Connectivity
git fetch https://github.com/PixelLineage/packages_modules_Connectivity refs/heads/a17
git cherry-pick fe0fb681eb38c24fb78ab748636cffb0ae28ae79
git cherry-pick fe0fb681eb38c24fb78ab748636cffb0ae28ae79..a4e54986417fe2a50d2216096ba8e8a4013c062b
cd ../../..

# kernel/configs - eman kernel booting fixes (FCM 7 needs minlts lowered for 4.19.246)
cd kernel/configs
git fetch https://github.com/PixelLineage/android_kernel_configs refs/heads/a17
git cherry-pick e000f612e1201f27b5db5804ef23c7a9d4abbaf0
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
git fetch https://github.com/PixelLineage/hardware_qcom-caf_sm8250_display refs/heads/q2
git cherry-pick 4825d10bdbb290b35f5565c988ef5cf2d0697870
git cherry-pick 4825d10bdbb290b35f5565c988ef5cf2d0697870..5ec1106f9cec0d8ddac10cfd84677e0d15ec9cda
cd ../../../..

# frameworks/av - lto fix
cd frameworks/av
git fetch https://github.com/PixelLineage/frameworks_av refs/heads/q2
git cherry-pick 5fe32e255528306ed923feea5c0ee48c83ce7c60
cd ../..

# frameworks/base
cd frameworks/base
git fetch https://github.com/PixelLineage/frameworks_base refs/heads/a17
git cherry-pick 6170adad57364a9e7165c6ebab3b4abc0ad2ec59
git cherry-pick 6170adad57364a9e7165c6ebab3b4abc0ad2ec59..bd0314752bf23b2cae756c628d305950f046fac3
cd ../..

# frameworks/native - optimization
cd frameworks/native
git fetch https://github.com/PixelLineage/frameworks_native refs/heads/a17
git cherry-pick 12b2a97d31b255a322d3a5e8551d2dcc5af92a8b
git cherry-pick 12b2a97d31b255a322d3a5e8551d2dcc5af92a8b..08ebdd41867b437953253e0baa7ff99d5e72a610
cd ../..

# vendor
cd vendor/lineage
git fetch https://github.com/PixelLineage/vendor_lineage refs/heads/a17
git cherry-pick 8f05321584175fe882b0a957348644a4f305efa7
git cherry-pick 8f05321584175fe882b0a957348644a4f305efa7..087ca3fa8197768456284637560d4d5212fcf9e5
cd ../..

# settings
cd packages/apps/Settings
git fetch https://github.com/PixelLineage/packages_apps_Settings refs/heads/a17
git cherry-pick b4a01337e9fd492c15601fa5ccfea6f606bd1cab
git cherry-pick b4a01337e9fd492c15601fa5ccfea6f606bd1cab..27c21fdab1c6f91570d52f575aeb1d0504b188f9
cd ../../..

# lineage-sdk
cd lineage-sdk
git fetch https://github.com/PixelLineage/lineage-sdk refs/heads/q2 --depth 10
git cherry-pick f9acc2080f40af380d7b3086633494c12d57b3e4
git cherry-pick f9acc2080f40af380d7b3086633494c12d57b3e4..24e513567e8fc5a195e6f450ee721c0365eb7443
cd ..

# LineageParts
cd packages/apps/LineageParts
git fetch https://github.com/PixelLineage/packages_apps_LineageParts refs/heads/q2
git cherry-pick 7c264d5fb5581e47267129285d0add4c7b53abc8
git cherry-pick 7c264d5fb5581e47267129285d0add4c7b53abc8..8f10f90265da2575c7c555057ff845c3e9557952
cd ../../..

# settings intelligence
cd packages/apps/SettingsIntelligence
git fetch https://github.com/PixelLineage/packages_apps_SettingsIntelligence refs/heads/qpr2
git cherry-pick 80cb150197fc16560ca74929efb103d01d45e6ed
git cherry-pick 80cb150197fc16560ca74929efb103d01d45e6ed..98109c1d9ec899244be1968835a5e7e2f0a73d66
cd ../../..

# system core - kernel booting fix (includes jemalloc revert)
cd system/core
git fetch https://github.com/PixelLineage/system_core refs/heads/a17
git cherry-pick 53f6435af43ec873e58711d5738bcc97832a9135
git cherry-pick 53f6435af43ec873e58711d5738bcc97832a9135..959448537ad3edf220fd48a81270b77d0b08fb4c
cd ../..

# system/fs/fs_mgr - adb remount without unlocked bootloader (moved out of system/core in A17)
cd system/fs/fs_mgr
git fetch https://github.com/PixelLineage/system_fs_fs_mgr refs/heads/a17
git cherry-pick 1b40ceeca5703e1f446afdd637244140fe1912f9
cd ../../..

# fk off libinder
cd system/vold
git fetch https://github.com/PixelLineage/system_vold
git cherry-pick ebff65bce27ab917dd273f602cd858cd469536bb
cd ../..

# device_lineage_sepolicy - rebrand props
cd device/lineage/sepolicy
git fetch https://github.com/PixelLineage/device_lineage_sepolicy refs/heads/q2
git cherry-pick 3170c4b8f805a840b611dab10e2fa48d8c492c4b
git cherry-pick 3170c4b8f805a840b611dab10e2fa48d8c492c4b..FETCH_HEAD
cd ../../..

# updater
cd packages/apps/Updater
git fetch https://github.com/PixelLineage/packages_apps_Updater refs/heads/a17
git cherry-pick c95cbc628b66617efb099d6f4f11a5ad8cf7c7f0
git cherry-pick c95cbc628b66617efb099d6f4f11a5ad8cf7c7f0..FETCH_HEAD
cd ../../..


# external_boringssl - integrity
cd external/boringssl
git fetch https://github.com/PixelLineage/external_boringssl refs/heads/a17
git cherry-pick 5c26a7aa9e58867fd28e3a4d0da0797880e875bd
cd ../..

# system_security - integrity
cd system/security
git fetch https://github.com/PixelLineage/system_security refs/heads/a17
git cherry-pick 1723b5654f4acdba0c99f79919f564fe39d0c4ab
git cherry-pick 1723b5654f4acdba0c99f79919f564fe39d0c4ab..FETCH_HEAD
cd ../..

# ca-certificates - drop compromised emSign root
cd system/ca-certificates
git fetch https://github.com/PixelLineage/system_ca-certificates refs/heads/a17
git cherry-pick ad59e7afbf280fc991678c049011f1a091720f02
cd ../..

# hw ximi
rm -rf hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_xiaomi hardware/xiaomi -b lineage-24.0

# zlib-ng
rm -rf external/zlib
git clone https://github.com/EmanuelCN/zlib-ng/ -b 17 external/zlib --depth 1

# jemalloc
#rm -rf external/jemalloc_new
#git clone https://github.com/yaap/external_jemalloc_new external/jemalloc_new -b sixteen --depth 1

# face unlock pos
rm -rf packages/apps/ParanoidSense
git clone https://github.com/PixelOS-AOSP/android_packages_apps_ParanoidSense packages/apps/ParanoidSense -b seventeen --depth 1

# lineage compat - megvii revert no longer needed (ParanoidSense seventeen ships libmegface_sense)

# GMS PARTY
rm -rf vendor/pixel
git clone --depth 1 -b seventeen https://gitlab.com/PixelOS-AOSP/proprietary_vendor_pixel_clocks.git vendor/pixel/clocks
git clone --depth 1 -b a17 https://gitlab.com/username0136/vendor-pixel-gms.git vendor/pixel/gms
git clone --depth 1 -b seventeen https://gitlab.com/PixelOS-AOSP/proprietary_vendor_pixel_gsans.git vendor/pixel/gsans
git clone --depth 1 -b seventeen https://gitlab.com/PixelOS-AOSP/proprietary_vendor_pixel_launcher.git vendor/pixel/launcher
git clone --depth 1 -b seventeen https://gitlab.com/PixelOS-AOSP/proprietary_vendor_pixel_sounds.git vendor/pixel/sounds
git clone --depth 1 -b a17 https://gitlab.com/username0136/vendor-pixel-themepicker.git vendor/pixel/themepicker
