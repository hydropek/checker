#!/bin/sh
if [ -f  /bin/checker ]; then
    echo "Warning: remove /bin/checker"
    rm /bin/checker
fi

if [ -f  /usr/bin/checker ]; then
    echo "Warning: remove /usr/bin/checker"
    rm /usr/bin/checker
fi

if [ -f  /usr/local/bin/checker ]; then
    echo "Warning: remove /usr/local/bin/checker"
    rm /usr/local/bin/checker
fi

if [ -f ~/.ycpedef_checker_source ]; then
    rm -rf ~/.ycpedef_checker_source
fi

echo "installing git ..."
apt install -y git 1>/dev/null 2>/dev/null

echo "download file ..."
cp -r ./ ~/.ycpedef_checker_source
cd ~/.ycpedef_checker_source
git pull origin master 1>/dev/null 2>/dev/null

echo "copy file ..."
sh ./copy.sh
chmod 777 /usr/local/bin/checker
