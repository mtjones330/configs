# shellcheck shell=bash
# shellcheck disable=SC2034 # Expected behavior for themes.

function prompt_command() {
	PS1="\n${purple?}\h "
	PS1+="${green?}\w\n"
	PS1+="${green?}${reset_color?} "
}

: "${THEME_SHOW_CLOCK:="false"}":
: "${THEME_SHOW_CLOCK_CHAR:="false"}"

safe_append_prompt_command prompt_command
