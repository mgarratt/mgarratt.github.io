export PATH := node_modules/.bin/:$(PATH)
export JEKYLL_ENV := development

.PHONY: init clean build serve

init:
	rm -rf node_modules
	npm install
	bundle install
	$(MAKE) clean build

clean:
	bundle exec jekyll clean

build:
	bundle exec jekyll build

serve:
	bundle exec jekyll serve
