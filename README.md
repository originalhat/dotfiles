# originalhat/dotfiles

Loose change, dotfiles and other random configuration items.

## vim

```
./vim/set-helptags.sh
```

## monitor calibration

1. close/disconnect all other screens
2. run script
3. disable [SIP](https://stackoverflow.com/a/32910408):
4. `sudo mount -uw / && killall Finder` (catalina)
5. move generated files to `/System/Library/Displays/Contents/Resources/Overrides/`
6. disconnect/reconnect (or restart) to take effect
7. re-enable SIP!

Additional references:

- http://www.ispcolohost.com/2013/07/11/connecting-a-dell-ultrasharp-u3014-to-a-mac-ugh/
- https://embdev.net/topic/284710#3027030

