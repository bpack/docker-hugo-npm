Docker image derived from Alpine Linux that includes npm, Pygments and Hugo. Enables building Hugo-based static sites that may include npm as part of the workflow (scss, minification, etc). Usable with Bitbucket Pipelines and other automated deployment tools that support Docker.

The latest image is available at [https://hub.docker.com/r/bpack/hugo-npm/](https://hub.docker.com/r/bpack/hugo-npm/) or simply execute `docker pull bpack/hugo-npm`.

* `make build` - Builds the docker image.
* `make push` - Publish the image.
* `make shell` - Run a shell in the image.
* `make rmi` - Force remove the image locally.
