mkdir -p ~/cutefish && cd ~/cutefish
for repo in cutefish-toolkit cutefish-framework cutefish-core cutefish-compositor \
    filemanager icons wallpapers settings terminal xdg-desktop-portal-cutefish \
    cutefish-dm qt-plugins text-editor video-player calendar calculator preview \
    system-monitor cutefish-computer-use; do
    git clone https://github.com/cutefishos/$repo.git
done
