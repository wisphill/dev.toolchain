# Prerequisites

```
# Install awscli and awslocal
brew install awscli
pipx install awscli-local

# Colima start with network address enabled
colima start --network-address
```

### Sample usages

```
awslocal s3 mb s3://my-test-bucket && awslocal s3 ls
```
