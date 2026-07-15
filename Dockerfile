FROM lscr.io/linuxserver/chromium:latest

# הגדרות הפורט והפריימים
ENV CUSTOM_PORT=8080
ENV SELKIES_FRAMERATE=30

# אופטימיזציה קיצונית לחיסכון במשאבים ומניעת קריסות בכרטיסיות מרובות
ENV CHROMIUM_FLAGS="--disable-dev-shm-usage --no-sandbox --disable-gpu --disable-software-rasterizer --num-raster-threads=1 --disable-background-networking --disable-extensions"

EXPOSE 8080
