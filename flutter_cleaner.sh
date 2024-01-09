# Check if Flutter CLI is installed
if ! command -v flutter &> /dev/null; then
    echo "Error: Flutter CLI not found. Please install Flutter and make sure it's added to your PATH."
    exit 1
fi

rm -Rf ios/Pods && \
rm -Rf ios/.symlinks && \
rm -Rf ios/Flutter/Flutter.framework && \
rm -Rf ios/Flutter/Flutter.podspec && \
rm -rf ~/.pub-cache && \
flutter pub get && \
cd ios && flutter precache --ios && pod install --repo-update && cd ..