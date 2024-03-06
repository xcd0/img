all:
	make build
	make run

setup:
	@command -v apt-fast || /bin/bash -c "$(curl -sL https://git.io/vokNn)"
	sudo apt-fast update
	sudo apt-fast install -y --fix-missing libopencv-dev cmake g++
	# windows10の場合 vcxsrvを入れる。 https://zenn.dev/naonaorange/articles/20210519_wsl_ubuntu#firewall%E3%81%A7x-server%E3%81%AE%E9%80%9A%E4%BF%A1%E3%82%92%E8%A8%B1%E5%8F%AF%E3%81%99%E3%82%8B
	# echo "export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0" >> ~/.bashrc
	# も実行する。
	# windows11の場合何もしなくても動く？
	@command -v xeyes || sudo apt-fast install -y --fix-missing x11-apps

build:
	cd src/ && mkdir -p build && cd build && cmake .. && make

run:
	./src/build/main

