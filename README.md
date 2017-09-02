Docker image derived from Alpine Linux that includes npm, Pygments and Hugo. Enables building Hugo-based static sites that may include npm as part of the workflow (scss, minification, etc). Usable with Bitbucket Pipelines and other automated deployment tools that support Docker.


* `make build` - Builds the docker image.
* `make push` - Publish the image.
* `make sh` - Run a shell in the image.
