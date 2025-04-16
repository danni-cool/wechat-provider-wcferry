#!/bin/sh

docker run -itd \
    --platform linux/amd64 \
    -p 13389:3389 \
    -p 10086:10086 \
    -p 10087:10087 \
    -p 16080:6080 \
    --ulimit nofile=8192 \
    --name DESKTOP \
    dannicool/wechatbot-provider-windows:wc-3935
