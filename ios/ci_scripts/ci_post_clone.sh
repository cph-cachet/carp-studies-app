#!/bin/sh

# The default execution directory of this script is the ci_scripts directory.
cd $CI_WORKSPACE # change working directory to the root of your cloned repo.

# Install Flutter using git.
git clone https://github.com/flutter/flutter.git --depth 1 -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

# Install Flutter artifacts for iOS (--ios), or macOS (--macos) platforms.
flutter precache --ios

# Install Flutter dependencies.
flutter pub get

# Install CocoaPods using Homebrew.
HOMEBREW_NO_AUTO_UPDATE=1 # disable homebrew's automatic updates.
brew install cocoapods

#
echo "DOING STUFF 1"
ls -la $CI_WORKSPACE_PATH
echo "DOING STUFF 2"
ls -la $CI_WORKSPACE_PATH/repository

cd $CI_WORKSPACE_PATH

# Install CocoaPods dependencies.
pod install # run `pod install` in the `ios` directory.



exit 0