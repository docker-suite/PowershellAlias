
function Run-Alpine {
    docker run -it --rm -v "${PWD}:/data" -w /data dsuite/alpine-data sh
}

New-Alias alpine Run-Alpine
