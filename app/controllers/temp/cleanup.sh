#!/bin/sh
#获取昨天日期 yyyy-MM-dd 格式
source /etc/profile
today=`date +%Y-%m-%d`
#yesterday=`date --date='1 days ago' +%d%m%Y`
log_path="/root/Stock/stock/log/cleanup.log"
file_path="/root/Stock/stock/app/controllers/temp/data/history"

echo ${today}": cleanup 1-day-ago files executing..." >> $log_path
#删除1天前的json文件
#find $file_path -mtime +1 -name "*.json" -exec rm -rf {} \;
find ${file_path}/* -type f -mtime +1 -exec rm {} \;
#执行情况输入日志文件中
if [ $? -ne 0 ]; then
    echo ${today}": clean up json failed." >> $log_path
else
    echo ${today}": clean up json success." >> $log_path
fi

