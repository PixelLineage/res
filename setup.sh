# art
cd art
git fetch https://github.com/PixelLineage/art refs/heads/qpr
git cherry-pick 8b8e08365f2f457e5c2b27bd8e81139e21ff1ffd
git cherry-pick 8b8e08365f2f457e5c2b27bd8e81139e21ff1ffd..bf4d0b3ab20e2271639a80d60e5e2e3d698b7fd9
cd ..

# build
cd build/make
git fetch https://github.com/PixelLineage/build refs/heads/qpr
git cherry-pick a73fa4abca574d530a22ab844d908756437d182d
git cherry-pick a73fa4abca574d530a22ab844d908756437d182d..c83ebb2dc7c8a916b94d38daa2a0fd58be128602
cd ../..

# build/soong
cd build/soong
git fetch https://github.com/PixelLineage/build_soong refs/heads/qpr
git cherry-pick 28a9e626d0dcce62ff4c9b724dca524337dd99cf
git cherry-pick 28a9e626d0dcce62ff4c9b724dca524337dd99cf..4ec42f161bc60ed752a2cfff4cf04943e1d62cc8
cd ../..

# bionic
cd bionic
git fetch https://github.com/PixelLineage/bionic refs/heads/qpr
git cherry-pick f82fc0fcc6dcec34136d3d1e630ef5f87097d867
git cherry-pick f82fc0fcc6dcec34136d3d1e630ef5f87097d867..9315ac962e6297c881aef12a247bc9b371b8a608
cd ..

# bootable_recovery
cd bootable/recovery
git fetch https://github.com/PixelLineage/bootable_recovery refs/heads/feb25
git cherry-pick 9226d349e830f493addffba7e782acf29382d10f
cd ../..

# external/skia
cd external/skia
git fetch https://github.com/PixelLineage/external_skia refs/heads/qpr
git cherry-pick c084d0b8d853958730b4985ba6df15f6e1bedb5a
git cherry-pick c084d0b8d853958730b4985ba6df15f6e1bedb5a..f154d45292ec8da1ac33c79a3e6a20d9e7c3d449
cd ../..

# lineage-sdk
cd lineage-sdk
git fetch https://github.com/PixelLineage/lineage-sdk refs/heads/qpr
git cherry-pick a9704bd1446059a3cf456aa78ea120dfb4ab3f26
cd ..

# uclamp sm8250
cd hardware/qcom-caf/sm8250/display
git fetch https://github.com/PixelLineage/hardware_qcom-caf_sm8250_display refs/heads/a15-new
git cherry-pick 7212ec1109931b7bdc861998c0401654d179a3c9
git cherry-pick 7212ec1109931b7bdc861998c0401654d179a3c9..11b93afbe8f99cd482be5d59b40d6542cc0f4975
cd ../../../..

# fw base
cd frameworks/base
git fetch https://github.com/PixelLineage/frameworks_base refs/heads/qpr
git cherry-pick 99b726f6c782623980d1e2773e86b6c911e57bd1
git cherry-pick 99b726f6c782623980d1e2773e86b6c911e57bd1..ade02b655de7646e44ab9e2bc0b37bf40212b4c2
cd ../..

# fw native
cd frameworks/native
git fetch https://github.com/PixelLineage/frameworks_native refs/heads/qpr
git cherry-pick fc9e4c59d0ea6e2697ada3280222ec915f5eca7f
git cherry-pick fc9e4c59d0ea6e2697ada3280222ec915f5eca7f..03abba7b51a8de3c7634823e789ad840090d9e2b
cd ../..

# vendor
cd vendor/lineage
git fetch https://github.com/PixelLineage/vendor_lineage refs/heads/qpr
git cherry-pick 405b8f5369d6513d352c6a5b4b6b7d00ff5c54b2
git cherry-pick 405b8f5369d6513d352c6a5b4b6b7d00ff5c54b2..a1591f25f59163d0a1f2e18a6ccf73407e7a3c76
cd ../..

# vendor overlays
cd packages/overlays/Lineage
git fetch https://github.com/PixelLineage/packages_overlays_Lineage refs/heads/qpr
git cherry-pick 0cf728d7fc7ee56b3c6d7b4ae6a1158ce54083df 
git cherry-pick 0cf728d7fc7ee56b3c6d7b4ae6a1158ce54083df..1ed2375639bdc7caf063e38b2e69ad7a536eae2e
cd ../../..

# settings
cd packages/apps/Settings
git fetch https://github.com/PixelLineage/packages_apps_Settings refs/heads/qpr
git cherry-pick 2d28d61688ba2f54e94563dd43eb60e8008d3df6
git cherry-pick 2d28d61688ba2f54e94563dd43eb60e8008d3df6..9865f6f89bd94dac31bd22ef48a9890a93cb38e4
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
git fetch https://github.com/PixelLineage/packages_apps_LineageParts refs/heads/qpr2
git cherry-pick 6a57a6c4b3272587b9f1876f7ab43a5de7bb320b
git cherry-pick 6a57a6c4b3272587b9f1876f7ab43a5de7bb320b..4f072f2e6a21a01c3d3dbfbe0796561e2d8b5ab2
cd ../../..