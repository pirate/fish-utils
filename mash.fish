function mash --description 'mosh into nicksweeting.com'
    switch (count $argv)
    case 0
        mosh root@nicksweeting.com
    case '*'
       ssh root@nicksweeting.com $arg 
    end
end
