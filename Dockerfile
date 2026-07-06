FROM lscr.io/linuxserver/chromium:latest

# הגדרת פורט שיתאים ל-Railway
ENV CUSTOM_PORT=8080

# הגדרת זרימת וידאו חלקה ב-60 פריימים לשנייה
ENV SELKIES_FRAMERATE=60

# פתיחת הפורט החוצה
EXPOSE 8080
