#####################################################
# Source code https://github.com/end222/pacmenu
# Updated by afiniel-tech for yiimpool use...
#####################################################

source /etc/functions.sh

RESULT=$(dialog --stdout --nocancel --default-item 1 --title "Yiimpool Installer v2.1" --menu "Choose one" -1 60 16 \
' ' "- Install Yiimp  -" \
1 "Start Yiimp Installation" \
' ' "- Daemon Wallet Builder -" \
2 "Daemonbuilder" \
3 Exit)
if [ $RESULT = ]
then
bash $(basename $0) && exit;
fi


if [ $RESULT = 1 ]
then
clear;
cd $HOME/yiimpool/install
source bootstrap_single.sh;
fi

if [ $RESULT = 2 ]
then
clear;
cd $HOME/yiimpool/install
source bootstrap_coin.sh;
fi

if [ $RESULT = 3 ]
then
clear;
exit;
fi
