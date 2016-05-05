# name: FishFace

## config ##
set -g fishface_fish '><((("> '
# display things
set -g fishface_display_status 1
set -g fishface_display_jobs 1
set -g fishface_display_git 1  # Must have git
set -g fishface_display_git_dirty 1  # No effect if fishface_display_git is unset
set -g fishface_display_virtual_env 1
set -g fishface_display_root 1
set -g fishface_display_readonly 1
# colors of said things
set -g fishface_default_color 44F
set -g fishface_status_color F33
set -g fishface_jobs_color FA3
set -g fishface_git_color 4F5
set -g fishface_git_dirty_color CC0
set -g fishface_virtual_env_color 5FF
set -g fishface_root_color 819
set -g fishface_readonly_color C50

set -x VIRTUAL_ENV_DISABLE_PROMPT 1
function fish_prompt
  if test $status != 0
    set_color -o $fishface_status_color
  else if test (jobs -c | wc -l) -gt 0 -a -n $fishface_display_jobs
    set_color -o $fishface_jobs_color
  else if test (git rev-parse ^&1 | wc -l) -eq 0 -a -n $fishface_display_git
    if test (git status -s ^/dev/null | wc -l) -gt 0 -a -n $fishface_display_git_dirty
      set_color -o $fishface_git_dirty_color
    else
      set_color -o $fishface_git_color
    end
  else if test -n "$VIRTUAL_ENV" -a -n $fishface_display_virtual_env
    set_color -o $fishface_virtual_env_color
  else if test (id -u) = "0" -a -n $fishface_display_root
    set_color -o $fishface_root_color
  else if test ! -w . -a -n $fishface_display_readonly
    set_color -o $fishface_readonly_color
  else
    set_color -o $fishface_default_color
  end
  echo -n $fishface_fish
  set_color normal
end
