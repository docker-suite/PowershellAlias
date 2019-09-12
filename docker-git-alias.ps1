
# Test if git is installed locally
function Test-GitInstall {
    try {
        git --version | Out-Null
        return $true
    }
    catch {
        return $false
    }
}


function Run-Git {
    docker run -it --rm -v "${PWD}:/data" -w /data dsuite/maven sh -c "git $args"
}

function Run-GitBash {
    docker run -it --rm -v "${PWD}:/data" -w /data dsuite/maven sh
}

#
if( (Test-GitInstall) -eq $false) {
    New-Alias git Run-Git
    New-Alias gitbash Run-GitBash
}
