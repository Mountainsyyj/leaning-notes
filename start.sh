#！/bin/bash
local_time=$(date +" %Y-%m-%d %H:%M:%S")
echo "$local_time" >> /root/shell/crontab/test.log
echo "test" >> /root/shell/crontab/test.log
