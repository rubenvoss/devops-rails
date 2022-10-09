# Setting up a CD Pipeline with Github Actions
Add a new file in your repository, under .github/workflows/ name it CD.yml. **Indentation is very important in yml files**
<br>

## Adding secrets
Since this Github Action accesses your Docker Hub and your Webhook, you will need to add secrets for it. In your Repository, go to Settings -> Secrets -> Actions & add the following secrets:
```
DOCKER_USER # If you don't have an account, go to hub.docker.com and make one.
DOCKER_PASS
DEPLOY_WEBHOOK_URL # your webhook url that you set in the last step.
```

<br>

Change it to this(read the comments for explanations):
```
name: "CD - Deploying..."

# This action runs on every push to the master branch
on:
  push:
    branches: [ "master" ]

jobs:

  docker:
    runs-on: ubuntu-latest
    steps:
      -
        name: Set up QEMU
        uses: docker/setup-qemu-action@v2
      -
        name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2
      -
        name: Login to DockerHub
        uses: docker/login-action@v2
        with:
          # logging in with your dockerhub username and password
          username: ${{ secrets.DOCKER_USER }}
          password: ${{ secrets.DOCKER_PASS }}
      -
        name: Build and push
        uses: docker/build-push-action@v3
        with:
          push: true
          # here you need to add your repo with the tag :latest
          tags: rubenvoss/rails-production:latest
          # Here you need to add the name of your Dockerfile for production
          file: Dockerfile-production

  redeploy:
    name: Redeploy webhook call
    runs-on: ubuntu-18.04
    needs: [docker]
    steps:
      - name: Deploy docker container webhook
        uses: joelwmale/webhook-action@master
        env:
          # after this Github action has built and sent your image to dockerhub, it deploys your webhook
          WEBHOOK_URL: ${{ secrets.DEPLOY_WEBHOOK_URL  }}
          data: "{ 'myField': 'myFieldValue'}"
```
<br>
