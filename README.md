# Docker Service: Git
A fully containerized version of Git. It can run on a vanilla debian installation.

# Install Service

1. Replace each `/path/to` by the path to the `docker-compose.yaml` file in the `docker.git.service.example`
2. Add it to systemd as a service
```
sudo cp docker.git.service.example /etc/systemd/system/docker.git.service
```
3. Start the service using
```
sudo systemctl start docker.git
```
4. Enable the service using
```
sudo systemctl enable docker.git
```
