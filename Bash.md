
BASH is an acronym - "Bourne Again SHell".
It is based on the original Unix
[shell]( http://en.wikipedia.org/wiki/Bourne_shell )
written by
[Stephen Bourne]( http://en.wikipedia.org/wiki/Stephen_R._Bourne )
while at Bell Labs.
Many of the idioms in Bash have a long history back to the original
Bourne shell.

## *if* commands

While there is an `if` statement in Bourne shell, scripts from long time
shell script writers, mostly from Bell Labs, do not use it.
The Bourne shell idiom is to use the logic operators, `||` and `&&`,
like this:

```bash
# if
command && simple-command
command && {
    : complex command stream
}
# unless
command || simple-command
command || {
    : complex command stream
}
```

The first command is commonly a test command

## `:` is a comment command

`:` is not a comment character, it is a comment command.
So if you use `:foo` you will get an error.

## `test` effect on script exit status

The exit status of a shell script is the exit status of the last
command that executes in the script.
So, if you have a test at the end of the script:

```bash
[ -f /tmp/sentinel ] && rm -f /tmp/sentinel
# end of script
```

and the test fails (in this case the `/tmp/sentinel` file is not present)
then the script will exit with a non-zero value.
This may not normally be a problem for you.
However, if you are using this in an RPM spec file, you will
find that your rpm install will fail when the test fails
even though your install didn't really fail.

A simple solution to this problem is to use the `:` comment command at the
end of scripts.
If you are a `vi(m)` user, you can double the function of this last line
by putting the *modeline* in the `:` comment at the end.

```bash
: vim:autoindent expandtab sw=4 syntax=bash
```

## Use `case` for complex `if`

## Env modification for a single command

## Cleaning when shell exits

Use

```bash
trap "command" EXIT
```

## Use of `env` command for script interpreter

You will sometimes see scripts that start with:

```bash
#!/usr/bin/env ruby
```

The problem with this approach is you do not know which interpreter
will get used.  This is a problem if someone puts a broken interpreter
in their path, or they put one with a security hole in the path.

----
## Hazards


### Issues with pipe to while

```bash
ls | while read filename
do
    foo=$filename
done
echo $foo # is not set
```

What is the workaround

### Don't use *ls* when a glob will do


### Beware whitespace in filenames

### Filenames with leading `-`

The problem is that the filename is treated as an option/parameter
to the command you are running.
The workaround that works most frequently is to add the path in
front of the filename, and that can simply be `./-foo`.

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
