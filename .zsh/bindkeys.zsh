# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

bindkey '^K' kill-whole-line                      # ctrl-k
bindkey "^R" history-incremental-search-backward  # ctrl-r
bindkey "^A" beginning-of-line                    # ctrl-a  
bindkey "^E" end-of-line                          # ctrl-e
bindkey "[B": history-search-forward              # down arrow
bindkey "[A": history-search-backward             # up arrow
bindkey '\eOc' forward-word		# ctrl cursor right
bindkey '\eOd' backward-word # ctrl cursor left

# bindkey '^[[D' backward-word                      # option left
# bindkey '^[[C' forward-word                       # option right
