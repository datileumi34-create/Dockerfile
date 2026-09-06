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

# הגדרת משתמש
RUN useradd -m -s /bin/bash user && echo "user:1234" | chpasswd

# הגדרת תיקיית העבודה עבור noVNC
WORKDIR /home/user

# חשיפת פורט 6080 עבור תנועת אינטרנט (HTTP)
EXPOSE 6080

# תסריט הפעלה שמריץ את VNC ואת noVNC בפורט 6080
CMD ["sh", "-c", "vncserver :1 -geometry 1280x720 -depth 24 && websockify --web=/usr/share/novnc/ 6080 localhost:5901"]
