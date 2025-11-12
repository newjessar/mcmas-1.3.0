#!/bin/zsh
# Build script for MCMAS GUI App

echo "🔨 Building MCMAS GUI App..."

cd "$(dirname "$0")"

# Compile the Swift app
swiftc -parse-as-library -o MCMAS-binary MCMAS.swift 2>&1 | grep -v "warning:"

if [ $? -eq 0 ]; then
    echo "✅ Compilation successful"
    
    # Update the app bundle
    cp MCMAS-binary ../MCMAS.app/Contents/MacOS/MCMAS
    
    echo "✅ Updated app bundle"
    echo ""
    echo "App is ready! To run:"
    echo "  open ../MCMAS.app"
else
    echo "❌ Compilation failed"
    exit 1
fi
