#!/usr/bin/env python
""" This program installs everything you need to make a computer useful. """

import os
import subprocess

def create_folders():
    """ Create common folders """
    home = os.path.expanduser('~')
    folders = ['.vim']
    for folder in folders:
        dir_name = os.path.join(home, folder)  # New symlink
        if os.path.exists(dir_name):
            print('\tDir exists - skipped {}'.format(dir_name))
        else:
            os.makedirs(dir_name)
            print('\tMade dir {}'.format(dir_name))

def git_clones():
    """ Clones git modules to install various stuff. """
    git_repos = [  # (from url, to folder),
        ('gmarik/Vundle.vim.git', '~/.vim/bundle/Vundle.vim'),
    ]

    for repo, to_folder in git_repos:
        if to_folder.startswith('~'):  # Expand home if required
            to_path = os.path.expanduser(to_folder)
        print('\t' + repo)
        subprocess.call(['git', 'clone','git@github.com:' + repo, to_path])

def brew():
    """ Brew install packages """
    pass

def bew_cake():
    """ Brew cake install packages """
    pass

def misc():
    """ Random odds & ends """

    sources = ['~/.bashrc', '~/.bash_profile']
    for source in sources:
        source = os.path.expanduser(source)
        print(source)
        subprocess.call(['bin/sh/', source])  # Source RC files
    subprocess.call(['vi', '-c',':PluginInstall'])  # Run Vundle

def main():
    """ Make it so """

    print('Creating folders')
    create_folders()

    print('Cloning git repos')
    git_clones()

    print('Miscellaneous')
    misc()


if __name__ == '__main__':
    main()

