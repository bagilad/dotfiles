# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/local/bin:/usr/local/bin:$PATH

export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"

export DEV=true

docker-ssh() {
    if (( $# == 0 ))
    then
        echo "USAGE: docker_ssh <container name | container id>"
        return
    fi
    name=$1
    echo "Connecting to $name"
    docker exec -i -t $name /bin/bash
}


# GoLang
export GOROOT="/usr/local/go"
export PATH=$PATH:"$GOROOT/bin"
export GOPATH="/Users/giladba/go"
export PATH=$PATH:"$GOPATH/bin"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/opt/apache-maven-3.5.4/bin:$PATH"
export PATH="$HOME/bats/bin:$PATH"

dsexport GITHUB_TOKEN="df43ffee9fe02ad6d3501387e556a3be16fbe551"

export ZEPPELIN_VERSION=0.8.1
export ZEPPELIN_HOME=/usr/local/Cellar/apache-zeppelin/0.8.1/libexec
export ZEPPELIN_CONF_DIR=$ZEPPELIN_HOME/conf
export PATH=$ZEPPELIN_HOME/bin:$PATH
export PATH=/usr/local/opt/libxml2/bin:$PATH
export PKG_CONFIG_PATH=/usr/local/opt/libxml2/lib/pkgconfig

# https://discourse.brew.sh/t/failed-to-set-locale-category-lc-numeric-to-en-ru/5092/8
export LC_ALL=en_US.UTF-8

