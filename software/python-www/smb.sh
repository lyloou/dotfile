ps -aux | grep python | grep 9090 | cut -c 9-15 | xargs kill -15
cd ~/w/smbshare && python -m SimpleHTTPServer 9090 > /dev/null 2>&1 &
