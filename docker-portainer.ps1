
function Check-Portainer-Volume {
    if (!(docker volume ls -qf name=portainer_data)) {
        docker volume create portainer_data
    }
}

function Check-Portainer-Container {
    if (!(docker container ls -qaf Name=portainer)) {
        docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
    }
}

function Run-Portainer {
    Check-Portainer-Volume
    Check-Portainer-Container
    Start-Process "http://localhost:9000"
}

if (!(test-path alias:portainer)) {
    New-Alias portainer Run-Portainer
}
