# MCMAS - Multi-Agent Model Checker

**Version 2.0** - Enhanced for Apple Silicon with Native macOS GUI

Copyright © 2025 Jay Kahl  
Original MCMAS developed by Alessio Lomuscio et al. at Imperial College London

## What's New in Version 2.0

- ✅ **Native Apple Silicon Support** - Compiled for M1/M2/M3 Macs
- ✅ **Modern SwiftUI Interface** - Clean, native macOS application
- ✅ **Critical Bug Fix** - Fixed random crash bug in modal_formula.cc (case 48)
- ✅ **100% Reliability** - Stable verification with safety timeout protection
- ✅ **Bundled Resources** - Fully portable with included example models

## Requirements

- **macOS**: 12.0 (Monterey) or later
- **Hardware**: Apple Silicon (M1/M2/M3)
- **Dependencies**: None (all system frameworks)

## Installation

### Option 1: Download DMG (Easiest)
1. Download `MCMAS-Installer.dmg` from Releases
2. Open the DMG and drag MCMAS.app to Applications
3. Right-click MCMAS.app → Open (first time only)

### Option 2: Build from Source
```bash
# Install Bison (for compilation only)
brew install bison

# Compile MCMAS engine
cd mcmas-1.3.0
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
make clean
make

# Build GUI app
cd MCMAS-Essential/Source
bash build.sh
open ../MCMAS.app
```

## Usage

1. Launch MCMAS.app
2. Accept the disclaimer
3. Select an .ispl model file from the left panel
4. Click "Start Verification"
5. View results in the output panel

## Key Features

- **Real-time Verification**: Process multi-agent models with live output
- **Example Models**: 15 included examples (dining cryptographers, muddy children, etc.)
- **Safety Timeout**: 30-second max per formula to prevent infinite loops
- **Custom Models**: Add your own via Settings → Choose Models Folder

## Bug Fix Details (Version 2.0)

**Problem**: MCMAS 1.3.0 had a critical bug in `utilities/modal_formula.cc` causing random crashes (~30% failure rate) when verifying ATL formulas.

**Root Cause**: In case 48 (ATL operator U), a `break` statement was incorrectly placed inside an `else` block instead of at the case level. When `ATLsemantics == 0`, the code took the `if` branch, skipped the `else` block entirely (including the break), and fell through to case 50, causing undefined behavior.

**Solution**: Moved the `break` statement outside the if/else block to case level, matching the pattern in case 47. Result: 100% reliability verified with 50+ consecutive test runs.

## License

Personal and educational use only. No warranty provided. See full disclaimer in app.

## Credits

- **Original MCMAS**: Alessio Lomuscio, Hongyang Qu, Franco Raimondi
- **Version 2.0 Enhancement**: Jay Kahl (M1 compilation, GUI, bug fix)
- **CUDD Library**: Fabio Somenzi, University of Colorado Boulder

## Support

For issues or questions, open an issue on GitHub.

---

**Website**: http://www.doc.ic.ac.uk/~rac101/mcmas/
