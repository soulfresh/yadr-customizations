# Uninstall Yadr
cd ~/
ls -la | grep yadr | awk '{print $9}' | xargs rm -rf
