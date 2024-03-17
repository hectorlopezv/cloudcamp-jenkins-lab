# Command to build docker image
```
 docker build -t "app/python-hello-world:1.0.0-beta.1" -f .\Dockerfile .
```

# Command to run docker container and test locally
```
docker run -p 8000:5000 "app/python-hello-world:1.0.0-beta.1"
```