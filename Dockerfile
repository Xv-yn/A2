FROM openjdk:17-jdk-alpine

RUN apk add --no-cache \
    xvfb \
    libxext-dev \
    libxrender-dev \
    libxtst-dev \
    libxi-dev \
    ttf-dejavu \
    fontconfig

WORKDIR /app

COPY . .

RUN chmod +x gradlew

RUN ./gradlew build

EXPOSE 8081

CMD ["sh", "-c", "Xvfb :99 -screen 0 1024x768x16 & export DISPLAY=:99 && ./gradlew run -Dprism.order=sw -Dprism.verbose=true -Djava.awt.headless=true -Dprism.forceGPU=false"]