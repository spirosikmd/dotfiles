# smileyfiles

<img src="https://rawgit.com/usabilla/smileyfiles/master/smiley.svg" width="100" height="100">

Usabilla dotfiles! A collection of configuration files for Usabilla developers.

## Welcome!

Are you new at Usabilla? Do you not have any dotfiles? 😱 😜 Do you have heaps of dotfiles but are curious to see if we use anything new and useful to you? Then you're in the right place.

### What are dotfiles?
Dotfiles are files/directories with a `.` prepended to their name. For example, `.bashrc`. The leading dot is used as an indicator that these are hidden configuration files. People tend to backup and also share their dotfiles as they contain super useful tools and shortcuts that make developing easier. An example of a site dedicated to sharing dotfiles is <http://dotfiles.org>.

**Fun dotfiles fact!**

> The legend goes that dotfiles arose from a bug in the earliest days of UNIX: in an effort to avoid listing the `.` and `..` entries of a directory, the `ls` command skipped files that _began_ with the `.` character. As a result, any file with a name beginning with `.` was not reported by `ls`, i.e. it was a "hidden" file. A user's home directory was a convenient place to put user-specific configuration files, but such files were also an eyesore; one popular solution to this problem was to make those configuration files hidden so that they wouldn't annoy the user. Thus, the tradition of dotfiles was born.

### How to use this repo

We've set up these dotfiles as a general guide. If you already have established dotfiles, you can pick and copy the pieces that seem useful to you. The helper commands in the `helpers` folder in particular may be useful for working on Usabilla projects.

**Creating your dotfiles**

If you are new to dotfiles, here's how to set them up using this project as a base.

First create a directory to store your dotfiles (it doesn't matter where but a good option is to keep them in a `dotfiles` folder in your $HOME directory)

```
cd ~
mkdir dotfiles
```

Then download smileyfiles and copy them into your `dotfiles` directory.

```
cd dotfiles
curl -L https://api.github.com/repos/usabilla/smileyfiles/tarball | tar xz --strip=1
```

**Installing homebrew**

Homebrew is a package manager for macOS. It's really useful for installing many packages that you'll need but don't come pre-installed on macOS. We've setup a list of packages that are useful to install straight away.

First [install brew]((https://brew.sh/)). Then install the default brew packages defined in our Brewfile:

```
cat _homebrew/Brewfile | xargs brew install
```

**Installing the dotfiles packages**

Each of the folders in this repo is a "dotfiles package". They contain configuration files and scripts that are useful when using that tool. They also each include a README with more info and suggestions. You can use `stow` to easily install these packages into your $HOME directory.

If you followed the homebrew step `stow` will have already been installed. If not run: `brew install stow`.

Copy the `.stowrc.example` in the stow directory:

```
cd stow
cp .stowrc.example .stowrc
```

Now set the `--target` property to point to your $HOME directory. e.g. `--target=/Users/gertrude`.

Then, from the root of your dotfiles folder, run the following command to set up our default `stow` configuration that we'll need later.

```
stow -t ~ stow
```

Then run `stow` on each of the folders in this repo that you want to use. Any folders prefixed with an underscore are not intended for stowing.

```
stow bash
stow git
stow helpers
stow tmux
stow vim
stow zsh
```

[Read more](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/) about using stow for dotfiles.


**Congrats!**

You have your very own dotfiles! Add or edit your own configurations to your heart's content. Each folder in this repo has a readme that will explain how to do so, and include links for further references.

## Share your dotfiles

A good practice with dotfiles is to share them. As with any public repo, never put sensitive information in your dotfiles. First [create a new repo on Github](https://github.com/new) called `dotfiles`. Then in your local dotfiles directory:
```
git init
git add --all
git commit -m "Initial commit"
git remote add origin git@github.com:<your Github username>/dotfiles.git
git push -u origin master

```

## To Do
- [ ] Printable cheatsheets for:
    - [x] vim
    - [x] git
    - [x] markdown
    - [x] tmux
    - [ ] bash/zsh
- [x] Git files
- [x] Vim files
- [x] Tmux files
- [x] Stow files
- [ ] Bash files (including prompt)
- [ ] Zsh files (including prompt)
- [x] Brewfile
- [ ] Readme in each of the things
- [ ] Custom helper commands (bin folder)

Nice to have:
- [ ] Wizard generator for creating custom dotfiles
- [ ] Alfred workflows?
