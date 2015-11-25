echo Pulling docker images

for image in \
	harbur/haveged:1.7c-1 \
	mysql:5.6 \
	catatnight/postfix \
	crosbymichael/skydns \
	crosbymichael/skydock \
	ubuntu-upstart:trusty 
do
	echo [$image]
  docker pull $image
done
