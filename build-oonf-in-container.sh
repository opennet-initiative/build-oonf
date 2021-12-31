#
# compile app
#
cd /oonf/
git clone https://github.com/OLSR/OONF.git git-repo
cd git-repo/

git checkout 8397c64ee044ed87cb116b8cc213615aa085c177  # v0.15.1-96 (96 commits after tag 0.15.1)

cd build
cmake ..
make
cd ..

#
# build .deb
#

# dh-systemd was integrated into debhelper (e.g. see https://github.com/matrix-org/synapse/issues/9073)
sed -i -e "s@debhelper (>= 9), dh-systemd (>= 1.5)@debhelper (>= 10)@" ./apps/olsrd2/debian/control               

cd files/
./create_debian_package.sh

cp ../*.deb /oonf/mount/
