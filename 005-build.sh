cd ~/cutefish
for repo in cutefish-toolkit cutefish-framework qt-plugins icons cutefish-core \
    cutefish-dm filemanager terminal xdg-desktop-portal-cutefish settings \
    system-monitor text-editor video-player calendar calculator preview \
    cutefish-compositor wallpapers; do
    [ -d "$repo" ] || continue
    cmake -S "$repo" -B "build/$repo" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF || break
    cmake --build "build/$repo" --parallel "$(nproc)" || break
    sudo cmake --install "build/$repo" || break
done
