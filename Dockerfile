FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# התקנת רכיבי שולחן עבודה, VNC ו-noVNC
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
    novnc \
    websockify \
    net-tools \
    curl \
    && rm -rf /var/lib/apt/lists/*

# הגדרת משתמש וסיסמה
RUN useradd -m -s /bin/bash user && echo "user:1234" | chpasswd

# הגדרת משתני סביבה נדרשים עבור VNC
ENV USER=user
ENV HOME=/home/user

# הגדרת סיסמת VNC מראש עבור המשתמש
USER user
RUN mkdir -p /home/user/.vnc && echo "123456" | vncpasswd -f > /home/user/.vnc/passwd && chmod 600 /home/user/.vnc/passwd

WORKDIR /home/user

EXPOSE 6080

CMD ["sh", "-c", "vncserver :1 -geometry 1280x720 -depth 24 && websockify --web=/usr/share/novnc/ 6080 localhost:5901"]
