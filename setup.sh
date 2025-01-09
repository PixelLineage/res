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

# external/skia
cd external/skia
git fetch https://github.com/PixelLineage/external_skia refs/heads/Relocation
git cherry-pick ee2f752a6dfc864d129557bc0f547ed2315a5253
git cherry-pick ee2f752a6dfc864d129557bc0f547ed2315a5253..daf906193ee7cc8da8acbb6f0fdd294aee8f90c0
cd ../..

# lineage-sdk
cd lineage-sdk
git fetch https://github.com/PixelLineage/lineage-sdk refs/heads/lineage-21.0
git cherry-pick e18ba0c49e3f96fce60a1731c01c2b3162b403c1
cd ..

# uclamp sm8250
cd hardware/qcom-caf/sm8250/display
git fetch https://github.com/PixelLineage/hardware_qcom-caf_sm8250_display refs/heads/a15
git cherry-pick 8ec0b57354cd95bd794a9db8a21db77d6c840bc1
git cherry-pick 8ec0b57354cd95bd794a9db8a21db77d6c840bc1..42f5e08c4b523d8f3f9dd31a1dcbafcb524f56ee
cd ../../../..

# fw base
cd frameworks/base
git fetch https://github.com/PixelLineage/frameworks_base refs/heads/15
git cherry-pick 4c8a2b119e7dc5cafe1694624d49766983703bc1
git cherry-pick 4c8a2b119e7dc5cafe1694624d49766983703bc1..33552d97a52d43e45899a8201ebbdb5101817fb4
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
git cherry-pick 65dafb9a13492675fc4ef1da048f730f566d593e
git cherry-pick 65dafb9a13492675fc4ef1da048f730f566d593e..83ef8790302c1d05c2af525a73d09ab08413433a
cd ../..

# vendor
cd vendor/lineage
git fetch https://github.com/PixelLineage/vendor_lineage refs/heads/a15
git cherry-pick e6f82de92e90f3f477717daa959df815dd3b6a90
git cherry-pick e6f82de92e90f3f477717daa959df815dd3b6a90..08f35a6131bd81797e605819ca04a341cec84713
cd ../..

# vendor overlays
cd packages/overlays/Lineage
git fetch https://github.com/PixelLineage/packages_overlays_Lineage refs/heads/a15
git cherry-pick 74e711ffb071991e0f3d55edef6159465f099077 
git cherry-pick 74e711ffb071991e0f3d55edef6159465f099077..e1bed6d43d816754fef611123f13caf8f24a7e3e
cd ../../..

# settings
cd packages/apps/Settings
git fetch https://github.com/PixelLineage/packages_apps_Settings refs/heads/a15
git cherry-pick 819b3da3509a542faf0b40f21dd8de5250d185fb
git cherry-pick 819b3da3509a542faf0b40f21dd8de5250d185fb..10c4c324296f58fd963326e0443abad2f68d6bcd
cd ../../..

# system core
cd system/core
git fetch https://github.com/PixelLineage/system_core refs/heads/a15
git cherry-pick 1269d8cb495c3cea9f6853271e5f6bda63c9b969
git cherry-pick 1269d8cb495c3cea9f6853271e5f6bda63c9b969..fb7ce9f6354ae176898b587c16e56951a322bbc9
cd ../..

# updater
cd packages/apps/Updater
git fetch https://github.com/PixelLineage/packages_apps_Updater refs/heads/a15
git cherry-pick 5c32ebb3e3627d88e355ee2de7800e033d924538
cd ../../..