
function Run-Alpine {
    docker run -it --rm -v "${PWD}:/alpine" -w /alpine dsuite/alpine-data bash
}

if (test-path alias:alpine) {
    Remove-Item alias:\alpine
}
New-Alias alpine Run-Alpine
