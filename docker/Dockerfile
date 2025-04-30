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
    supervisor \
    && pacman -Scc --noconfirm

# Install noVNC and websockify
RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install websockify && \
    git clone https://github.com/novnc/noVNC.git /opt/novnc && \
    ln -s /opt/novnc/vnc.html /opt/novnc/index.html

ENV PATH="/opt/venv/bin:$PATH"
ENV USER=root
ENV DISPLAY=:1

# Set VNC password dynamically from .env
COPY .env /root/.env
# Remove the deprecated vncserver usage
RUN mkdir -p /root/.vnc && \
    VNC_PASSWORD=$(grep VNC_PASSWORD /root/.env | cut -d '=' -f2) && \
    echo "$VNC_PASSWORD" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 0600 /root/.vnc/passwd

# Create xstartup for XFCE
RUN echo "#!/bin/sh\nstartxfce4 &" > /root/.vnc/xstartup && chmod +x /root/.vnc/xstartup

# Copy supervisord config
COPY supervisord.conf /etc/supervisord.conf

# Expose VNC and noVNC ports
EXPOSE 5901 6080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
