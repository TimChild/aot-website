export JEKYLL_VERSION=4.3.2
docker run --rm \
  --volume="$PWD:/srv/jekyll:Z" \
  -p 0.0.0.0:4000:4000 \
  -it jvconseil/jekyll-docker:$JEKYLL_VERSION \
  jekyll serve --livereload --watch

