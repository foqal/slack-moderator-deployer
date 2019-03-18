This project bundles your Slack Moderator rules to create a docker image. This is useful to deploying Slack Moderator to things like heroku
where volumes are not possible.

To create your own deployment of Slack Moderator,
1. Check out this repo
2. Copy your configs to the config directory as "config.js" and "rules.js" (overwriting the existing ones).
3. Follow the steps for each deployment type:

## Heroku:

  1. Create the Heroku app if you haven't already.
      `heroku apps:create [MY-APP-NAME]`

  2. Login to Heroku container
      `heroku container:login`

  3. Push the image to Heroku
      `heroku container:push web`
      
  4. Release the image to start.
      `heroku container:release web`

## AWS:
  1. Build the docker image locally
      `docker build -t [MY_APP] --no-cache .`

  2. Login to ECR Registry.
      `aws ecr get-login --no-include-email --region us-east-1`

     After running this script, this script will return a docker login command. Execute the returned command.

  3. Tag the image with AWS Registry
      `docker tag [MY_APP]:latest [ECR_REGISTRY].dkr.ecr.us-east-1.amazonaws.com/[APP_NAME]:latest`

  4. Push the image to AWS Regsitry
      `docker push [ECR_REGISTRY].dkr.ecr.us-east-1.amazonaws.com/[APP_NAME]`
