I had Issues with conda not working but it works inside a docker container. Here are the details

every conda command did this. 
conda create -n test
`ERROR` 
`Channels:`
 - `defaults`
`Platform: linux-64`
`Collecting package metadata (repodata.json): failed`

`CondaHTTPError: HTTP 401 UNAUTHORIZED for url <https://repo.anaconda.cloud/repo/main/linux-64/repodata.json>`
`Elapsed: 00:00.567163`
`CF-RAY: 87f8f2452e8f8dc3-HEL`

`X-Auth token is expired``

# INSTALLING DOCKER
https://docs.docker.com/engine/install/ubuntu/
`
``Add Docker's official GPG key:`
`sudo apt-get update`
`sudo apt-get install ca-certificates curl`
`sudo install -m 0755 -d /etc/apt/keyrings`
`sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc`
`sudo chmod a+r /etc/apt/keyrings/docker.asc`

`Add the repository to Apt sources:`
`echo \`
  `"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \`
  `$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \`
  `sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
`sudo apt-get update``
``
`sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin``
`
``sudo docker run hello-world`

# Running Container
`
``docker pull continuumio/miniconda3`

`docker run -t -i -rm -v /home/$USER:/home/$USER continuumio/miniconda3 /bin/bash``
``
-t -i detaches from terminal. -rm means it will close the container when the terminal is closed. -v connects it to the folders.
```bash
conda info
```

# Giver user rights to docker

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
```

```bash
sudo chown root:docker /var/run/docker.sock
sudo chown -R root:docker /var/run/docker
```

```bash
docker run hello-world
```

Opening in VS code
click >< in bottom left. 
attach to running container
