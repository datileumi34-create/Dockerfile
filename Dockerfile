FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# התקנת סביבת עבודה קלה ושרת RDP
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xrdp \
    sudo \
    chromium-browser \
    && rm -rf /var/lib/apt/lists/*

# הגדרת סביבת XFCE עבור שרת ה-RDP
RUN echo "startxfce4" > ~/.xsession

# יצירת משתמש להתחברות (שם משתמש: user, סיסמה: 1234)
RUN useradd -m -s /bin/bash user && \
    echo "user:1234" | chpasswd && \
    usermod -aG sudo user

# חשיפת פורט ה-RDP
EXPOSE 3389

# הפעלת שרת ה-xrdp
CMD ["/usr/sbin/xrdp", "-nodaemon"]
