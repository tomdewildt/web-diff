# Web Diff
[![License](https://img.shields.io/github/license/tomdewildt/ssh-provision)](https://github.com/tomdewildt/web-diff/blob/master/LICENSE)

A simple tool to compare a website against a snapshot to detect changes.

# How To Run

Prerequisites:
* curl version ```8.4.0``` or later

### Production

1. Run ```./src/web-diff.sh --create <url> <path>``` to create a snapshot.
2. Run ```./src/web-diff.sh <url> <path>``` to compare a website against a snapshot.

# References

[Curl Docs](https://curl.se/docs/manpage.html)

[Diff Docs](https://man7.org/linux/man-pages/man1/diff.1.html)
