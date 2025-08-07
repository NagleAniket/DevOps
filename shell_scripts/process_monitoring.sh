#!/bin/bash

# Function to print header
print_header() {
    printf "%-10s %-15s %-10s %-10s %-20s\n" "PID" "USER" "CPU(%)" "MEM(%)" "COMMAND"
    printf "%-10s %-15s %-10s %-10s %-20s\n" "----------" "---------------" "----------" "----------" "--------------------"
}

# Function to display processes in a formatted table
monitor_processes() {
    while true; do
        clear
        echo "=============== PROCESS MONITORING SCRIPT ==============="
        echo "Press Ctrl + C to stop monitoring."
        print_header

        # Fetch top 10 processes sorted by CPU usage
        ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 11 | tail -n 10 | while read pid user cpu mem command; do
            printf "%-10s %-15s %-10s %-10s %-20s\n" "$pid" "$user" "$cpu" "$mem" "$command"
        done

        echo "========================================================"
        sleep 5  # Refresh every 5 seconds
    done
}

# Run the monitoring function
#monitor_processes

