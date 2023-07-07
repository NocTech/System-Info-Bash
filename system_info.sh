#!/bin/bash

# Get CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Get memory usage
memory_usage=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2}')

# Get disk space
disk_space=$(df -h / | awk 'NR==2{print $4}')

# Get network statistics
network_stats=$(ifconfig | awk '/RX packets/ {print "Received: "$5" bytes\tTransmitted: "$7" bytes"}')

# Print system information
echo "System Information:"
echo "-------------------"
echo "CPU Usage: $cpu_usage"
echo "Memory Usage: $memory_usage"
echo "Disk Space Available: $disk_space"
echo "Network Statistics:"
echo "$network_stats"
