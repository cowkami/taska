# taska-api

## Run develop serevr

```bash
$ cargo run
```

## Build

```bash
$ cargo build
```

## Deploy

```bash
$ cargo install cargo-lambda  # if you don't have cargo-lambda
$ cargo lambda deploy -p taska --binary-name taska-api --enable-function-url taska-api-prod --iam-role IAM_ROLE

```
