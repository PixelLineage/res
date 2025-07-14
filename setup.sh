# art
cd art
git fetch https://github.com/PixelLineage/art refs/heads/qpr2
git cherry-pick 13a467c837b63fe692f023cb9daac11d539449d1
git cherry-pick 13a467c837b63fe692f023cb9daac11d539449d1..183028e2397d71bea1c1677d262b32d017cf8006
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
git cherry-pick 82a0a838aa0bd9cfaaa658d45efe5f5364ace2c0
git cherry-pick 82a0a838aa0bd9cfaaa658d45efe5f5364ace2c0..62cc627bedfbc70748b964c3c5a7632e38da265a
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
git cherry-pick 3dba3a3a09864099397b3fd12207a5c85f9678e3
git cherry-pick 3dba3a3a09864099397b3fd12207a5c85f9678e3..5eae73313310993ecb4295bfb8be20ed09097590
cd ..

# uclamp sm8250
cd hardware/qcom-caf/sm8250/display
git fetch https://github.com/PixelLineage/hardware_qcom-caf_sm8250_display refs/heads/a15-new
git cherry-pick 7212ec1109931b7bdc861998c0401654d179a3c9
git cherry-pick 7212ec1109931b7bdc861998c0401654d179a3c9..11b93afbe8f99cd482be5d59b40d6542cc0f4975
cd ../../../..

# audio sm8250
cd hardware/qcom-caf/sm8250/audio
git fetch https://github.com/PixelLineage/hardware_qcom-caf_sm8250_audio refs/heads/qpr2
git cherry-pick 0dff7c15abbef1c4455628b6ea1ba914b699d1dc
git cherry-pick 0dff7c15abbef1c4455628b6ea1ba914b699d1dc..85a330cdf7743b6c899a6f17f6d4a337068f3d3f
cd ../../../..

# fw base
cd frameworks/base
git fetch https://github.com/PixelLineage/frameworks_base refs/heads/qpr2
git cherry-pick 60d9848c7abbd71bbe00adda8ee8c952a9c745fa
git cherry-pick 60d9848c7abbd71bbe00adda8ee8c952a9c745fa..80e51a183d890ece375f5de75c16c6afcb2e8418
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
git cherry-pick 608cdd489c91f29a1609fb2f86d265a11ed78d07
git cherry-pick 608cdd489c91f29a1609fb2f86d265a11ed78d07..34d616d15fb686a744e0812d5c61b9a2ce6fcffc
cd ../..

# vendor overlays
cd packages/overlays/Lineage
git fetch https://github.com/PixelLineage/packages_overlays_Lineage refs/heads/qpr2
git cherry-pick c82cd6ef3c499778557b4f871aa82829d7bbc74b 
git cherry-pick c82cd6ef3c499778557b4f871aa82829d7bbc74b..00a747d0252b81b7a99294dad108d9ffc2d9f954
cd ../../..

# settings
cd packages/apps/Settings
git fetch https://github.com/PixelLineage/packages_apps_Settings refs/heads/qpr2
git cherry-pick 65bf4009a37f76acf4a545907032217c9af5955e
git cherry-pick 65bf4009a37f76acf4a545907032217c9af5955e..2a122d9580c8e2397a629e3c237637659c612aab
cd ../../..

# settings intelligence
cd packages/apps/SettingsIntelligence
git fetch https://github.com/PixelLineage/packages_apps_SettingsIntelligence refs/heads/qpr2
git cherry-pick f2b9181ceef3558536f92fa0ff456b63389a48bb
git cherry-pick f2b9181ceef3558536f92fa0ff456b63389a48bb..98109c1d9ec899244be1968835a5e7e2f0a73d66
cd ../../..

# system core
cd system/core
git fetch https://github.com/PixelLineage/system_core refs/heads/qpr2
git cherry-pick 73e4e4c9bc647cf6ef9f0682a68cb8173fe75a4c
git cherry-pick 73e4e4c9bc647cf6ef9f0682a68cb8173fe75a4c..a458ac1d55201402644ce3aaf325faae2526dd41
cd ../..

# disable lineage stats
cd packages/apps/LineageParts
git fetch https://github.com/PixelLineage/packages_apps_LineageParts refs/heads/qpr2
git cherry-pick a68a859a32089f1d8a56a2d8ff3d55666c71d7d3
git cherry-pick a68a859a32089f1d8a56a2d8ff3d55666c71d7d3..6142cc6fa245544c332240d699ee62a1d9ade7d5
cd ../../..

# device_lineage_sepolicy
cd device/lineage/sepolicy
git fetch https://github.com/PixelLineage/device_lineage_sepolicy refs/heads/qpr2
git cherry-pick 86527173a1bfbaf80fa0b3e112caa805413a9bb6
git cherry-pick 86527173a1bfbaf80fa0b3e112caa805413a9bb6..ba2b41270b360264fad95e72c9d4feaf78a7d447
cd ../../..

# external/lz4
cd external/lz4
git fetch https://github.com/PixelLineage/external_lz4 refs/heads/qpr2
git cherry-pick 92aec625f11184e6dc00f861a361aec5f0ddad6f
git cherry-pick 92aec625f11184e6dc00f861a361aec5f0ddad6f..a2d4dfb993756b0917f3b040fd0b67ef452fbbc2
cd ../..

# external_bouncycastle
cd external/bouncycastle
git fetch https://github.com/PixelLineage/external_bouncycastle refs/heads/qpr2
git cherry-pick c823a11f5a4e0556d3c8d0645b2bb605efd6231a
cd ../..

# updater
cd packages/apps/Updater
git fetch https://github.com/PixelLineage/packages_apps_Updater refs/heads/qpr2
git reset --hard 782c8363bdfdae273f9aa5aa49963af823c29887
cd ../../..