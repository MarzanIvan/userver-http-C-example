Steps to run:<br/>
1) To clone userver repo: git clone https://github.com/userver-framework/userver.git<br/>
2) Run script to run cmake:<br/>
mkdir build_release
cd build_release
cmake -DCMAKE_BUILD_TYPE=Release ..
make userver-samples-hello_service
3) check GET method: curl 127.0.0.1:8080/hello
<br/>
<hr>
<img width="1030" height="723" alt="Screenshot 2025-10-22 at 17 55 54" src="https://github.com/user-attachments/assets/62f257b2-ba4b-4c40-96de-101446c222fd" />
<br/>
<hr>
Notes:
before run to install from ghcr.io you need make login by:<br/>
echo <GITHUB-TOKEN> | docker login ghcr.io -u <GITHUB-NAME> --password-stdin
