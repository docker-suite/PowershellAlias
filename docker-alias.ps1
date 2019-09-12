#docker stop $(docker ps -a -q)
function Stop-Containers {
	foreach ($id in & docker ps -a -q) {
		& docker stop $id }
}

#docker rm $(docker ps -a -q)
function Remove-StoppedContainers {
	foreach ($id in & docker ps -a -q) {
		& docker rm $id }
}

#docker rmi $(docker images -f "dangling=true" -q)
function Remove-DanglingImages {
	foreach ($id in & docker images -q -f 'dangling=true') {
		& docker rmi $id }
}

#docker volume rm $(docker volume ls -qf dangling=true)
function Remove-DanglingVolumes {
	foreach ($id in & docker volume ls -q -f 'dangling=true') {
		& docker volume rm $id }
}

# docker inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' <id>
function Get-ContainerIPAddress {
	param (
		[string] $id
	)
	& docker inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' $id
}


New-Alias ds    Stop-Containers

New-Alias drm   Remove-StoppedContainers

New-Alias drmi  Remove-DanglingImages

New-Alias drmv  Remove-DanglingVolumes

New-Alias dip   Get-ContainerIPAddress
