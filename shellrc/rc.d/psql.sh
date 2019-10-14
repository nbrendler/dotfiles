function runq() {
  [ $# -ge 1 -a -f "$1" ] && input="$1" || input="-"
  psql \
    -h localhost \
    --echo-all \
    --set AUTOCOMMIT=off \
    --set ON_ERROR_STOP=on \
    -d fg\
    -c "$(cat $input)"
}

function explainq() {
  [ $# -ge 1 -a -f "$1" ] && input="$1" || input="-"
  echo "EXPLAIN $(cat $input)" | runq
}

export POSTGRES_USER=nikolai
export POSTGRES_PASSWORD=
export POSTGRES_HOST=localhost
export POSTGRES_DATABASE=fg
export POSTGRES_PORT=5432
export POSTGRES_SSLMODE=disable
