# Docker Portfolio Website

## Project Overview
This project containerizes a personal portfolio website using Docker and Nginx. The portfolio belongs to Ebubechukwu Ogbonna, a Cloud/DevOps engineering student. It showcases skills in Linux, AWS, Nginx, Git, and CI/CD.

## Project Structure
```
portfolio-website/
├── index.html
├── Dockerfile
└── README.md
```

## Dockerfile Explanation

**FROM nginx:latest**  
Uses the official Nginx image from Docker Hub as the base image.

**RUN rm -rf /usr/share/nginx/html/***  
Removes the default Nginx welcome page.

**COPY index.html /usr/share/nginx/html/index.html**  
Copies our custom portfolio HTML file into the Nginx web directory.

**EXPOSE 80**  
Tells Docker that the container will listen on port 80.

**CMD ["nginx", "-g", "daemon off;"]**  
Starts Nginx when the container runs.

## Build Instructions
```
docker build -t portfolio:v1 .
```

## Run Instructions
```
docker run -d -p 8080:80 --name my-portfolio portfolio:v1
```

## Verification
```
docker images
docker ps
```
Open browser at: http://localhost:8080

### Screenshots
![Docker Image](screenshots/docker-image.png)
![Running Container](screenshots/docker-ps.png)
![Portfolio Website](screenshots/browser.png)

## Challenges Encountered

**Challenge 1 — Docker Desktop Not Running**
- Problem: docker build gave "failed to connect to Docker API" error
- Cause: Docker Desktop was not started
- Solution: Opened Docker Desktop and waited for it to fully start

**Challenge 2 — Git Not Recognized in PowerShell**
- Problem: git add gave "git is not recognized" error
- Cause: Git was not installed on Windows
- Solution: Downloaded and installed Git from git-scm.com

**Challenge 3 — Changes Not Reflecting in Browser**
- Problem: After editing index.html the browser showed the old version
- Cause: Old container was still running
- Solution:
```
docker rm -f my-portfolio
docker build -t portfolio:v1 .
docker run -d -p 8080:80 --name my-portfolio portfolio:v1
```

## Author
**Ebubechukwu Ogbonna**  
GitHub: https://github.com/ogbonnaebubechukwu28-sudo  
Email: ogbonnaebubechukwu33@gmail.com
