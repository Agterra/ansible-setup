setup_fedora:
	sudo dnf update
	sudo dnf install -y ansible git

ansible_fedora:
	ansible-playbook ./playbook.yml --extra-vars "target=fedora home=$(HOME)" -K

setup_debian:
	sudo apt update
	sudo apt install -y ansible git

ansible_debian:
	ansible-playbook ./playbook.yml --extra-vars "target=debian home=$(HOME)" -K

test_fedora:
	docker build -t test_install_fedora -f Dockerfile.fedora .

test_debian:
	docker build -t test_install_debian -f Dockerfile.debian .

manual_test_fedora:
	docker run -it --volume .:/home/test -w /home/test fedora /bin/bash

manual_test_debian:
	docker run -it --volume .:/home/test -w /home/test ubuntu /bin/bash
