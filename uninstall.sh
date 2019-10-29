# Uninstall Yadr
cd ~/
ll -la | grep yadr | awk '{print $9}' | xargs rm -rf
