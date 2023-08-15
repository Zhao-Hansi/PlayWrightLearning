#!/usr/bin/env bash
# 编写一个脚本，用于查询当前系统中占用 CPU 或内存最多的进程，并将结果输出到终端
# 查询CPU占用最高的进程
echo "CPU占用最高的进程："
ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 6

# 查询内存占用最高的进程
echo "内存占用最高的进程："
ps -eo pid,cmd,%mem --sort=-%mem | head -n 6