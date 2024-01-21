#!/usr/bin/bash

jupyter lab --generate-config
sed -i "s/^# c.ServerApp.token =.*$/c.ServerApp.token = 'lvxinyan'/" /root/.jupyter/jupyter_lab_config.py
