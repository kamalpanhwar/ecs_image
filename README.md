##### Why I need ecs image
I have one docker images which is quit large, somehow it was throughing error on default ecs container. So this image is created to add more space.

You must configure your `aws configure` environment variables. After all configuration you can run following command

```
make build
```

In case if you are getting issues/failure. Folloiwng are all environment varibles required to run this

```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_SESSION_TOKEN
```

You can get session token using following commands
```
aws sts get-session-token
```
This will give you all above environment variable. Use following command to export it

```
export AWS_ACCESS_KEY_ID=_value_you_received_in_command
```

