#!/bin/sh
set -e

MODE="$1"
e="$2"

has_target() {
  set +e
  make -q "$MODE" 2> /dev/null
  RESULT_T=$?
  set -e
  [ $RESULT_T -eq 0 ] || [ $RESULT_T -eq 1 ]
}

echo "$e"
(
  cd "$e" || exit 1
  if [ -f Makefile ] && has_target ; then
    set +e
    make "$MODE"
    RESULT=$?
    set -e
    if [ "$MODE" = "run" ] ; then
      MODE="down"
      if has_target ; then
        set +e
        make down 2> /dev/null
        set -e
      else
        ../../reach down
      fi
      MODE="run"
    fi
    if [ $RESULT -ne 0 ] ; then
      echo "$e" "$MODE" failed
      exit 1
    fi
    ( exit 0 )
  else
    case "$MODE" in
      build)
        ../../reach compile
        ;;
      run)
        # sorry, this is ugly
        set +e
        ../../reach run
        RESULT=$?
        set -e
        ../../reach down
        if [ $RESULT -ne 0 ] ; then
          exit $RESULT
        fi
        ;;
      down)
        ../../reach down
        ;;
      clean)
        ../../reach clean
        ;;
    esac
  fi
) || exit 1
