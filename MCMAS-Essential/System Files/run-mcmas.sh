#!/bin/zsh
# MCMAS Easy Launcher Script
# Double-click this file in Finder or run from terminal

# Change to MCMAS directory
cd "$(dirname "$0")"

# Function to display the file list
show_menu() {
    echo ""
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║              MCMAS - Model Checker Launcher                    ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo ""
    echo "Available verification models:"
    echo ""

    # Create array of files - now looking in Verification Models
    files=(../Verification\ Models/*.ispl)
    count=1

    # Display numbered list
    for file in "${files[@]}"; do
        printf "%2d) %s\n" $count "$(basename "$file")"
        count=$((count + 1))
    done

    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

# Main loop
first_run=true
while true; do
    # Only clear on first run or refresh
    if [[ "$first_run" == true ]]; then
        clear
        first_run=false
    fi
    
    show_menu
    
    echo ""
    read "choice?Enter number (or press Enter for #1): "

    # Default to 1 if no input
    if [[ -z "$choice" ]]; then
        choice=1
    fi

    # Validate input is a number
    if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
        echo ""
        echo "❌ Error: Please enter a valid number"
        sleep 2
        continue
    fi

    # Validate number is in range
    if [[ $choice -lt 1 || $choice -gt ${#files[@]} ]]; then
        echo ""
        echo "❌ Error: Please enter a number between 1 and ${#files[@]}"
        sleep 2
        continue
    fi

    # Get selected file
    selected_file="${files[$choice]}"

    echo ""
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║              Running: $(basename "$selected_file" | head -c 43)"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo ""

    ./mcmas "$selected_file"

    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "What would you like to do?"
    echo "  1) Run another file (keeps results above)"
    echo "  2) Refresh & clear screen"
    echo "  3) Exit"
    echo ""
    read "action?Enter choice (1-3): "

    case $action in
        1)
            # Continue loop WITHOUT clearing - results stay visible
            ;;
        2)
            # Refresh and CLEAR screen
            echo ""
            echo "♻️  Refreshing file list..."
            sleep 1
            clear
            ;;
        3|q|Q|exit|quit)
            echo ""
            echo "👋 Goodbye!"
            exit 0
            ;;
        *)
            # Default to running another file (option 1)
            ;;
    esac
done
