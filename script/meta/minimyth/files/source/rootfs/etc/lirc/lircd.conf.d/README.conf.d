/etc/lirc/lircd.conf.d README
=============================

Files in this directory are automatically included, much the same way
as if there was a "include" directive for it in lircd.conf. For this to
work, the filename must match '*.conf'.

You might want to symlink files elseware to this directory,
naming the link to 'something.conf'.

lircd normally (tries to) sort the remotes so the ones which decodes fastest
are used first. If you want to sort your configs manually you can add a file
like this to lircd.conf.d (the filename does not matter).

       begin remote
            name manual_sort
            manual_sort 1
            begin codes
            end codes
       end remote

In manual sort mode the files here are used in the order they are listed by
ls(1). In this situation it makes a lot of sense to name the links like:

    00-my-first-remote.conf
    01-my-next-remote.conf
    ...

to define the sort order.
