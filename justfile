help:
clean:
    rm -rf target *.deb *.sha256sum *.sha512sum *.rpm ~/rpmbuild rootca/
build-deb: clean
    ./scripts/build-deb.sh
build-rpm: clean
    ./scripts/build-rpms.sh
set-version:
    ./scripts/set-version.sh
release:
    ./scripts/create-release.sh
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

root := justfile_directory()

docker-build-rpm:
    docker run --rm -v {{ root }}:/workspaces docker.io/siakhooi/devcontainer:rpm44 scripts/build-rpms.sh
docker-build-deb:
    docker run --rm -v {{ root }}:/workspaces docker.io/siakhooi/devcontainer:deb2604 scripts/build-deb.sh
all: clean set-version docker-build-deb docker-build-rpm
