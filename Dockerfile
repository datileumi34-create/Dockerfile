# שימוש בתשתית אובונטו מעודכנת
FROM ubuntu:22.04

# מניעת שאלות אינטראקטיביות בזמן ההתקנה
ENV DEBIAN_FRONTEND=noninteractive

# עדכון מערכת והתקנת רכיבי בסיס, סביבת עבודה ודפדפן
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    x11vnc \
    xvfb \
    novnc \
    net-tools \
    curl \
    wget \
    git \
    sudo \
    chromium-browser \
    && rm -rf /var/lib/apt/lists/*

# הגדרת תיקיית עבודה
WORKDIR /root

# חשיפת פורט 6080 לחיבור דרך הדפדפן
EXPOSE 6080

# סקריפט הפעלה המריץ את המסך הוירטואלי, השרת והממשק
CMD Xvfb :1 -screen 0 1920x1080x24 & \
    sleep 1 && \
    DISPLAY=:1 xfce4-session & \
    sleep 1 && \
    x11vnc -display :1 -nopw -forever -shared & \
    sleep 1 && \
    /usr/share/novnc/utils/launch.sh --vnc localhost:5900 --listen 6080
