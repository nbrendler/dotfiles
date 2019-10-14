export EDITOR=vim
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export TERM=xterm dotnet build

export SSHHOME="$HOME"
export VIMINIT="let \$MYVIMRC='$SSHHOME/.sshrc.d/.vimrc' | source \$MYVIMRC"

export KAFKA_HOST=localhost:9092
export ZOOKEEPER_HOST=localhost:2181
