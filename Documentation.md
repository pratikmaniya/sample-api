# Assignment Documentation

## Question 1
- Dockerfile contains configuration to create a Docker image

### Steps to create and run docker iamge
- Make sure docker is installed.
- Go to the directory/folder of the project where Dockerfile is located.
- Run the command ```docker build -t sample-api```, it will create a docker file.
- Run the command ```docker run -d --name sample-api -p 3000:3000 sample-api```, it will create container from the image we just created. (It can be done using visual interface too. 3000 port must be specified).
- Open http://0.0.0.0:3000/ to check if everything is working.

## Question 2
- ci-pipeline.yml contains configuration to execute workflow pipeline and create a package on Github workflow

### Steps trigger workflow
- Commit/push something on main branch

### Steps pull the image/package and run
- Run ```docker pull ghcr.io/pratikmaniya/sample-api-new:latest```, it will pull the image from github.
- Run ```docker run -d --name sample-api-new -p 3000:3000 ghcr.io/pratikmaniya/sample-api-new:latest```, it will run the container
- Open http://0.0.0.0:3000/ to check if everything is working.
- Note: status of container canbe checked using Docker desktop app or command ```docker ps```.