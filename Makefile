# Using podman build --platform to cross compile. Podman will run non-native
# platforms via `qemu-user-static` by default.

all: third_party/bcachefs-tools-1.13.0/amd64/bcachefs third_party/bcachefs-tools-1.13.0/arm64/bcachefs third_party/bcachefs-tools-1.13.0/arm/bcachefs 
.PHONY : all

third_party/bcachefs-tools-1.13.0/amd64/bcachefs: Dockerfile
	podman build --platform linux/amd64 -t bcachefs-tools-amd64 .
	podman run --rm -v ./third_party/bcachefs-tools-1.13.0/amd64:/tmp/bins:z bcachefs-tools-amd64 /bin/bash -c "tar --strip-components=1 -C /tmp/bins -xf /tmp/freeze/* "


third_party/bcachefs-tools-1.13.0/arm64/bcachefs: Dockerfile
	podman build --platform linux/arm64 -t bcachefs-tools-arm64 .
	podman run --rm -v ./third_party/bcachefs-tools-1.13.0/arm64:/tmp/bins:z bcachefs-tools-arm64 /bin/bash -c "tar --strip-components=1 -C /tmp/bins -xf /tmp/freeze/* "

third_party/bcachefs-tools-1.13.0/arm/bcachefs: Dockerfile
	podman build --platform linux/arm -t bcachefs-tools-arm .
	podman run --rm -v ./third_party/bcachefs-tools-1.13.0/arm:/tmp/bins:z bcachefs-tools-arm /bin/bash -c "tar --strip-components=1 -C /tmp/bins -xf /tmp/freeze/* "

clean:
	rm -f third_party/bcachefs-tools-1.13.0/amd64/*
	rm -f third_party/bcachefs-tools-1.13.0/arm64/*
	rm -f third_party/bcachefs-tools-1.13.0/arm/*
