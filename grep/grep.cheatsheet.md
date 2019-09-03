# grep: cheatsheet

* match multiple patterns
`grep -E 'foo|bar' *.txt`
`grep -e 'foo' -e 'bar' *.txt`

* print result and 3 following lines.
`grep -A 3 'foobar' file.txt`

* print result and 3 leading lines.
`grep -B 3 'foobar' file.txt`

* print result, 3 leading lines and 3 following lines.
`grep -C 3 'foobar' file.txt`

* show entire file and highlight matches
`grep --color -E 'PATTERN|$' file.txt`
