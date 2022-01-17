# wordexp

[![Gem Version](https://badge.fury.io/rb/wordexp.svg)](https://rubygems.org/gems/wordexp)
[![Circle](https://circleci.com/gh/samsonjs/wordexp/tree/main.svg?style=shield)](https://app.circleci.com/pipelines/github/samsonjs/wordexp?branch=main)
[![Code Climate Maintainability](https://api.codeclimate.com/v1/badges/21cc24badf15d19b5cec/maintainability)](https://codeclimate.com/github/samsonjs/wordexp/maintainability)

A Ruby gem for performing shell word expansion using [GNU wordexp][]. It's like [Shellwords][] turned up to 11. Not only does it split taking quotes into account, but it also expands environment variables and tildes, and runs subcommands in \``backticks`\` or `$(dollar parentheses)`.

[GNU wordexp]: https://www.gnu.org/software/libc/manual/html_node/Word-Expansion.html
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

With that you're half way to a [fairly usable shell in Ruby](https://github.com/samsonjs/csc360-a1-shell).

## Support

If you want to report a bug, or have ideas, feedback or questions about the gem, [let me know via GitHub issues](https://github.com/samsonjs/wordexp/issues/new) and I will do my best to provide a helpful answer. Happy hacking!

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).

## Code of conduct

Everyone interacting in this project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).

## Contribution guide

Pull requests are welcome! Make sure that new code is reasonably well tested and all the checks pass. I'm happy to provide a bit of direction and guidance if you're unsure how to proceed with any of these things.
