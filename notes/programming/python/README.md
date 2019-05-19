# Current working directory relative to script

    os.path.abspath(os.path.dirname(__file__))

Note that the above may not work when your program is "frozen" (e.g. [compiled with py2exe](http://www.py2exe.org/index.cgi/WhereAmI)).
