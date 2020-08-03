#!/bin/bash
# This shell script should be executed within the Docker container.
# It will prompt the user to load up a browser on their own using a URL that
# contains a token. Because of the port mapping configured upon running the
# image it should be possible to use that URL from the host machine.
jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root
