# Ploy deployment tool

`ploy` is a very simple deployment tool written in bash. We use it at [Hansson & Larsson](http://hanssonlarsson.se/) to deploy software to our production, staging and development environments.

## Version

0.1.0

## Installation

    git clone git://github.com/hanssonlarsson/ploy .ploy
    echo ". ~/.ploy/ploy.sh" >> .profile

## Usage

    ploy package [host]

`ploy` will look in `~/.ploy/recipes` for the specified `package`, and install it on `host` or locally. To install a package on a different host, `ploy` must be installed on that host as well as the local machine.

## Author

Linus G Thiel <linus@hanssonlarsson.se>

## License 

(The MIT License)

Copyright (c) 2010 Hansson &amp; Larsson &lt;info@hanssonlarsson.se&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
