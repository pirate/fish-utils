function _git_branch_name
  echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l last_status $status
  set -l taken "0"
  if test "$CMD_DURATION" = "";
    set taken "0"
  else
    set taken $CMD_DURATION
  end

  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  set -l arrow "$red➜ "
  set -l cwd $cyan(prompt_pwd)

  if [ (_git_branch_name) ]
    set -l git_branch $red(_git_branch_name)
    set git_info "$blue git:($git_branch$blue)"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  if set -q VIRTUAL_ENV
    set envname (basename "$VIRTUAL_ENV")
    set virtualen "$blue py:($red$envname$blue)"
  end

  set -l statusstr ""

  if test $taken != "0"
    set statusstr $yellow"$taken"$normal
  end

  if test $last_status != "0"
    if test $taken != "0"
      set statusstr ":"$statusstr
    end
    set statusstr $red"$last_status"$normal$statusstr
  end

  if test -n $statusstr
    echo "["$statusstr"]"
  end

  echo -n -s $arrow $cwd $virtualen $git_info $normal ' '
end
