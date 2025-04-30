# Start with official Arch base image
FROM archlinux:latest

# Install system packages and VNC/Desktop tools
RUN pacman -Syu --noconfirm \
    xorg-server \
    xterm \
    xfce4 \
    xfce4-goodies \
    tigervnc \
    base-devel \
    git \
    python \
    python-pip \
    && pacman -Scc --noconfirm

# Install noVNC and websockify
RUN pip install websockify && \
    git clone https://github.com/novnc/noVNC.git /opt/novnc && \
    ln -s /opt/novnc/vnc.html /opt/novnc/index.html

# Set VNC password dynamically from .env
COPY .env /root/.env
RUN mkdir -p /root/.vnc && \
    VNC_PASSWORD=$(grep VNC_PASSWORD /root/.env | cut -d '=' -f2) && \
    echo "$VNC_PASSWORD" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 0600 /root/.vnc/passwd

# Set environment variables
ENV USER=root
ENV DISPLAY=:1

# Create VNC xstartup file to launch XFCE
RUN echo "#!/bin/sh\nstartxfce4 &" > /root/.vnc/xstartup && chmod +x /root/.vnc/xstartup

# Expose both ports
EXPOSE 5901 6080

# Start both VNC and noVNC
CMD ["sh", "-c", "\
    vncserver :1 -geometry 1280x1024 -depth 24 && \
    /usr/bin/websockify --web=/opt/novnc 6080 localhost:5901 \
"]
