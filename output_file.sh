#!/bin/zsh

# 编写一个脚本，用于查询指定目录下的所有文件中包含指定字符串的文件，并将结果输出到另一个文件中.

# 指定目录和字符串
directory="/path/to/directory"  # 替换为实际的目录路径
search_string="指定字符串"    # 替换为要搜索的字符串

# 检查目录是否存在
if [ ! -d "$directory" ]; then
  echo "目录不存在: $directory"
  exit 1
fi

# 创建结果文件
result_file="search_results.txt"
touch "$result_file"

# 遍历目录中的文件
for file in "$directory"/*; do
  # 检查文件是否存在并且是普通文件
  if [ -f "$file" ]; then
    # 检查文件中是否包含指定字符串
    if grep -q "$search_string" "$file"; then
      # 将匹配的文件名追加到结果文件中
      echo "$file" >> "$result_file"
    fi
  fi
done

echo "查询完成！结果已保存到: $result_file"