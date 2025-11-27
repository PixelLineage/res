# art
cd art
git fetch https://github.com/PixelLineage/art refs/heads/qpr2-new
git cherry-pick f502b0fbe138b58dd4ece90dcaadfc6e93119a08
git cherry-pick f502b0fbe138b58dd4ece90dcaadfc6e93119a08..576e04c88d33839d46c32a7a90a7d18f13b2ca6d
cd ..

# build
cd build/make
git fetch https://github.com/PixelLineage/build refs/heads/qpr2-new
git cherry-pick 8ec7034d678a8cac9dda7009eee3ba71954b7df1
git cherry-pick 8ec7034d678a8cac9dda7009eee3ba71954b7df1..7e21c03d8a4d7ba2cbdf92830a831671e1551a20
cd ../..

# build/soong
cd build/soong
git fetch https://github.com/PixelLineage/build_soong refs/heads/qpr2-new
git cherry-pick f6dd67b6765b4cd6e9b8e0da3a81e6bc5dc7c745
git cherry-pick f6dd67b6765b4cd6e9b8e0da3a81e6bc5dc7c745..c5119570649eb3614e835ff39d5d1a61790c3ffd
cd ../..

# bionic
cd bionic
git fetch https://github.com/PixelLineage/bionic refs/heads/qpr2-new
git cherry-pick 1dcaf56681a83ad74fac3403de00ad56d6087198
git cherry-pick 1dcaf56681a83ad74fac3403de00ad56d6087198..6280ed8c49bf555839dd9437431ccbc91377ee53
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
git fetch https://github.com/PixelLineage/lineage-sdk refs/heads/qpr2-new
git cherry-pick b5094bdcb284a6634ea76066fd51e9b3d74e3619
git cherry-pick b5094bdcb284a6634ea76066fd51e9b3d74e3619..70498cfcaa478c21677a68ea0e2e3dc537dc7340
cd ..

# uclamp sm8250
cd hardware/qcom-caf/sm8250/display
git fetch https://github.com/PixelLineage/hardware_qcom-caf_sm8250_display refs/heads/qpr2-new
git cherry-pick 511e625736506dbed29129de3580b16506893099
git cherry-pick 511e625736506dbed29129de3580b16506893099..eac5f120021faaa3ce448b794829878fbcb49f72
cd ../../../..

# fw base
cd frameworks/base
git fetch https://github.com/PixelLineage/frameworks_base refs/heads/qpr2-new
git cherry-pick 8fd9da6b864af2078675b09a59b3a42246479dcf
git cherry-pick 8fd9da6b864af2078675b09a59b3a42246479dcf..c55de8ca94060365acbd30e12a15d55de226bbea
cd ../..

# fw native
cd frameworks/native
git fetch https://github.com/PixelLineage/frameworks_native refs/heads/qpr2-new
git cherry-pick f5149837bfd5c6e93769e7393d27fb0648dda3d7
git cherry-pick f5149837bfd5c6e93769e7393d27fb0648dda3d7..2849fc9ae56308eebde569b720ce161185fdc7b9
cd ../..

# vendor
cd vendor/lineage
git fetch https://github.com/PixelLineage/vendor_lineage refs/heads/qpr2-new
git cherry-pick 5aa18b409f6e5c51ebe960e391c1f0d406fa227d
git cherry-pick 5aa18b409f6e5c51ebe960e391c1f0d406fa227d..30df885db1da61d049bc73eaecadb9c5d9f4c234
cd ../..

# vendor overlays
cd packages/overlays/Lineage
git fetch https://github.com/PixelLineage/packages_overlays_Lineage refs/heads/qpr2-new
git cherry-pick 6fda15486ddac56092947c2c51f7a83b3db90c14
git cherry-pick 6fda15486ddac56092947c2c51f7a83b3db90c14..0a5a749cb9c601af421963d0fc03c0255958cf50
cd ../../..

# settings
cd packages/apps/Settings
git fetch https://github.com/PixelLineage/packages_apps_Settings refs/heads/qpr2-new
git cherry-pick 4a2d9455e6e12cb3f42fdec18a8ab320674a1d73
git cherry-pick 4a2d9455e6e12cb3f42fdec18a8ab320674a1d73..257d913938fbc2b590f8d030a00dd7131f38693d
cd ../../..

# settings intelligence
cd packages/apps/SettingsIntelligence
git fetch https://github.com/PixelLineage/packages_apps_SettingsIntelligence refs/heads/qpr2
git cherry-pick f2b9181ceef3558536f92fa0ff456b63389a48bb
git cherry-pick f2b9181ceef3558536f92fa0ff456b63389a48bb..98109c1d9ec899244be1968835a5e7e2f0a73d66
cd ../../..

# system core
cd system/core
git fetch https://github.com/PixelLineage/system_core refs/heads/qpr2-new
git cherry-pick bcaab1a06310c0624b1fe611eff5d66d289c769a
git cherry-pick bcaab1a06310c0624b1fe611eff5d66d289c769a..62935549aa1966b7f17e95c43e8d7692763257fb
cd ../..

# LineageParts
cd packages/apps/LineageParts
git fetch https://github.com/PixelLineage/packages_apps_LineageParts refs/heads/qpr2-new
# later fix conflicts
git reset --hard c50486df2b9b82df386170f014a51da5eaa4cdbf
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

# external_boringssl
cd external/boringssl
git fetch https://github.com/PixelLineage/external_boringssl refs/heads/qpr2
git cherry-pick f2d51ab5094f553128f1ec77d85d98dfa4394e46
cd ../..

# system_security
cd system/security
git fetch https://github.com/PixelLineage/system_security refs/heads/qpr2-new
git cherry-pick 47ac3fe32fcc5fccdfbdad91de31cce0c82f769c
git cherry-pick 47ac3fe32fcc5fccdfbdad91de31cce0c82f769c..56242ba24689e94346b39910041b8455f2c3e0d3
cd ../..

# updater
cd packages/apps/Updater
git fetch https://github.com/PixelLineage/packages_apps_Updater refs/heads/qpr2
git reset --hard 9bdb18692970f6f725662b7b6333fb649589dacb
cd ../../..

# zlib-ng
rm -rf external/zlib
git clone https://github.com/yaap/external_zlib-ng external/zlib -b sixteen --depth 1

# jemalloc
rm -rf external/jemalloc_new
git clone https://github.com/The-Pixel-Project/external_jemalloc_new external/jemalloc_new -b 15 --depth 1

# # 95 Pixel SHITS
# git clone -b qpr2 https://gitlab.com/username0136/vendor_gms 
