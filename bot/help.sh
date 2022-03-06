function help {
	version
	echo "Usage: $0 [options] [message]"
	echo
	echo "OPTIONS are:"
	echo "    -t <TOKEN>       Telegram bot token to use. See ENVIRONMENT for more information."
	echo "    -c <CHAT_ID>     Chat to use as recipient. Can be given more than once. See ENVIRONMENT for more information."
	echo "    -f <FILE>        Sends file."
	echo "    -i <FILE>        Sends file as image. This will fail if the file isn't an actual image file."
	echo "    -M               Enables Markdown processing at telegram."
	echo "    -H               Enables HTML processing at telegram."
	echo "    -C               Sends text as monospace code. Useful when piping command outputs into this tool."
	echo "    -r               Like -C, but if the first line starts with '+ ', it is specially formatted."
	echo "    -l               Fetch known chat_ids."
	echo "    -R               Receive a file sent via telegram."
	echo "    -D               Sets disable_web_page_preview parameter to, well, disable the preview for links to webpages."
	echo "                     Can also be set in config as TELEGRAM_DISABLE_WEB_PAGE_PREVIEW=true (see ENVIRONMENT)"
	echo "                     This feature is only supported for text messages, not when sending files or images (-f, -i)."
	echo "    -N               Diables notifications on clients. Users will receive a notification with no sound."
	echo "                     Can also be set in config as TELEGRAM_DISABLE_NOTIFICATION=true (see ENVIRONMENT)"
	echo
	echo "DEBUGGING OPTIONS are:"
	echo "    -v               Display lots of more or less useful information."
	echo "    -j               Pretend you don't have JQ installed."
	echo "    -n               Dry-run - don't send messages, only print them on screen."
	echo
	echo "Message can be '-', in that case STDIN will be used."
	echo
	echo "ENVIRONMENT"
	echo "    TOKEN and CHAT_ID are required. You can set them in four different ways:"
	echo "      1) globally in /etc/telegram.sh.conf"
	echo "      2) user-local in ~/.telegram.sh"
	echo "      3) via environment variables TELEGRAM_TOKEN and TELEGRAM_CHAT"
	echo "      4) via options -t and -c"
	echo "    Later methods overwrite earlier settings, so you can easily override global settings."
	echo "    Please be aware that you shuld keep your telegram token secret!" 
	echo
	exit
}
