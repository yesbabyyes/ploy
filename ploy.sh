# Ploy deployment tool
# Implemented as a bash function
# To use source this file from your bash profile
#
# Implemented by Linus G Thiel <linus@hanssonlarsson.se>
# heavily based on nvm.sh by Tim Caswell

PLOY_VERSION=0.1.0

# Auto detect the PLOY_DIR
if [ ! -d "$PLOY_DIR" ]; then
    export PLOY_DIR=$(cd $(dirname ${BASH_SOURCE[0]:-$0}); pwd)
    export PLOY_VERSION
fi

# Emulate curl with wget, if necessary
if [ ! `which curl` ]; then
    if [ `which wget` ]; then
        curl() {
            ARGS="$* "
            ARGS=${ARGS/-s /-q }
            ARGS=${ARGS/--progress-bar /}
            ARGS=${ARGS/-C - /-c }
            ARGS=${ARGS/-o /-O }

            wget $ARGS
        }
    else
        NOCURL='nocurl'
        curl() { echo 'Need curl or wget to proceed.' >&2; }
    fi
fi

ploy_remote()
{
    ssh $2 -tt ". ~/.ploy/ploy.sh && ploy $1"
}

# Deploy a package to a host
deploy_package()
{
    PACKAGE=$1

    if [ $# -eq 1 ]; then
        HOST=localhost
    else
        HOST=$2
    fi

    RECIPE=$PLOY_DIR/recipes/$PACKAGE

    if [ -e $RECIPE ]; then
        source $RECIPE
    else
        echo "$PACKAGE: No such recipe!"
        return 1
    fi

    if [[ $($INSTALLED) == *$VERSION* ]]; then
        echo "$PACKAGE $VERSION is already installed on $HOST."
        return
    fi

    if (
        mkdir -p "$PLOY_DIR/src" && \
        cd "$PLOY_DIR/src" && \
        curl -C - --progress-bar $URL | tar zxf - && \
        cd $PACKAGE_NAME && \
        $INSTALL
        )
    then
        echo "Success! $PACKAGE $VERSION installed on $HOST."
    else
        echo "Error: $PACKAGE $VERSION install failed on $HOST!"
        return 1
    fi
}

ploy()
{
  if [ $# -lt 1 ]; then
    ploy help
  elif [ $# -gt 1 ]; then
    ploy_remote $*
  else
    case $1 in
      "help" )
        echo
        echo "Ploy deployment tool"
        echo
        echo "Usage:"
        echo "    $0 help                    Show this message"
        echo "    $0 PACKAGE [HOST]          Install PACKAGE on HOST or locally."
        echo
      ;;
      * )
        deploy_package $*
      ;;
    esac
  fi
}
