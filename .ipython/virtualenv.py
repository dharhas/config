"""
If a virtual_env is active, add the paths to the active virtual_env to
sys.path on ipython startup

this was gratefully borrowed from:
http://igotgenes.blogspot.com/2010/01/interactive-sandboxes-using-ipython.html
"""
import site
from os import environ
from os.path import join
import sys

if 'VIRTUAL_ENV' in environ:
    virtual_env = join(environ.get('VIRTUAL_ENV'),
                       'lib',
                       'python%d.%d' % sys.version_info[:2],
                       'site-packages')

    # Remember original sys.path.
    prev_sys_path = list(sys.path)
    site.addsitedir(virtual_env)

    # Reorder sys.path so new directories at the front.
    new_sys_path = []
    for item in list(sys.path):
        if item not in prev_sys_path:
            new_sys_path.append(item)
            sys.path.remove(item)
    sys.path[1:1] = new_sys_path

    print 'VIRTUAL_ENV ->', virtual_env
    del virtual_env

del site, environ, join, sys
