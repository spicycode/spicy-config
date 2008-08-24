function git_prompt_info
	command git symbolic-ref HEAD | 	gawk -F '/' '{ print $3 }' | 	read ref
	echo $ref
end
