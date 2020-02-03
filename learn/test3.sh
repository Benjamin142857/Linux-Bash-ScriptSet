if [ $1 ];then
    case $1 in
    [a-z])
      echo 'a-z'
    ;;
    [0-8])
      echo '0-8'
    ;;
    9)
      echo '9'
    ;;
    *)
       echo 'other'
    ;;
    esac
fi

if [ $2 ];then
    echo $2
fi

