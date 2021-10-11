
function Run-Alpine {
    docker run -it --rm -v "${PWD}:/data" -w /data dsuite/alpine-data bash
}

if (test-path alias:alpine) {
    Remove-Item alias:alpine
}
New-Alias alpine Run-Alpine
