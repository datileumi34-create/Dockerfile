FROM lscr.io/linuxserver/chromium:latest

# הגדרות פורט וביצועים
ENV CUSTOM_PORT=8080
ENV TITLE="Cloud Browser"

# הגדרת וידאו חלקה ומהירה ב-60 פריימים לשנייה
ENV SELKIES_FRAMERATE=60

# הגדרות Chromium ממוקדות וידאו ומניעת מסך שחור (בלי הגבלות גרפיות חונקות)
ENV CHROMIUM_FLAGS="--disable-dev-shm-usage --no-sandbox --use-gl=swiftshader --enable-features=WebCodecs,WebRTC-H264WithOpenH264AcquireEncoder"

EXPOSE 8080
