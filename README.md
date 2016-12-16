dotfiles
========

backup of my .files


Keep the config free of passwords
========

In `$GIT_DIR/info/attributes`:

```
config filter=passwords
```

In `$GIT_DIR/config`:

```
[filter "passwords"]
clean = "sed -e 's/identify .*\";/identify <PASSWORD>\";/' -e 's/password .*\";/password <PASSWORD>\";/'"
```

Afterwards, don't forget to run `git add -u` for a clean index!
