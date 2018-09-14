hdiutil attach ~/Documents/CaseSensitive.dmg -mountpoint /Volumes/CaseSensitive

# configs dir must be installed to home directory
CONFIG_PATH=~/configs
PLUGIN_PATH=${CONFIG_PATH}/plugins

# set environment variables
export GOPATH=/Volumes/CaseSensitive/go/
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export CGO_CPPFLAGS="-I/usr/local/Cellar/opencv/3.4.2/include -I/usr/local/Cellar/opencv/3.4.2/include/opencv2"
export CGO_CXXFLAGS="--std=c++1z -stdlib=libc++"
export CGO_LDFLAGS="-L/usr/local/Cellar/opencv/3.4.2/lib -lopencv_core -lopencv_face -lopencv_videoio -lopencv_imgproc -lopencv_highgui -lopencv_imgcodecs -lopencv_objdetect -lopencv_features2d -lopencv_video -lopencv_dnn -lopencv_xfeatures2d"
export PKG_CONFIG_PATH=/usr/local/Cellar/opencv/3.4.2/lib/pkgconfig
export PKG_CONFIG="pkg-config"

# source plugins
source ${PLUGIN_PATH}/base.bash
source ${PLUGIN_PATH}/mac.bash
source ${PLUGIN_PATH}/docker-compose.bash
source ${PLUGIN_PATH}/k8s.bash
source ${PLUGIN_PATH}/go.bash
source ${PLUGIN_PATH}/git.bash
source ${PLUGIN_PATH}/git-completion.bash
source ${PLUGIN_PATH}/local.bash

alias settings='subl ${CONFIG_PATH}/df.bash'
alias tallybuild='docker-compose up --build'
alias tallyb='docker-compose up --build'
alias news='curl -s http://feeds.bbci.co.uk/news/rss.xml?edition=us | grep "<title>" | sed "s/ <title><\!\[CDATA\[//g;s/\]\]><\/title>//;" | grep -v "BBC News"'
alias weather='curl wttr.in/tiburon'
alias goodmorning='weather && echo "" && echo "" &&  news'
