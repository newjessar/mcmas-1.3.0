# MCMAS GUI Application - Version 2.3

## What's New in Version 2.3 🎨

**UI Enhancements & Fixes:**
- ✅ **Fixed disclaimer behavior** - Now shows only once on first app launch, not per tab
- ✅ **Added info banner** - Permanent attribution and contact info in left panel
- ✅ **File menu added** - Quick access to folder operations (Choose/Open Models Folder)
- ✅ **Tab bar visibility** - Improved tab bar appearance on app launch
- ✅ **Independent tabs** - Each tab has its own state and file selections

**Previous Release (v2.2):**
- Idle CPU usage reduced from 5-15% to 0.0-0.1%
- Verification speed increased 100x+ (4+ seconds → ~0.01s)
- Faster timeout (10 seconds, down from 30)
- Fixed critical MCMAS 1.3.0 bug causing random crashes

## What's Inside

- **MCMAS Launcher.app** - Native macOS application with GUI
- **System Files/** - MCMAS verification engine
- **Verification Models/** - 15 example ISPL model files
- **doc/** - Original MCMAS documentation

## How to Use

### Option 1: GUI Application (Recommended)
1. Double-click **MCMAS Launcher.app**
2. Select model files using checkboxes (numbers 1-15)
3. Click "Verify Selected" button
4. View results in the right panel
5. Copy results by selecting text

**Features:**
- ✅ File numbering for easy reference
- ✅ Manual refresh when adding new .ispl files (click "Add/Edit Models")
- ✅ Copyable/selectable verification output
- ✅ Warning icons for problematic files
- ✅ **10-second timeout per file** (prevents hangs) - Reduced from 30s in v2.1
- ✅ Real-time progress tracking
- ✅ **Optimized performance** - Fast verification and minimal CPU usage

### Option 2: Command Line
```bash
cd MCMAS-Essential
./System\ Files/mcmas "Verification Models/your_file.ispl"
```

## Important Notes

### Known Issues
Two files have known problems and are **unchecked by default**:

1. **bit_transmission_protocol_ldl.ispl** ⚠️
   - Uses LDL (Linear Dynamic Logic) syntax
   - Not supported in MCMAS 1.3.0
   - Will show parse error

2. **go_back_n.ispl** ⚠️
   - Causes state space explosion
   - Hangs during "Building reachable state space" phase
   - Will timeout after 10 seconds if selected (reduced from 30s in v2.1)

### Working Files
13 out of 15 files work perfectly:
- TestSingleAssignment.ispl ✅
- Tianji_horse_racing_game.ispl ✅
- bit_transmission_protocol-2.ispl ✅
- bit_transmission_protocol.ispl ✅
- bit_transmission_protocol_ltl_ctl_equiv.ispl ✅
- book_store.ispl ✅
- card_games.ispl ✅
- dining_cryptographers.ispl ✅
- muddy_children.ispl ✅
- simple_card_game.ispl ✅
- software_development.ispl ✅
- strongly_connected.ispl ✅
- test.ispl ✅

## Tips

- **"Select All"** button automatically skips problematic files
- Click "Add/Edit Models" to open the folder in Finder
- Right-click any file to edit it in your default .ispl editor
- Results are shown sequentially as each file completes
- Progress counter shows: [X/Total] for each file

## Technical Details

- Built for **Apple Silicon (M1/M2/M3/M4)** Macs
- MCMAS version: 1.3.0 Enhanced
- GUI version: **2.3** (UI Enhanced)
- Supports: LTL, CTL, CTL*, ATL, ATLK formulas
- GUI framework: SwiftUI (requires macOS 12.0+)

## Troubleshooting

**App won't open?**
- Right-click → Open (first time only)
- Allow unidentified developer in System Preferences

**Results not showing?**
- Check Console.app for "MCMAS" process logs
- Verify files exist in "Verification Models" folder

**App crashes?**
- Make sure you're not selecting go_back_n.ispl
- Try running fewer files at once
- Report issue with Console.app logs

## Credits

- Original MCMAS: http://vas.doc.ic.ac.uk/tools/mcmas/
- GUI Version 2.3 by Jay Kahl - Performance optimizations and bug fixes
- Enhanced for Apple Silicon with native GUI launcher
