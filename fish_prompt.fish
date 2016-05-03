# name: FishFace

function _is_git_dirty
  test (command git status -s --ignore-submodules=dirty ^/dev/null | wc -l) -gt 0
  return $status
end

function fish_prompt
  if test "$status" != "0"
    set_color -o red
  else if git rev-parse ^/dev/null
    if _is_git_dirty
      set_color -o yellow
    else
      set_color -o green
    end
  else
    set_color -o blue
  end
  echo -n '><((("> '
  set_color normal
end
