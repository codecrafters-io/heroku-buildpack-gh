.PHONY: test

test:
	docker run -it -v $$(pwd):/app/buildpack:ro heroku/buildpack-testrunner

