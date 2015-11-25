
for what in getdeps pull buildimages
do
	echo
	echo .=]$what[=.
	./amc $what
done
