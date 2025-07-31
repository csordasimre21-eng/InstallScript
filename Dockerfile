FROM ubuntu:22.04

RUN apt update && apt install -y git python3-pip python3-dev libxml2-dev libxslt1-dev zlib1g-dev libsasl2-dev libldap2-dev build-essential wget node-less libjpeg-dev libpq-dev liblcms2-dev libblas-dev libatlas-base-dev python3-venv npm libjpeg8-dev libffi-dev libtiff5-dev libopenjp2-7-dev libwebp-dev libharfbuzz-dev libfribidi-dev libxcb1-dev

RUN useradd -m -d /opt/odoo -U -r -s /bin/bash odoo

USER odoo
WORKDIR /opt/odoo


RUN pip3 install -r requirements.txt

EXPOSE 8069
CMD ["python3", "odoo-bin", "-c", "odoo.conf"]
