#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/usr/X11/lib/X11/xinit/.Xresources
sysmodmap=/usr/X11/lib/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
  if [ -x /usr/bin/cpp ] ; then
      xrdb -merge $sysresources
  else
      xrdb -nocpp -merge $sysresources
  fi
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  if [ -x /usr/bin/cpp ] ; then
      xrdb -merge "$userresources"
  else
      xrdb -nocpp -merge "$userresources"
  fi
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

export PATH=/usr/local/git/bin:/Library/Ruby/bin:/opt/local/bin:/opt/local/lib/postgresql82/bin/:/opt/local/sbin:/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/:/usr/local/bin:$PATH
#exec quartz-wm --only-proxy & wmii
exec quartz-wm --only-proxy & awesome
