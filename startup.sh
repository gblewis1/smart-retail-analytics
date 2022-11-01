#!/bin/bash
set -euxo pipefail

rm -rf /nginx-models
mkdir -p /nginx-models
cd /nginx-models
SERVER=sra-nginx-service.default.svc.cluster.local
for i in head-pose-estimation face-detection emotions-recognition mobilenet-ssd person-detection; do
  wget http://$SERVER/models/$i.bin
  wget http://$SERVER/models/$i.xml
done

cd /app/application
python3 smart_retail_analytics.py -fm /nginx-models/face-detection.xml -pm /nginx-models/head-pose-estimation.xml -mm /nginx-models/emotions-recognition.xml -om /nginx-models/mobilenet-ssd.xml -pr /nginx-models/person-detection.xml -lb /app/resources/labels.txt -ip localhost

