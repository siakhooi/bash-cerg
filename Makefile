help:
clean:
	rm -rf target *.deb *.sha256sum *.sha512sum *.rpm ~/rpmbuild rootca/
build-deb: clean
	./scripts/build-deb.sh
build-rpm: clean
	scripts/build-rpms.sh
set-version:
	scripts/set-version.sh
git-commit-and-push:
	scripts/git-commit-and-push.sh
create-release:
	scripts/create-release.sh
all-deb: clean set-version build-deb
all-rpm: clean set-version build-rpm

deb-install:
	apt install ./siakhooi-cerg_0.1.0_amd64.deb
deb-uninstall:
	apt remove siakhooi-cerg
rpm-install:
	rpm -i ./siakhooi-cerg-0.1.0-1.fc41.noarch.rpm
rpm-uninstall:
	rpm -e siakhooi-cerg

test-rootca:
	cerg-generate-rootca rootca1 mystore123 '/CN=MY Organization A Root CA/C=MY/ST=KL/L=MidValley/O=MY Organization A'
