
# Test if maven is installed locally
function Test-MavenInstall {
    try {
        mvn --version | Out-Null
        return $true
    }
    catch {
        return $false
    }
}

# Get default maven repository location
function Get-MavenHome {
    if (${Env:M2_HOME} -eq $null) {
        return ${Env:USERPROFILE} + "\.m2"
    }
    else {
        return ${Env:M2_HOME}
    }
}

function Run-Maven {
    $m2home = Get-MavenHome
    docker run -it --rm -e http_proxy=${http_proxy} -e https_proxy=${https_proxy} -e no_proxy=${no_proxy} -v "${m2home}:/var/maven_home/.m2" -v "${PWD}:/maven" -w /maven dsuite/maven bash -c "mvn $args"
}

function Run-MavenBash {
    $m2home = Get-MavenHome
    docker run -it --rm -e http_proxy=${http_proxy} -e https_proxy=${https_proxy} -e no_proxy=${no_proxy} -v "${m2home}:/var/maven_home/.m2" -v "${PWD}:/maven" -w /maven dsuite/maven bash
}

#
if (test-path alias:mvn) {
    Remove-Item alias:\mvn
}

#
if( (Test-MavenInstall) -eq $true) {
    if (test-path alias:mvnbash) {
        Remove-Item alias:\mvnbash
    }
    New-Alias mvnbash Run-MavenBash
}

#
if( (Test-MavenInstall) -eq $false) {
    if (test-path alias:mvn) {
        Remove-Item alias:\mvn
    }
    New-Alias mvn Run-Maven

    if (test-path alias:mvnbash) {
        Remove-Item alias:\mvnbash
    }
    New-Alias mvnbash Run-MavenBash
}
