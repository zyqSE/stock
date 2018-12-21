#!/bin/sh
#获取昨天日期 yyyy-MM-dd 格式
source /etc/profile
today=`date +%Y-%m-%d`
#yesterday=`date --date='1 days ago' +%d%m%Y`
log_path="/root/stock/log/cleanup.log"
temp_data="/root/stock/app/controllers/temp/data/"

echo ${today}": cleanup 1-day-ago files executing..." >> $log_path
#删除1天前的历史临时文件
#find $file_path -mtime +1 -name "*.json" -exec ls -l {} \;
#find 命令是递归的; data目录下的history future evaluate目录都会被遍历
find $temp_data -mmin +1 -name "*.json" -exec rm -f {} \;

#执行情况输入日志文件中
if [ $? -ne 0 ]; then
    echo ${today}": clean up json failed." >> $log_path
else
    echo ${today}": clean up json success." >> $log_path
fi

