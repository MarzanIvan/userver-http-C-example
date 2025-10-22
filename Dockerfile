# Stage 1: Build userver and your service
FROM ghcr.io/userver-framework/ubuntu-22.04-userver-base:latest AS build

# Устанавливаем нужные пакеты (если вдруг чего-то не хватает)
RUN apt-get update && apt-get install -y \
    git cmake ninja-build g++ pkg-config python3 python3-pip \
    libboost-all-dev libprotobuf-dev protobuf-compiler-grpc libgrpc++-dev \
    libssl-dev libpq-dev libcurl4-openssl-dev libhiredis-dev libmongoc-dev \
    libyaml-cpp-dev && rm -rf /var/lib/apt/lists/*

# === Сборка и установка userver ===
WORKDIR /opt
RUN git clone --depth 1 https://github.com/userver-framework/userver.git
WORKDIR /opt/userver
RUN cmake -B build -S . -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSERVER_FEATURE_BENCHMARKS=OFF \
    -DUSERVER_FEATURE_TESTS=OFF \
    -DUSERVER_FEATURE_SAMPLES=OFF && \
    cmake --build build && \
    cmake --install build

# === Сборка твоего сервиса ===
WORKDIR /app
COPY . .

RUN cmake -B build -S . -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -Duserver_DIR=/usr/local/lib/cmake/userver && \
    cmake --build build --target userver_sample

# Stage 2: runtime
FROM ubuntu:22.04
WORKDIR /app
COPY --from=build /app/build/userver_sample .
COPY static_config.yaml .
EXPOSE 8080
CMD ["./userver_sample", "--config", "static_config.yaml"]
