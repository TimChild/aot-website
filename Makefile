JEKYLL_VERSION=4.3.2
DOCKER_CMD=docker run --rm --volume="$(PWD):/srv/jekyll:Z" -p 0.0.0.0:4000:4000 -it jvconseil/jekyll-docker:$(JEKYLL_VERSION)

serve:
	$(DOCKER_CMD) jekyll serve --livereload --watch --force-polling

build:
	$(DOCKER_CMD) jekyll build

deploy:
	rsync -avz --delete _site/ webserver:deploy_tmp/
	ssh -t webserver "sudo rsync -av --delete ~/deploy_tmp/ /var/www/adventuresoftim/"

