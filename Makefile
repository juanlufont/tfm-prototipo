include config.mk

.PHONY: all clean ipfs site ipfs-clean site-clean

all: ipfs site

clean: site-clean ipfs-clean

ipfs:
	docker-compose -f ipfs-compose.yml up -d
	sleep 5 && xdg-open http://localhost:5001/webui
	docker exec ipfs ipfs add --to-files=/export -r /export
	./filelist.sh ipfs /export $(IPFSURL) > site/content/posts/ipfs.md

ipfs-clean:
	docker-compose -f ipfs-compose.yml down --volumes

site:
	git submodule update --init --recursive
	docker-compose -f site-compose.yml build --build-arg BASEURL="$(BASEURL)"
	docker-compose -f site-compose.yml up -d
	sleep 4 && xdg-open https://upo.ducktective.org

site-clean:
	docker-compose -f site-compose.yml down --volumes
	-docker rmi prototype_caddy
