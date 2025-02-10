# art
cd art
git fetch https://github.com/PixelLineage/art refs/heads/a15
git cherry-pick c17d0487ae0f6a18eadd00169bfa0dc59b8edb8c
git cherry-pick c17d0487ae0f6a18eadd00169bfa0dc59b8edb8c..af06afbf90452b6d74a81ab9591225163f143f9f
cd ..

# build
cd build/make
git fetch https://github.com/PixelLineage/build refs/heads/a15
git cherry-pick a69cdaddea9902a47ce8f1e280b323839d302b03
git cherry-pick a69cdaddea9902a47ce8f1e280b323839d302b03..bb2ca6d19ba3c04f00507106bbe48a4d7c380e20
cd ../..

# build/soong
cd build/soong
git fetch https://github.com/PixelLineage/build_soong refs/heads/a15
git cherry-pick d58844f677d2b6e21c0a6ac9a747a76da700216a
git cherry-pick d58844f677d2b6e21c0a6ac9a747a76da700216a..fe8b41590cbcfcd4a46781a17682ced2e2939518
cd ../..

# bionic
cd bionic
git fetch https://github.com/PixelLineage/bionic refs/heads/a15
git cherry-pick 7abf0b81c0459b755e7d0fa7f0fc09b8dce2cc09
git cherry-pick 7abf0b81c0459b755e7d0fa7f0fc09b8dce2cc09..7ac00f300ad9e6393b05885ddc114df412bb201a
cd ..

# bootable_recovery
cd bootable/recovery
git fetch https://github.com/PixelLineage/bootable_recovery refs/heads/feb25
git cherry-pick 9226d349e830f493addffba7e782acf29382d10f
cd ../..

# external/skia
cd external/skia
git fetch https://github.com/PixelLineage/external_skia refs/heads/feb25
git cherry-pick b4819efeb5641b0e634fb0e768bd543655678213
git cherry-pick b4819efeb5641b0e634fb0e768bd543655678213..d3f553b9f6f08a395ccd41ed8c750639f44967fa
cd ../..

# lineage-sdk
cd lineage-sdk
git fetch https://github.com/PixelLineage/lineage-sdk refs/heads/feb25
git cherry-pick 21032383f878024975bf6b36b11427774f74895a
git cherry-pick 21032383f878024975bf6b36b11427774f74895a..2615eb6f7166dce345e7a9a6527cc646fd3c1932
cd ..

# uclamp sm8250
cd hardware/qcom-caf/sm8250/display
git fetch https://github.com/PixelLineage/hardware_qcom-caf_sm8250_display refs/heads/a15-new
git cherry-pick 7212ec1109931b7bdc861998c0401654d179a3c9
git cherry-pick 7212ec1109931b7bdc861998c0401654d179a3c9..11b93afbe8f99cd482be5d59b40d6542cc0f4975
cd ../../../..

# fw base
cd frameworks/base
git fetch https://github.com/PixelLineage/frameworks_base refs/heads/feb25
git cherry-pick 9591dd9cf4f85b51c853c1d8f897ec70d060f264
git cherry-pick 9591dd9cf4f85b51c853c1d8f897ec70d060f264..c8b3300b55edcd4b66e790d0faee52ab833d4608
cd ../..

# fw native
cd frameworks/native
git fetch https://github.com/PixelLineage/frameworks_native refs/heads/a15
git cherry-pick d3b4eb7fac1876d0d1e6de15edd2601ea2b6dc8f
git cherry-pick d3b4eb7fac1876d0d1e6de15edd2601ea2b6dc8f..cc156011537a743836a0bf7c231b02b32e871d87
cd ../..

# fw av
cd frameworks/av
git fetch https://github.com/PixelLineage/frameworks_av refs/heads/a15
git cherry-pick 9226d349e830f493addffba7e782acf29382d10f
git cherry-pick 9226d349e830f493addffba7e782acf29382d10f..83ef8790302c1d05c2af525a73d09ab08413433a
cd ../..

# vendor
cd vendor/lineage
git fetch https://github.com/PixelLineage/vendor_lineage refs/heads/feb25
git cherry-pick cdfb9ec2e689f275384c4158a1d2b475114b888b
git cherry-pick cdfb9ec2e689f275384c4158a1d2b475114b888b..a8dd42022a23fa0602229e0348094d752ded18a9
cd ../..

# vendor overlays
cd packages/overlays/Lineage
git fetch https://github.com/PixelLineage/packages_overlays_Lineage refs/heads/feb25
git cherry-pick 1afced9a76c63a4c55989ccc1cf5a08d70b6149f 
git cherry-pick 1afced9a76c63a4c55989ccc1cf5a08d70b6149f..2a47e4ee4e5db4a592c3cb4921df7c9aca997ba9
cd ../../..

# settings
cd packages/apps/Settings
git fetch https://github.com/PixelLineage/packages_apps_Settings refs/heads/feb25
git cherry-pick a770f936a3c191379ba4322a45e13138b5db34d2
git cherry-pick a770f936a3c191379ba4322a45e13138b5db34d2..31f3e7612d568771d643d62d87050c71eee631fb
cd ../../..

# system core
cd system/core
git fetch https://github.com/PixelLineage/system_core refs/heads/a15
git cherry-pick 1269d8cb495c3cea9f6853271e5f6bda63c9b969
git cherry-pick 1269d8cb495c3cea9f6853271e5f6bda63c9b969..fb7ce9f6354ae176898b587c16e56951a322bbc9
cd ../..

# updater
cd packages/apps/Updater
git fetch https://github.com/PixelLineage/packages_apps_Updater refs/heads/feb25
git cherry-pick 1b19667ff4b8372ed7472c0008c22014fc21b089
git cherry-pick 1b19667ff4b8372ed7472c0008c22014fc21b089..05038d1b5ccbd3709d0313d21b4a4dee38d930bf
cd ../../..

# disable lineage stats
cd packages/apps/LineageParts
git fetch https://github.com/PixelLineage/packages_apps_LineageParts refs/heads/feb25
git cherry-pick 57c584365e1a8bad75fc76e590986fb5720c27cd
git cherry-pick 57c584365e1a8bad75fc76e590986fb5720c27cd..9b919dbacc8dec8fb570abf54226c4779ce1ce1c
cd ../../..