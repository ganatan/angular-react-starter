# Angular-React-Starter

This repository contains a starter template for an Angular and React application, along with a CI/CD pipeline setup using GitHub Actions. The project is designed to facilitate the development and deployment of modern web applications.

## Table of Contents

- [Angular-React-Starter](#angular-react-starter)
  - [Table of Contents](#table-of-contents)
  - [Project Overview](#project-overview)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Cloning the Repository](#cloning-the-repository)
  - [Running the Application](#running-the-application)
    - [Local Development](#local-development)
    - [Running with Docker](#running-with-docker)
  - [GitHub Actions Pipeline](#github-actions-pipeline)
    - [Workflow Details](#workflow-details)
  - [Building and Running with Docker](#building-and-running-with-docker)


## Project Overview

This project consists of three main applications:
- **Angular**: The Angular frontend application.
- **Node**: The Node.js backend API.
- **React**: The React frontend application.

It is based on the project [granatan/angular-react-starter](https://github.com/ganatan/angular-react-starter).

The goal of this project is to provide a robust foundation for developing and deploying web applications using Angular with an emphasis on CI/CD practices.

## Getting Started

### Prerequisites

- Node.js (version 22 or higher)
- Docker (for containerization)

### Cloning the Repository

Clone the repository to your local machine and checkout the branch with the pipeleine:

``` bash
git clone https://github.com/The18thHuman/angular-react-starter.git
cd angular-react-starter
git checkout feature/ci-pipeline 
```
## Running the Application
### Local Development

1. Install Dependencies:
Navigate to each application folder (Angular, Node, React) and run:

``` bash
npm install
```

  2. Start the Development Server:

+ For Angular:

``` bash
cd angular
ng serve
```

+ For Node:
``` bash
cd node
node index.js
```
+ For React:

``` bash
cd react
npm start
```
### Running with Docker

You can run the angular application using Docker Compose:

1. Build and Start Services:

``` bash
cd angular
docker-compose up -d
```
2. Access the Application: Open your web browser and go to http://localhost:8080 to access the Angular application.
## GitHub Actions Pipeline

The project includes a GitHub Actions pipeline for continuous integration and deployment. The pipeline runs tests for Angular, Node.js, and React applications, builds the Angular application, creates a Docker image, and pushes it to the GitHub Container Registry.
### Workflow Details

+ Trigger: The pipeline is triggered on push events to the dev branch or any feature branches and on pull requests to the main branch.
+ Jobs:
  + run-tests: Executes unit tests for all applications.
  + build-angular: Builds the Angular application.
  + docker: Builds and pushes the Docker image.
  + notify: Sends email notifications based on the job status.

## Building and Running with Docker

1. Build Docker Image: The pipeline builds the Docker image for the Angular application and pushes it to the GitHub Container Registry.

2. Pull Docker Image: You can pull the Docker image using the following command:

``` bash

docker pull ghcr.io/the18thhuman/angular-react-starter:feature-ci-pipeline
```
3. Run Docker Container: To run the Docker container, use the following command:

``` bash

docker run -p 8080:80 ghcr.io/the18thhuman/angular-react-starter:feature-ci-pipeline
```