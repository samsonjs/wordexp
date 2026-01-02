# Changelog

[Release notes][gh] for this project are [also available on GitHub][gh].

[gh]: https://github.com/samsonjs/wordexp/releases

# 0.2.2
# 2026-01-02

- Build the native extension under `wordexp/` so `require "wordexp/wordexp_ext"` resolves correctly

# 0.2.1
# 2026-01-02

- Ship source-only gem artifacts to ensure the native extension is built locally

# 0.2.0
# 2023-10-05

- Drop support for Ruby 2.7 because it's no longer supported

# 0.1.2
# 2023-01-08

- Add support for Ruby 3.2
- Drop support for Ruby 2.6

# 0.1.1
# 2022-01-16

- Add native extension and command line executable to gemspec

# 0.1.0
# 2022-01-16

First release. Implements the most basic API without any options.

Command line executable and native extension are broken.
