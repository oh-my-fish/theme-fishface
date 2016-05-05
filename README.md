## FishFace

Shows an ASCII fish instead of a prompt.

![screenshot](https://cloud.githubusercontent.com/assets/10598847/15026896/6ea5d9ec-1249-11e6-9144-58fccbc28b72.png)

### Fish colors

(in order of precedence)

| Color | Meaning |
| --- | --- |
| Light Red | Last command exited non-zero |
| Peach | There are background jobs running |
| Yellow | Git repo dirty |
| Green | In a git repo |
| Light Blue | In Python virtualenv |
| Purple | Running as root |
| Orange | Directory not writable |
| Blue | Normal |

### Installation

```
omf install fishface
```

### Configuration

In the beginning of the prompt script, there are some variable definitions. These can customise the colors. For example, if you want the fish to turn red when in a git repo, you would edit the line with `set -g fishface_git_color ...` to `set -g fishface_git_color red`.  
You can also disable particular things, for example if you don't want the fish to change color when a virtualenv is active, you would comment out the line with `set -g fishface_display_virtual_env 1`.
