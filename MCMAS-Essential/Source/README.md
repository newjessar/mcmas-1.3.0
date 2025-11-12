# MCMAS Source Files

This folder contains the source code for the MCMAS GUI application.

## Files

- **MCMAS.swift** - Main Swift source code for the GUI app
- **MCMAS-2.app/** - App bundle template (copy this to create new versions)
- **build.sh** - Build script to compile and install the app

## How to Build

```bash
cd Source
chmod +x build.sh
./build.sh
```

This will:
1. Compile MCMAS.swift
2. Update MCMAS-2.app
3. Update ../MCMAS-essintial.app

## Requirements

- macOS 12.0 or later
- Xcode Command Line Tools (for swiftc)

## Window Size

Current settings in MCMAS.swift:
- Window: 1125×750 pixels
- Left panel: 310-500px
- Right panel: Remainder (60-70%)

To change, edit these lines in MCMAS.swift:
- Line ~278: `.frame(minWidth: 310, idealWidth: 375, maxWidth: 500)`
- Line ~391: `.frame(minWidth: 1125, minHeight: 750)`

## Known Issues

The app has a 30-second timeout per file to prevent hangs. This is necessary for:
- go_back_n.ispl (state space explosion)
- Any other computationally intensive models
