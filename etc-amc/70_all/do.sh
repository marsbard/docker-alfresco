set -e
./amc getdeps
./amc pull
./amc buildimages
./amc build
./amc upq
