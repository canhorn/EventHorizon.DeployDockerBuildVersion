# About

This project displays a structure you can use to display the Build Version passed in during a Docker build in a .NET Core Blazor application.

# Build

~~~ bash
# Use this command to build a docker image
docker build --build-arg BUILD_VERSION=1.0.1 -t deploy-build-version:1.0.1 .

# Use this command to run your newly created image
docker run -it --rm -p 8080:80 deploy-build-version:1.0.1
~~~
