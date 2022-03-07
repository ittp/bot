#curl -sL https://deb.nodesource.com/setup_16.x | bash -
. ../lib/telegram
action=""

command() {
  local text=$1
  echo $text
  action=$install
}


action::install() { 
  echo "install"
}





