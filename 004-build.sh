cd ~/cutefish/ghostty-vt/stage/usr
sudo install -Dm644 -t /usr/lib/cutefish-ghostty-vt lib/cutefish-ghostty-vt/libghostty-vt.a
sudo cp -r include/cutefish-ghostty-vt /usr/include/
sudo install -d /usr/share/pkgconfig
sudo tee /usr/share/pkgconfig/cutefish-ghostty-vt.pc > /dev/null << 'EOF'
libdir=/usr/lib/cutefish-ghostty-vt
includedir=/usr/include/cutefish-ghostty-vt

Name: cutefish-ghostty-vt
Description: libghostty-vt, static, for building Cutefish
Version: 1.0.1
Cflags: -I${includedir} -DGHOSTTY_STATIC
Libs: -L${libdir} -lghostty-vt -lm
EOF
pkg-config --modversion cutefish-ghostty-vt
