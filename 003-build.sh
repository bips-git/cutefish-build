mkdir -p ~/cutefish/ghostty-vt && cd ~/cutefish/ghostty-vt
zig=zig-$(uname -m)-linux-0.17.1
curl -fsSLO https://ziglang.org/download/0.17.1/$zig.tar.xz
curl -fsSLO https://ziglang.org/download/0.17.1/$zig.tar.xz.minisig
minisign -Vm $zig.tar.xz -P RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U
tar -xJf $zig.tar.xz
base=https://release.files.ghostty.org/libghostty-vt/1.0.1
for f in libghostty-vt-1.0.1.tar.gz libghostty-vt-1.0.1-deps.tar.gz; do
    curl -fsSLO $base/$f
    curl -fsSLO $base/$f.minisig
    minisign -Vm $f -P RWQlAjJC23149WL2sEpT/l0QKy7hMIFhYdQOFy0Z7z7PbneUgvlsnYcV
    tar -xzf $f
done
cd libghostty-vt-1.0.1
DESTDIR=~/cutefish/ghostty-vt/stage ../$zig/zig build --prefix /usr \
    --prefix-lib-dir lib/cutefish-ghostty-vt --prefix-include-dir include/cutefish-ghostty-vt \
    --system ../libghostty-vt-1.0.1-deps -Doptimize=ReleaseFast
