
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
    docker run -it --rm -e http_proxy=${http_proxy} -e https_proxy=${https_proxy} -e no_proxy=${no_proxy} -v "${PWD}:/git" -w /git dsuite/maven bash -c "git $args"
}

function Run-GitBash {
    docker run -it --rm -e http_proxy=${http_proxy} -e https_proxy=${https_proxy} -e no_proxy=${no_proxy} -v "${PWD}:/git" -w /git dsuite/maven bash
}

#
if (test-path alias:git) {
    Remove-Item alias:\git
}

#
if( (Test-GitInstall) -eq $true) {
    if (test-path alias:gitbash) {
        Remove-Item alias:\gitbash
    }
    New-Alias gitbash Run-GitBash
}

#
if( (Test-GitInstall) -eq $false) {
    if (test-path alias:git) {
        Remove-Item alias:\git
    }
    New-Alias git Run-Git
    if (test-path alias:gitbash) {
        Remove-Item alias:\gitbash
    }
    New-Alias gitbash Run-GitBash
}
