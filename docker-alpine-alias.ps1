
function Run-Alpine {
    docker run -it --rm -e http_proxy=${http_proxy} -e https_proxy=${https_proxy} -e no_proxy=${no_proxy} -v "${PWD}:/alpine" -w /alpine dsuite/alpine-data bash
}

if (test-path alias:alpine) {
    Remove-Item alias:\alpine
}
New-Alias alpine Run-Alpine
