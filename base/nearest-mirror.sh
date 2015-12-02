/apt-select/apt-select.py -p -t 5
if [ -f /sources.list ] 
then 
	mv /sources.list /etc/apt 
fi
apt-get update
