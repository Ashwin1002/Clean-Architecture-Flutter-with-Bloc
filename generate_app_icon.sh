#!/bin/bash

# Check if Flutter CLI is installed
if ! command -v flutter &> /dev/null; then
    echo "Error: Flutter CLI not found. Please install Flutter and make sure it's added to your PATH."
    exit 1
fi

# Check if flutter_launcher_icons package is present in pubspec.yaml
if ! grep -q "flutter_launcher_icons" pubspec.yaml; then
    echo "Error: flutter_launcher_icons package not found in pubspec.yaml. Please add the package to your dependencies."
    exit 1
fi

if flutter pub run flutter_launcher_icons:main; then
    echo "App icons generated successfully."
else
    echo "Error: Failed to generate app icons."
    exit 1
fi