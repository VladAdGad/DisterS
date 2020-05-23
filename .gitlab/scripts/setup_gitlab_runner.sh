#!/usr/bin/env --split-string=bash -eu

container_runner_name=gitlab-runnner-disters
registration_token=${1}

docker run --detach --name "${container_runner_name}" --restart always \
           --volume /var/run/docker.sock:/var/run/docker.sock \
           --privileged \
           gitlab/gitlab-runner:alpine

docker exec --interactive --tty "${container_runner_name}" gitlab-runner register \
            --non-interactive \
            --url https://gitlab.com/ \
            --description "$(hostname) DisterS Docker Runner" \
            --registration-token "${registration_token}" \
            --docker-image "alpine:latest" \
            --docker-privileged \
            --executor docker \
            --locked \
            --output-limit 102400
