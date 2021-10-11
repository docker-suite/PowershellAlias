
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
    docker run -it --rm -v "${PWD}:/golang" -w /golang golang:alpine sh -c "go $args"
}

function Run-GoBash {
    docker run -it --rm -v "${PWD}:/golang" -w /golang golang:alpine sh
}

#
if (test-path alias:go) {
    Remove-Item alias:go
}

#
if( (Test-GoInstall) -eq $true) {
    if (test-path alias:gobash) {
        Remove-Item alias:gobash
    }
    New-Alias gobash Run-GoBash
}

#
if( (Test-GoInstall) -eq $false) {
    if (test-path alias:go) {
        Remove-Item alias:go
    }
    New-Alias go Run-Go
    if (test-path alias:gobash) {
        Remove-Item alias:gobash
    }
    New-Alias gobash Run-GoBash
}
