# name: FishFace

function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l red (set_color -o red)

  if [ (_git_branch_name) ]
    if [ (_is_git_dirty) ]
      echo -n -s "$red><(((\"> "
    else
      echo -n -s "$green><(((\"> "
    end
  else
    echo -n -s "$blue><(((\"> "
  end
end
