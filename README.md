# wordexp

[![Gem Version](https://badge.fury.io/rb/wordexp.svg)](https://rubygems.org/gems/wordexp)
[![CI](https://github.com/samsonjs/wordexp/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/samsonjs/wordexp/actions/workflows/ci.yml?query=branch%3Amain)
[![0 dependencies!](https://0dependencies.dev/0dependencies.svg)](https://0dependencies.dev)

A Ruby gem for performing shell word expansion using [wordexp][]. It's like [Shellwords][] turned up to 11. Not only does it split taking quotes into account, but it also expands environment variables and tildes, and runs subcommands in `` `backticks` `` or `$(dollar parentheses)`.

[wordexp]: https://man7.org/linux/man-pages/man3/wordexp.3.html
[Shellwords]: https://ruby-doc.org/stdlib-3.1.0/libdoc/shellwords/rdoc/Shellwords.html

---

- [Quick start](#quick-start)
- [Support](#support)
- [License](#license)
- [Code of conduct](#code-of-conduct)
- [Contribution guide](#contribution-guide)

## Quick start

```
$ gem install wordexp
```

```ruby
require 'wordexp'

cmd = Wordexp.expand("echo 'roof cats' $HOME ~/bin $(date +%F)")
# => ["echo", "roof cats", "/home/queso", "/home/queso/bin", "2022-01-16"]

fork { exec(*cmd) }
# roof cats /home/queso /home/queso/bin 2022-01-16
```

With that you're half way to a [fairly usable shell in Ruby](https://github.com/samsonjs/csc360-a1-shell). Ok maybe not half but it's a start.

## Command line

Just for fun there's a command line executable that you can use to play around or debug. Note that when you're calling it from another shell you have to quote everything liberally as to not have it interpret anything. It takes a single string as its argument so you'll want to use your shell's strictest quoting, e.g. in zsh:

```zsh
bundle exec wordexp $'echo "hello there" \'blah blah\' "$(date)"'
```

You can also open up irb and interact with it there:

```ruby
>> require 'wordexp'
=> true
>> Wordexp.expand('echo "hello there" \'blah blah\' "$(date)"')
=> ["echo", "hello there", "blah blah", "Sun 16 Jan 2022 22:43:08 PST"]
>> Wordexp.expand <<~EOT.strip
  echo "hello there" 'blah blah' "$(date)"
EOT
=> ["echo", "hello there", "blah blah", "Sun 16 Jan 2022 22:43:08 PST"]
```

## Support

If you want to report a bug, or have ideas, feedback or questions about the gem, [let me know via GitHub issues](https://github.com/samsonjs/wordexp/issues/new) and I will do my best to provide a helpful answer. Happy hacking!

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).

## Code of conduct

Everyone interacting in this project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).

## Contribution guide

Pull requests are welcome! Make sure that new code is reasonably well tested and all the checks pass. I'm happy to provide a bit of direction and guidance if you're unsure how to proceed with any of these things.
