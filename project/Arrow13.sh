crave run --no-patch -- "rm -rf .repo/local_manifests && rm -rf device/xiaomi kernel/xiaomi vendor/xiaomi

repo init --depth=1 -u https://github.com/HinohArata/arrow_manifest.git -b arrow-13.1_ext --git-lfs && mkdir -p .repo/local_manifests

wget -O ".repo/local_manifests/local_manifest.xml" https://raw.githubusercontent.com/Arata-Stuffs/local_manifest/refs/heads/master/local_manifest.xml

# Sync source rom
/opt/crave/resync.sh &&

# Set up build environment
export BUILD_USERNAME=HinohArata && 
export BUILD_HOSTNAME=crave &&
export TZ=Asia/Jakarta &&

# Build rom
. build/envsetup.sh &&
lunch arrow_surya-user &&
make installclean && m bacon"
