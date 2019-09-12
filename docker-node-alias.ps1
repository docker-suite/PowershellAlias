
# Test if maven is installed locally
function Test-NodeInstall {
    try {
        node --version | Out-Null
        return $true
    }
    catch {
        return $false
    }
}

#
function Run-Node {
    docker run -it --rm  -v "${PWD}:/data" -w /data dsuite/alpine-nodejs:lts sh -c "node $args"
}

#
function Run-Npm {
    docker run -it --rm  -v "${PWD}:/data" -w /data dsuite/alpine-nodejs:lts sh -c "npm $args"
}

#
function Run-Yarn {
    docker run -it --rm  -v "${PWD}:/data" -w /data dsuite/alpine-nodejs:lts sh -c "yarn $args"
}

#
function Run-NodeBash {
    docker run -it --rm -v "${PWD}:/data" -w /data dsuite/alpine-nodejs:lts sh
}

#
if(  (Test-NodeInstall) -eq $false) {
    New-Alias node Run-Node
    New-Alias npm Run-Npm
    New-Alias yarn Run-Yarn
    New-Alias nodebash Run-NodeBash
}

