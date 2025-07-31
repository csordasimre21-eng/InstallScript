FROM ubuntu:22.04

ENV LANG C.UTF-8

# Alapcsomagok
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libsasl2-dev \
    libldap2-dev \
    libpq-dev \
    libjpeg-dev \
    liblcms2-dev \
    libblas-dev \
    libatlas-base-dev \
    libffi-dev \
    libtiff-dev \
    libopenjp2-7-dev \
    libwebp-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libxcb1-dev \
    wkhtmltopdf \
    node-less \
    npm \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Odoo felhasználó
RUN useradd -m -d /opt/odoo -U -r -s /bin/bash odoo

# Odoo letöltése
RUN git clone https://www.github.com/odoo/odoo --depth 1 --branch 16.0 --single-branch /opt/odoo

WORKDIR /opt/odoo

# Python csomagok telepítése
RUN pip3 install --upgrade pip \
 && pip3 install -r requirements.txt

# Port megnyitása
EXPOSE 8069

# Futtatás (ezt módosíthatod docker-compose vagy más belépési pont esetén)
CMD ["python3", "odoo-bin", "-c", "/etc/odoo/odoo.conf"]
