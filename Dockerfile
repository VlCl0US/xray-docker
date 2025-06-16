FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    libpcap0.8 \
    && rm -rf /var/lib/apt/lists/*

# Create directories
RUN mkdir -p /opt/xray /opt/xray/reports /opt/xray/plugins /opt/xray/config

# Download and install xray
RUN curl -L https://github.com/chaitin/xray/releases/download/1.9.11/xray_linux_amd64.zip -o /tmp/xray.zip \
    && unzip /tmp/xray.zip -d /opt/xray \
    && mv /opt/xray/xray_linux_amd64 /opt/xray/xray \
    && chmod +x /opt/xray/xray \
    && rm /tmp/xray.zip

# Download and install xpoc
RUN curl -L https://github.com/chaitin/xray/releases/download/xpoc-0.1.0/xpoc_linux_amd64 -o /opt/xray/xpoc \
    && chmod +x /opt/xray/xpoc 

# Download and install xapp
RUN curl -L https://github.com/chaitin/xray/releases/download/2.0.0/xapp_linux_amd64 -o /opt/xray/xapp \
    && chmod +x /opt/xray/xapp 

# Download xray plugins
RUN curl -L https://github.com/chaitin/xray-plugins/archive/refs/heads/main.zip -o /tmp/xray-plugins.zip \
    && unzip /tmp/xray-plugins.zip -d /opt/xray/plugins \
    && mv /opt/xray/plugins/xray-plugins-main/* /opt/xray/plugins/ \
    && rm -rf /opt/xray/plugins/xray-plugins-main /tmp/xray-plugins.zip

# Set environment variables
ENV PATH="/opt/xray:${PATH}"

# Set working directory
WORKDIR /opt/xray

# Create basic configuration files
RUN echo "Creating basic config files..."
RUN /opt/xray/xray > /dev/null 2>&1 || true

# Set entrypoint
CMD []
