FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
# Install necessary packages
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-terminal \
    tightvncserver \
    git \
    websockify \
    && apt-get clean

# Clone noVNC
RUN git clone https://github.com/novnc/noVNC.git /opt/noVNC

# Set environment variables
ENV USER=root \
    DISPLAY=:1 \
    GEOMETRY=1024x768 \
    DEPTH=16

# Create a startup script
COPY startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh

# Expose ports for VNC and noVNC
EXPOSE 5901 6080

CMD ["/bin/bash", "/opt/startup.sh"]
