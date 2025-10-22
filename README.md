Steps to run:<br/>
1) To clone userver repo: git clone https://github.com/userver-framework/userver.git<br/>
2) Run script to run cmake:<br/>
mkdir build_release
cd build_release
cmake -DCMAKE_BUILD_TYPE=Release ..
make userver-samples-hello_service
3) Run script to run app:<br/>
./userver-samples-hello_service --config ../static_config.yaml
4) check GET method: curl 127.0.0.1:8080/hello
<br/>
<hr>
<img width="1030" height="723" alt="Screenshot 2025-10-22 at 17 55 54" src="https://github.com/user-attachments/assets/62f257b2-ba4b-4c40-96de-101446c222fd" />
<br/>
<hr>
Notes:
before run to install from ghcr.io you need make login by:<br/>
echo <GITHUB-TOKEN> | docker login ghcr.io -u <GITHUB-NAME> --password-stdin
<br>
For brew you need install libs: <br/>
brew install cmake ninja git python pkg-config \
    openssl boost protobuf grpc libpq hiredis \
    mongo-c-driver curl
