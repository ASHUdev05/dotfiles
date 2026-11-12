export PATH="$HOME/.local/bin:$PATH"

# Guarded language & version manager paths (compilers left as-is)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

if [ -d "/usr/local/go/bin" ]; then
    export GOPATH="$HOME/go"
    export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"