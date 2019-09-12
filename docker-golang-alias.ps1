
# Test if git is installed locally
function Test-GoInstall {
    try {
        go version | Out-Null
        return $true
    }
    catch {
        return $false
    }
}

#
function Run-Go {
    docker run -it --rm  -v "${PWD}:/app" -w /app golang:alpine sh -c "go $args"
}

#
if( (Test-GoInstall) -eq $false) {
    New-Alias go Run-Go
}
