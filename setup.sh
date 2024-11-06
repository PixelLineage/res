# art
cd art
git fetch https://github.com/PixelLineage/art refs/heads/Relocation
git cherry-pick a4c8122a619bc771166a96e809c38578b8331bcf
git cherry-pick 05ad106e5582769a2664cae96b22a4b3a19fa054
cd ..

# build
cd build/make
git fetch https://github.com/PixelLineage/build refs/heads/Relocation
git cherry-pick 90839d83aaa0773cf87536f4c32ae7fd85341d3f
git cherry-pick 869c14bb43de729b71b8fc50a8251365e37c925e
cd ../..

# build/soong
cd build/soong
git fetch https://github.com/PixelLineage/build_soong refs/heads/Relocation
git cherry-pick f0899ba54e92a3af4ad03f91b127c98b8e16b559
cd ../..

# bionic
cd bionic
git fetch https://github.com/PixelLineage/bionic refs/heads/Relocation
git cherry-pick 31b0ca5b2d25a27c9017edb5b226b118f13679e7
git cherry-pick 31b0ca5b2d25a27c9017edb5b226b118f13679e7..ade42c9554765bbaa07e0318bd11f8004e451253
cd ..

# bootable/recovery
cd bootable/recovery
git fetch https://github.com/PixelLineage/bootable_recovery refs/heads/Relocation
git cherry-pick a2adecb37709205e397f450ea9b68017d9986fa6
git cherry-pick 614abd1b6f8fc3d22fc163c06ddbcf4ddcc71b16
cd ../..

# external/boringssl
cd external/boringssl
git fetch https://github.com/PixelLineage/external_boringssl refs/heads/Relocation
git cherry-pick 5d7ee55e05e4cbc6994046088eb0e8ca0fef04b3
cd ../..

# external/skia
cd external/skia
git fetch https://github.com/PixelLineage/external_skia refs/heads/Relocation
git cherry-pick ee2f752a6dfc864d129557bc0f547ed2315a5253
git cherry-pick ee2f752a6dfc864d129557bc0f547ed2315a5253..79250e820d8713b4f6df9f97c6537b74b528e406
cd ../..

# lineage-sdk
cd lineage-sdk
git fetch https://github.com/PixelLineage/lineage-sdk refs/heads/Relocation
git cherry-pick 31d6386a039791e754d1a27729e371224d334c72
cd ..

# uclamp sm8250
cd hardware/qcom-caf/sm8250/display
git fetch https://github.com/PixelLineage/hardware_qcom-caf_sm8250_display refs/heads/Relocation2
git cherry-pick 1bfe1c869203355fc0684c7aed154292d74c44c3
git cherry-pick 1bfe1c869203355fc0684c7aed154292d74c44c3..db883747e76004bd9a4d2fa795f5ed95c04b9cbc
cd ../../../..

# fw base
cd frameworks/base
git fetch https://github.com/PixelLineage/frameworks_base refs/heads/Relocation
git cherry-pick 1661e1120f5ed503367656111be1002aaff95c77
git cherry-pick 1661e1120f5ed503367656111be1002aaff95c77..8666c18788bab6edfd7f3a0c16650dc2029d8e9d
cd ../..

# fw native
cd frameworks/native
git fetch https://github.com/PixelLineage/frameworks_native refs/heads/Relocation
git cherry-pick cec9da7e33eecd5603ef2e8f8d74cfa9425925b1
git cherry-pick cec9da7e33eecd5603ef2e8f8d74cfa9425925b1..5c02338b88006db13c33ea5ff0c304cc0f08ec6b
cd ../..

# vendor
cd vendor/lineage
git fetch https://github.com/PixelLineage/vendor_lineage refs/heads/Relocation
git cherry-pick 8dbc7df3cae2886c322c4106f365e7cdc68f607c
git cherry-pick 8dbc7df3cae2886c322c4106f365e7cdc68f607c..72f7dc425f9b041d0569278270eb2dca95e25836
cd ../..

# vendor overlays
cd packages/overlays/Lineage
git fetch https://github.com/PixelLineage/packages_overlays_Lineage refs/heads/Relocation
git cherry-pick 58077fc3d9df1a438719d84ebec7a1fac68de96f 
git cherry-pick 58077fc3d9df1a438719d84ebec7a1fac68de96f..9a9a603ee6dad7a686194a4754e6da057479dd5e
cd ../../..

# settings
cd packages/apps/Settings
git fetch https://github.com/PixelLineage/packages_apps_Settings refs/heads/Relocation
git cherry-pick a809cdeafa9fc5e5c555de61e1040ed53a66f1e4
git cherry-pick a809cdeafa9fc5e5c555de61e1040ed53a66f1e4..9839b10c2a0363bf72623e7c8558cdb89ce62def
cd ../../..

# system core
cd system/core
git fetch https://github.com/PixelLineage/system_core refs/heads/Relocation
git cherry-pick 3719934f78eaefd93e9d2b55bdbecd47bed82c36
git cherry-pick 3719934f78eaefd93e9d2b55bdbecd47bed82c36..31494f80d61533912e229939793a360828c91c41
cd ../..

# system security
cd system/security
git fetch https://github.com/PixelLineage/system_security refs/heads/Relocation
git cherry-pick 061de8983535864d63555a76789ff6cb37bfd3ef
git cherry-pick 061de8983535864d63555a76789ff6cb37bfd3ef..f02c1292e0cfd6e5d63b728a142b3fd199a39546
cd ../..

# updater
cd packages/apps/Updater
git fetch https://github.com/PixelLineage/packages_apps_Updater refs/heads/Relocation
git cherry-pick 5c32ebb3e3627d88e355ee2de7800e033d924538
cd ../../..