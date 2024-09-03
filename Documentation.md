# Assignment Documentation

## Question 1
- Dockerfile contains configuration to create a Docker image

### Steps to create and run docker iamge
- make sure docker is installed.
- Go to the directory/folder of the project where Dockerfile is located.
- run the command ```docker build -t sample-api```, it will create a docker file.
- run the command ```docker run -d --name sample-api -p 3000:3000 sample-api```, it will create container from the image we just created. (It can be done using visual interface too. 3000 port must be specified).
- Open http://0.0.0.0:3000/ to check if everything is working.