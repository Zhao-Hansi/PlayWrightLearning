import psutil

# 获取当前系统中所有进程的信息
processes = psutil.process_iter(attrs=['name', 'pid', 'cpu_percent', 'memory_percent'])

# 按照CPU占用率进行排序
processes_sorted_by_cpu = sorted(processes, key=lambda p: p.info['cpu_percent'], reverse=True)

# 输出CPU占用率最高的进程
print("CPU占用率最高的进程：")
for process in processes_sorted_by_cpu[:5]:
    print(f"进程ID: {process.info['pid']}, 进程名: {process.info['name']}, CPU占用率: {process.info['cpu_percent']}%")

# 按照内存占用率进行排序
processes_sorted_by_memory = sorted(processes, key=lambda p: p.info['memory_percent'], reverse=True)

# 输出内存占用率最高的进程
print("\n内存占用率最高的进程：")
for process in processes_sorted_by_memory[:5]:
    print(f"进程ID: {process.info['pid']}, 进程名: {process.info['name']}, 内存占用率: {process.info['memory_percent']}%")