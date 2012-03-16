#
# Colorized prompt, with different username colors for different systems.
# Via http://github.com/bitprophet/dotfiles
#

# Color codes
RED='\[\033[31m\]'
GREEN='\[\033[32m\]'
YELLOW='\[\033[33m\]'
BLUE='\[\033[1;34m\]'
PURPLE='\[\033[35m\]'
CYAN='\[\033[1;36m\]'
WHITE='\[\033[37m\]'
NIL='\[\033[00m\]'

# Hostname styles
FULL='\H'
SHORT='\h'

# System => color/hostname map:
#   UC: username color
#   LC: location/cwd color
#   HD: hostname display (\h vs \H)
# Defaults:
UC=$GREEN
LC=$BLUE
HD=$FULL

# Manually cut hostname; hostname -s bails out on some systems.
case $( hostname | cut -d '.' -f 1 ) in
    jeff | ytram ) UC=$YELLOW LC=$GREEN HD=$SHORT ;;
    bitprophet ) UC=$CYAN ;;
    *-production ) UC=$RED HD=$SHORT ;;
    mail | code | bacula | www* | monitor | bender | xen ) UC=$RED ;;
esac

# Prompt function because PROMPT_COMMAND is awesome
function set_prompt() {
    # If logged in as another user, not gonna have all this firing anyway.
    # So let's just show the host only and be done with it.
    host="${UC}${HD}${NIL}"

    # Special vim-tab-like shortpath (~/folder/directory/foo => ~/f/d/foo)
    _pwd=`pwd | sed "s#$HOME#~#"`
    if [[ $_pwd == "~" ]]; then
        _dirname=$_pwd
    else
        _dirname=`dirname "$_pwd" `
        if [[ $_dirname == "/" ]]; then
            _dirname=""
        fi
        _dirname="$_dirname/`basename "$_pwd"`"
    fi
    path="${LC}${_dirname}${NIL}"

    # Virtualenv
    _venv=`basename "$VIRTUAL_ENV"`
    venv="" # need this to clear it when we leave a venv
    if [[ -n $_venv ]]; then
        venv=" ${NIL}{${PURPLE}${_venv}${NIL}}"
    fi
	# TODO: This from chris would let me make the wereami logic a one-liner ((isgit && gitterm) || ishg && hgterm) || term

    # Git branch / dirtiness
    # Dirtiness cribbed from:
    # http://henrik.nyh.se/2008/12/git-dirty-prompt#comment-8325834
	if git show >/dev/null 2>/dev/null; then
		if git update-index -q --refresh 2>/dev/null; git diff-index --quiet --cached HEAD --ignore-submodules -- 2>/dev/null && git diff-files --quiet --ignore-submodules 2>/dev/null
			then dirty=""
		else
			dirty="${RED}${NIL}"
		fi
		_branch=$(git symbolic-ref HEAD 2>/dev/null)
		_branch=${_branch#refs/heads/} # apparently faster than sed
		branch="" # need this to clear it when we leave a repo
		if [[ -n $_branch && $dirty == '' ]]; then
			branch=" ${NIL}[${PURPLE}${dirty}${_branch}${dirty}${NIL}]"
		else
			branch=" ${NIL}${RED}[ ${NIL}${PURPLE}${_branch}${dirty}${NIL}${RED} ]${NIL}"
		fi
		end="${LC}±${NIL} "
		# Feels kind of like cheating...but works so well!
		export PS1="${host}:${path}${venv}${branch} ${end}"
	else
    # Dollar/pound sign if not git
    end="${LC}\$${NIL} "
	export PS1="${host}:${path}${venv} ${end}"
	fi


}
export PROMPT_COMMAND=set_prompt
