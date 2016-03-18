function _git_branch_name
  echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l last_status $status
  set -l taken "$CMD_DURATION"
  set -l git_dirty ""
  set -l statusstr ""
  set -l current_dir (prompt_pwd)

  if begin; test "$taken" = ""; or test (echo "$taken" | ggrep -oP '(^|\s)\K\d+(?=(\.\d+s$)|s$)') -lt 3; end
    set taken "0"
  else
    set taken $CMD_DURATION
  end

  if [ (_git_branch_name) ]
    set git_info $blue"("$red(_git_branch_name)$blue")"

    if [ (_is_git_dirty) ]
      set git_dirty " ✗"
    end
  end

  if set -q VIRTUAL_ENV
    set venv $blue"("$red(basename "$VIRTUAL_ENV")$blue")"
  end

  

  if test "$taken" != "0"
    set statusstr $yellow$taken$normal
  end

  if test "$last_status" != "0"
    if test $taken != "0"
      set statusstr ":"$statusstr
    end
    set statusstr $red$last_status$normal$statusstr
  end

  if test -n "$statusstr"
    echo "["$statusstr"]"
  end

  echo -n -s $red$arrow $cyan$current_dir $yellow" py:"$venv $yellow" git:"$git_info $purple$git_dirty $normal ' '
end
