
#!/bin/bash

# Author: Your Name
# Purpose: System Information Report

echo "================================"
echo "SYSTEM INFORMATION REPORT"
echo "================================"

echo "Name: Mayank Sharma"
echo "Roll Number: 2601730007"
echo "Date: $(date)"

echo ""
echo "CPU Information:"
lscpu | grep -E 'Model name|CPU\(s\):' | head -2

echo ""
echo "Memory Information:"
free -h

echo ""
echo "Top 3 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -4

echo ""
echo "Report generated successfully."
