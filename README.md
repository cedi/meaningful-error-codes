# Meaningful error codes
This plugin is meant to display error codes from a program in a meaningful way, by not just printing the error code, but also having a textual description for it.
There are quite a few error codes which are special. They can be fount [here](http://www.tldp.org/LDP/abs/html/exitcodes.html).

# Installing this plugin

1. cloning this repository to `$ZSH_CUSTOM/plugins/`
2. enabling the plugin in your zshrc

```
plugins=(meaningful-error-codes)
```

3. Adding `${exit_status}` to your ZSH Prompt:

```
# i prefer to have this in my RPROMPT and colored red:
RPROMPT='%{$fg[red]%}${exit_status}%{$reset_color%}'
```
