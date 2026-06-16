# Docker Portfolio Website

## Project Overview
This project containerizes a personal portfolio website using Docker and Nginx. 
The portfolio belongs to Ebubechukwu Ogbonna, a Cloud/DevOps engineering student. 
It showcases skills in Linux, AWS, Nginx, Git, and CI/CD. The website is served 
using an Nginx base image inside a Docker container and is accessible locally 
through a web browser.

## Project Structure
portfolio-website/
├── index.html
├── Dockerfile
└── README.md

## Dockerfile Explanation

FROM nginx:latest
Uses the official Nginx image from Docker Hub as the base image. 
This gives us a ready-made web server without installing anything manually.

RUN rm -rf /usr/share/nginx/html/*
Removes the default Nginx welcome page so our custom portfolio 
page can replace it.

COPY index.html /usr/share/nginx/html/index.html
Copies our custom portfolio HTML file into the Nginx web directory 
inside the container.

EXPOSE 80
Tells Docker that the container will listen on port 80, which is 
the default HTTP port.

CMD ["nginx", "-g", "daemon off;"]
Starts the Nginx web server when the container runs. The 
"daemon off" flag keeps Nginx running in the foreground so 
the container stays alive.

## Build Instructions
To build the Docker image, run:

docker build -t portfolio:v1 .

- docker build — builds the image
- -t portfolio:v1 — tags the image with the name portfolio and version v1
- . — tells Docker to look for the Dockerfile in the current directory

## Run Instructions
To run the container locally:

docker run -d -p 8080:80 --name my-portfolio portfolio:v1

- -d — runs the container in the background (detached mode)
- -p 8080:80 — maps port 8080 on your local machine to port 80 in the container
- --name my-portfolio — gives the container a readable name
- portfolio:v1 — the image to use

## Verification
After running the container, verify it is working:

Check the image was created:
docker images

Check the container is running:
docker ps

Open your browser and go to:
http://localhost:8080

You should see the portfolio website loaded successfully.

Screenshots:
- screenshots/docker-image.png — shows the Docker image created successfully
- screenshots/docker-ps.png — shows the running container
- screenshots/browser.png — shows the portfolio website in the browser

## Challenges Encountered

Challenge 1 — Docker Desktop Not Running
Problem: Running docker build gave the error "failed to connect to Docker API"
Cause: Docker Desktop was not started before running the command
Solution: Opened Docker Desktop and waited for it to fully start before running commands again

Challenge 2 — Git Not Recognized in PowerShell
Problem: Running git add . gave "git is not recognized" error
Cause: Git was not installed on Windows
Solution: Downloaded and installed Git from git-scm.com, then restarted VS Code

Challenge 3 — Changes Not Reflecting in Browser
Problem: After editing index.html the browser still showed the old version
Cause: The old container was still running with the old image
Solution: Stopped and removed the old container, rebuilt the image and ran a new container:
docker rm -f my-portfolio
docker build -t portfolio:v1 .
docker run -d -p 8080:80 --name my-portfolio portfolio:v1

## Author
Ebubechukwu Ogbonna
GitHub: https://github.com/ogbonnaebubechukwu28-sudo
Email: ogbonnaebubechukwu33@gmail.com
