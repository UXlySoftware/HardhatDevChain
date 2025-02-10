FROM node:22-slim

ENV TARGET_ADDRESS='0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266'
ENV RECEIVER_ADDRESS='0x9be99125807c97d91770e36ffd4dcb8d0c3e3049'

# we need tmux for background sessions and curl for fetching avalanche tools
RUN apt update -y \
  && apt install -y vim tmux curl git

WORKDIR /root

# copy the contracts package into the working directory
COPY . .

# install contracts package dependencies
RUN npm install

ENTRYPOINT [ "/bin/bash", "entrypoint.sh" ]