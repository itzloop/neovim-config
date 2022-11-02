#!/usr/bin/env bash
set -x
if [[ -z "$ROOT_DIR" ]]; then
	echo "ROOT_DIR must be defined for this script to work"
	exit 1
fi

###################### Constants #########################
LANGUAGE_SERVER_DIR="$ROOT_DIR/language-servers"


######################## LUA #############################
setup_lua () {
	cd $LANGUAGE_SERVER_DIR
	git clone  --depth=1 https://github.com/sumneko/lua-language-server
	cd lua-language-server
	git submodule update --depth 1 --init --recursive
	cd 3rd/luamake
	./compile/install.sh
	cd ../..
	./3rd/luamake/luamake rebuild
	cd $ROOT_DIR
}
######################## LUA #############################


######################## GO ##############################
setup_go () {
	go install golang.org/x/tools/gopls@latest
	go install github.com/go-delve/delve/cmd/dlv@latest
}
######################## GO ##############################

######################## TS ##############################
setup_ts () {
	npm install -g typescript typescript-language-server
}
######################## TS ##############################

######################## PY ##############################
setup_py () {
	pip install pyright
}
######################## PY ##############################

setup_go
setup_lua
setup_ts
setup_py
