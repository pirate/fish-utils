# Fish Utility Functions

This repo contains a (rarely updated) collection of my custom fish helper funcs and dotfiles.

## Resources

 - Comparison of all the UNXI shells                                      http://hyperpolyglot.org/unix-shells
 - Defensive Bash Programming                                             https://archive.sweeting.me/archive/1404986059.18/www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/index.html
 - anordal/shellharden                                                    https://github.com/anordal/shellharden/blob/master/how_to_do_things_safely_in_bash.md
 - Ten Things I Wish I’d Known About bash                                 https://zwischenzugs.com/2018/01/06/ten-things-i-wish-id-known-about-bash
 - Ten More Things I Wish I’d Known About bash                            https://zwischenzugs.com/2018/01/21/ten-more-things-i-wish-id-known-about-bash
 - When Bash Scripts Bite :: Jane Street Tech Blogs                       https://blogs.janestreet.com/when-bash-scripts-bite/
 - Gensokyo Blog - Use Bash Builtins shell,fish,bash                      https://blog.gensokyo.io/a/fafbe742.html
 - barryclark/bashstrap                                                   https://github.com/barryclark/bashstrap
 - Detecting the use of "curl | bash" server side                         https://idontplaydarts.com/2016/04/detecting-curl-pipe-bash-server-side
 - Something you didn't know about functions in bash                      http://catonmat.net/blog/bash-functions
 - BashPitfalls : Greg's Wiki                                             http://mywiki.wooledge.org/BashPitfalls
 - Shell Style Guide                                                      https://google.github.io/styleguide/shell.xml
 - Shell Scripts Matter                                                   https://dev.to/thiht/shell-scripts-matter
 - 30 interesting commands for the Linux shell – Víctor López Ferrando    https://www.lopezferrando.com/30-interesting-shell-commands/
 - Common shell script mistakes                                           http://www.pixelbeat.org/programming/shell_script_mistakes.html
 - Shellcode Injection - Dhaval Kapil                                     https://dhavalkapil.com/blogs/Shellcode-Injection/
 - Rich’s sh (POSIX shell) tricks                                         http://www.etalabs.net/sh_tricks.html
 - Testing Bash scripts with BATS                                         https://opensource.com/article/19/2/testing-bash-bats
 - Testing Bash scripts with Critic.sh                                    https://github.com/Checksum/critic.sh
 - Useful BASH and UNIX commands                                          https://cb.vu/unixtoolbox.xhtml

If any of the links are dead, you can find an archived version on https://archive.sweeting.me

Problems that fish has that bash doesn't have (I love fish as a shell, I just don't think it's good as a scripting language):

- https://github.com/fish-shell/fish-shell/issues/159
- https://github.com/fish-shell/fish-shell/issues/1396
- https://github.com/fish-shell/fish-shell/issues/206
- https://github.com/fish-shell/fish-shell/issues/2007
- https://github.com/fish-shell/fish-shell/issues/510
- https://github.com/fish-shell/fish-shell/issues/4907
- backgrounding fish functions does not exist: https://github.com/fish-shell/fish-shell/issues/238
- so I had to make an entire job control system for fish that just calls out to bash: https://github.com/fish-shell/fish-shell/issues/2036#issuecomment-298495526 …
