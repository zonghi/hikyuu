FROM ubuntu:22.04
MAINTAINER sion.lv "595652979@qq.com"

# 修正docker时间
ENV TZ=Asia/Shanghai
ENV DEBIAN_FRONTEND=noninteractive
#依赖安装
SHELL ["/bin/bash", "-c"]
RUN apt-get update
RUN apt-get install -y libsqlite3-dev python3 python3-pip python3-dev curl unzip wget vim python3-pyqt5 git libmysqlclient-dev fonts-wqy-zenhei tzdata
RUN pip3 install click pandas numpy flask matplotlib lxml h5py mkl bokeh pyecharts Flask-SQLAlchemy pytdx mysql-connector-python tables akshare GitPython jupyterlab mplfinance

#Ta-Lib 
COPY build_talib.sh \
 ta-lib-0.4.0-src.tar.gz  /
RUN  cd / && sh build_talib.sh

#hikyuu编译
COPY  hikyuu /hikyuu/
COPY src.patch /hikyuu/
WORKDIR /hikyuu

# #xmake安装
RUN curl -fsSL https://xmake.io/shget.text | bash 

RUN source ~/.xmake/profile && export XMAKE_ROOT=y && cd /hikyuu && xrepo env -y
RUN source ~/.xmake/profile && export XMAKE_ROOT=y && cd /hikyuu && python3 setup.py install -j8

#运行环境
EXPOSE 8888
ENV LD_PRELOAD=/lib/x86_64-linux-gnu/libstdc++.so.6:$LD_PRELOAD

# 安装中文字体
COPY font.sh / 
RUN cd / && sh font.sh

# 配置密码
COPY token.sh / 
RUN cd / && sh token.sh

