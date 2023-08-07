#!/usr/bin/env bash
# 创建安装脚本 lamp.sh 和 lnmp.sh
# 判断脚本路径是否存在，不存在则创建，存在则打印菜单
# 接收用户输入的值进行相应的操作
# 如果用户输入不为数字或者不为123的相关处理
test_script_path=/Users/zhaozexin/IdeaProjects/shell_practice/test_script
[ ! -d "$test_script_path" ] && mkdir $test_script_path -p

cat <<END
    1.[install lamp]
    2.[install lnmp]
    3.[exit]
    pls input the num you want:
END

read -r num
expr $num +1 &> /de/null

[ $? -ne 0 ] && {
  echo "The num you input must be {1|2|3}"
  exit 1
}
[ "$num" -eq "1" ] && {
  echo "Starting installing lamp .... waiting..."
  sleep 2;
  [ -x "$test_script_path/lamp.sh" ] || {
  echo "The file does not exist or can't be exec."
  exit 1
}
$test_script_path/lamp.sh
exit $?
}

[ "$num" -eq "2" ] && {
  echo "Starting installing lnmp .... waiting..."
  sleep 2;
  [ -x "$test_script_path/lnmp.sh" ] || {
  echo "The file does not exist or can't be exec."
  exit 1
}
$test_script_path/lnmp.sh
exit $?
}

[ "$num" -eq "3" ] && {
echo "bye bye."
exit 3
}

[[ ! "$num" =~ [1-3] ]] && {
  echo "The num you input must be {1|2|3}"
  echo "You are so foolish, you should must be obey the rule."
  exit 1
}








