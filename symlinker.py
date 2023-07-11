#!/usr/bin/env python
import glob
import os
import shutil


def backup_and_remove(full_path):
    """Copy a backup and remove original."""
    dir_name, file_name = os.path.split(full_path)
    backup_dir = os.path.join(dir_name, 'dotfiles_backup')
    if not os.path.exists(backup_dir):
        os.makedirs(backup_dir)
    backup_path = os.path.join(backup_dir, file_name)
    shutil.copy(full_path, backup_path)  # Copy orig to backup dir
    print(f'\tBacked up to {backup_path}')
    os.remove(full_path)  # Remove orig


def create_symlink(source, home):
    """From a source path, create a symlink in home folder."""
    file_name = os.path.split(source)[1]  # Filename only
    link_name = os.path.join(home, file_name)  # New symlink
    print(link_name)
    if os.path.exists(link_name):
        if os.path.islink(link_name):
            print('\tLink exists - skipped')
            return None
        elif os.path.isfile(link_name):
            print('\tFile exists - backed up and removed')
            backup_and_remove(link_name)
        else:  # A folder? Do nothing.
            print('\tPath exists - skipped')
            return None

    os.symlink(source, link_name)
    print('\tLink added')
    return link_name


def main():
    home = os.path.expanduser('~')
    dotfiles_folder = os.path.dirname(os.path.realpath(__file__))

    dotfiles = glob.glob(f'{dotfiles_folder}/.*')
    ignore_list = ['.git', '.gitignore', '.swp', '.DS_Store']
    rc_files = [x for x in dotfiles if x not in ignore_list]
    print('Creating dotfile symlinks')
    for rc_file in rc_files:
        create_symlink(rc_file, home)


if __name__ == '__main__':
    main()
