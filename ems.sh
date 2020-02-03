# 1. lock all user and close all bash
if [ $1 = '-LC' ] || [ $1 = '-lc' ] || [ $1 = '-cl' ] || [ $1 = '-CL' ];then
  # 1.1 lock all user who can login
  all_user=$(grep -v ':!!:\|:\*:' /etc/shadow | awk -F ":" '{print $1}')
  for user in $all_user
  do
    usermod -L $user
  done
  # 1.2 kill all other bash
  my_dev=$(who am i | awk '{print $2}')
  ps aux | grep 'bash' | grep -v $my_dev | grep -v 'grep' | awk '{print $2}' | xargs kill -9
  echo -e '\033[1;35m Already lock all user and close the other bash!!!\033[0m'
# 2. Just lock all user
elif [ $1 = '-L' ] || [ $1 = '-l' ];then
  all_user=$(grep -v ':!!:\|:\*:' /etc/shadow | awk -F ":" '{print $1}')
  for user in $all_user
  do
    usermod -L $user
  done
  echo -e '\033[1;35m Already lock all user !!!\033[0m'
# 3. Unlock all user
elif [ $1 = '-U' ] || [ $1 = '-u' ];then
  all_user=$(grep -v ':!!:\|:\*:' /etc/shadow | awk -F ":" '{print $1}')
  for user in $all_user
  do
    usermod -U $user
  done
  echo -e '\033[1;32m Already unlock all user !!!\033[0m'
else
  echo -e '\033[1;31m Command not find...\033[0m'
fi