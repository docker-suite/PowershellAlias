
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
    docker run -it --rm -v "${m2home}:/var/maven_home/.m2" -v "${PWD}:/data" -w /data dsuite/maven sh -c "mvn $args"
}

function Run-MavenBash {
    $m2home = Get-MavenHome
    docker run -it --rm -v "${m2home}:/var/maven_home/.m2" -v "${PWD}:/data" -w /data dsuite/maven sh
}

#
if( (Test-MavenInstall) -eq $false) {
    New-Alias mvn Run-Maven
    New-Alias mvnbash Run-MavenBash
}
