
FROM openvino/ubuntu20_runtime:2022.2.0

ENV http_proxy 'http://proxy-dmz.intel.com:911'
ENV https_proxy 'http://proxy-dmz.intel.com:912'
ENV no_proxy '127.0.0.1,localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,.svc,.svc.cluster.local,intel.com,10.2.127.101,.intel.com'

USER root
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget && apt-get clean
RUN mkdir -p /app/resources
RUN cd /app/resources && \
    wget -O face-demographics-walking.mp4 https://github.com/intel-iot-devkit/sample-videos/raw/master/face-demographics-walking.mp4 && \
    wget -O bottle-detection.mp4 https://github.com/intel-iot-devkit/sample-videos/raw/master/bottle-detection.mp4 && \
    wget -O head-pose-face-detection-female.mp4 https://github.com/intel-iot-devkit/sample-videos/raw/master/head-pose-face-detection-female.mp4

RUN apt-get install -y libopencv-dev python3-opencv && apt-get clean

RUN pip3 install openvino-dev[caffe]==2022.2.0 protobuf==3.20.3 influxdb==5.3.1 flask==2.2.2


COPY . /app
COPY startup.sh /startup.sh
RUN chmod a+x /startup.sh

CMD ["/startup.sh"]
