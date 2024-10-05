#!/usr/bin/env python3

import os
import platform
import subprocess
from datetime import datetime

hostname = platform.node()

log_file = f"/home/student/{hostname}_system_report.log"

def run_command(command):
    return subprocess.getoutput(command)

def write_to_log(output):
    with open(log_file, 'a') as f:
        f.write(output + "\n")
    print(output)

write_to_log(f"System Report for {hostname} - {datetime.now()}")
write_to_log("=" * 50)

#OS and CPU info
os_info = run_command("cat /etc/*release")
cpu_info = run_command("cat /proc/cpuinfo | grep 'model name' | head -n 1")
write_to_log(f"Operating System Information:\n{os_info}")
write_to_log(f"CPU Information:\n{cpu_info}")

#RAM info
ram_info = run_command("free -h")
write_to_log(f"RAM Information:\n{ram_info}")

#Disk info
disk_usage = run_command("df -h")
write_to_log(f"Disk Usage Information:\n{disk_usage}")

#Network info
ip_info = run_command("ip a")
netstat_info = run_command("netstat -rn")
write_to_log(f"Network Information (IP addresses):\n{ip_info}")
write_to_log(f"Routing Table:\n{netstat_info}")

#DNS info
dns_info = run_command("cat /etc/resolv.conf")
write_to_log(f"DNS Information:\n{dns_info}")

write_to_log("=" * 50)
write_to_log("System Report Complete")

print(f"Report saved to {log_file}")
