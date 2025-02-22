#!/bin/bash

# Setup URL
GIT="https://github.com"
LAB="https://gitlab.com"
ARATA="HinohArata"
ARATA1="Arata-Stuffs"

# Setup directory
LOCAL=".repo/local_manifests"

if repo init --depth=1 -u $GIT/RisingTechOSS/android.git -b fifteen --git-lfs; then
     echo -e "================================"
     echo -e "=      Build starting...       ="
     echo -e "================================"
     echo -e "=  Repo has been initialized   ="
     echo -e "================================"
     if [ -d "$LOCAL" ]; then
         rm -rf $LOCAL/*
         if wget -O "$LOCAL/local_manifest.xml" https://raw.githubusercontent.com/$ARATA1/manifest/refs/heads/15-ros/local_manifest.xml; then
             echo -e "================================"
             echo -e "=  Local manifest initialized  ="
             echo -e "================================"

             # Set up build environment
             /opt/crave/resync.sh; export BUILD_USERNAME=HinohArata; export BUILD_HOSTNAME=crave; export TZ=Asia/Jakarta

             # Build rom
             source build/envsetup.sh; riseup surya user; make installclean; rise b
         else
             echo -e "================================"
             echo -e "= Failed to iniatylizing local ="
             echo -e "================================"
         fi
     else
         echo -e "$LOCAL not found, no need to remove"
         mkdir -p $LOCAL
         if wget -O "$LOCAL/local_manifest.xml" https://raw.githubusercontent.com/$ARATA1/manifest/refs/heads/15-ros/local_manifest.xml; then
             echo -e "================================"
             echo -e "=  Local manifest initialized  ="
             echo -e "================================"

             # Set up build environment
             /opt/crave/resync.sh; export BUILD_USERNAME=HinohArata; export BUILD_HOSTNAME=crave; export TZ=Asia/Jakarta

             # Build rom
             source build/envsetup.sh; riseup surya user; make installclean; rise b
         else
             echo -e "================================"
             echo -e "= Failed to iniatylizing local ="
             echo -e "================================"
         fi
     fi
else
     echo -e "================================"
     echo -e "=         Build Failed         ="
     echo -e "================================"
fi
