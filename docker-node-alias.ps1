
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
    docker run -it --rm -v "${PWD}:/node" -w /node dsuite/alpine-nodejs:lts sh -c "node $args"
}

#
function Run-Npm {
    docker run -it --rm -v "${PWD}:/node" -w /node dsuite/alpine-nodejs:lts sh -c "npm $args"
}

#
function Run-Yarn {
    docker run -it --rm -v "${PWD}:/node" -w /node dsuite/alpine-nodejs:lts bash -c "yarn $args"
}

#
function Run-NodeBash {
    docker run -it --rm -v "${PWD}:/node" -w /node dsuite/alpine-nodejs:lts bash
}

#
if (test-path alias:node) {
    Remove-Item alias:node
}

#
if(  (Test-NodeInstall) -eq $true) {
    if (test-path alias:nodebash) {
        Remove-Item alias:nodebash
    }
    New-Alias nodebash Run-NodeBash
}

#
if(  (Test-NodeInstall) -eq $false) {
    if (test-path alias:node) {
        Remove-Item alias:node
    }
    New-Alias node Run-Node

    if (test-path alias:npm) {
        Remove-Item alias:npm
    }
    New-Alias npm Run-Npm

    if (test-path alias:yarn) {
        Remove-Item alias:yarn
    }
    New-Alias yarn Run-Yarn

    if (test-path alias:nodebash) {
        Remove-Item alias:nodebash
    }
    New-Alias nodebash Run-NodeBash
}

