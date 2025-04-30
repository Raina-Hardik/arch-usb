.PHONY: arch arch-usb

arch:
	docker-compose -f docker/docker-compose.yml --profile arch up -d

arch-usb:
	docker-compose -f docker/docker-compose.yml --profile arch-usb up -d