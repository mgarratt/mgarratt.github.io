export PATH := node_modules/.bin/:$(PATH)
TARGETS := $()

.PHONY: init clean build js less serve

init:
	npm install
	bundle install

clean:
	rm -rf assets/js/min assets/css

build: js less

js:
	mkdir assets/js/min
	uglifyjs --output assets/js/min/main-min.js assets/js/*.js

less:
	echo $(wildcard assets/less/*.less)
	@- $(foreach TARGET,$(wildcard assets/less/*.less), \
		$(eval OUTPUT = $(subst less,css,$(TARGET))) \
		./node_modules/.bin/lessc $(TARGET) $(OUTPUT); \
	)

serve:
	bundle exec jekyll serve
