#!/bin/evn bash
w=`netstat -ltunp | grep "9200" |awk '{print $4}'|awk -F'[:]+' '{print $2}'`
e=`netstat -ltunp | grep "5043" |awk '{print $4}'|awk -F  '[:]+' '{print $2}'`
d=`netstat -ltunp | grep "5601" |awk '{print $4}'|awk -F  '[:]+' '{print $2}'`
[ $w -eq "9200" ] && echo "$w" ||`su elk -c 'nohup /opt/elasticsearch-5.5.2/bin/elasticsearch &'`
[ $e -eq "5043" ] && echo "$e" ||`nohup /opt/logstash-5.5.2/bin/logstash -f /opt/logstash-5.5.2/config/nginx.yml &`
[ $d -eq "5601" ] && echo "$d" ||`/opt/kibana-5.5.2-linux-x86_64/bin/kibana &`
