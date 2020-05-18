#!/usr/bin/env bash

function runDots() {
    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Run sections based on command line arguments
    for ARG in "$@"
    do
        if [ $ARG == "bootstrap" ] || [ $ARG == "all" ]; then
            echo ""
            echo "------------------------------"
            echo "Syncing the dev-setup repo to your local machine."
            echo "------------------------------"
            echo ""
            cd ~ && curl -#L https://github.com/javacreeper/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}
        fi
        if [ $ARG == "osxprep" ] || [ $ARG == "all" ]; then
            # Run the .osxprep.sh Script
            echo ""
            echo "------------------------------"
            echo "Updating OSX and installing Xcode command line tools"
            echo "------------------------------"
            echo ""
            chmod 711 ./.osxprep.sh
            ./.osxprep.sh
        fi
        if [ $ARG == "osx" ] || [ $ARG == "all" ]; then
            # Run the .osx.sh Script
            # I strongly suggest you read through the commented .osx.sh
            # source file and tweak any settings based on your personal
            # preferences. The script defaults are intended for you to
            # customize. For example, if you are not running an SSD you
            # might want to change some of the settings listed in the
            # SSD section.
            echo ""
            echo "------------------------------"
            echo "Setting sensible OSX defaults."
            echo "------------------------------"
            echo ""
            chmod 711 ./.osx.sh
            ./.osx.sh
        fi
        if [ $ARG == "brew" ] || [ $ARG == "all" ]; then
            # Run the .brew.sh Script
            # For a full listing of installed formulae and apps, refer to
            # the commented .brew.sh source file directly and tweak it to
            # suit your needs.
            echo ""
            echo "------------------------------"
            echo "Installing Homebrew along with some common formulae and apps."
            echo "This might take a while to complete, as some formulae need to be installed from source."
            echo "------------------------------"
            echo ""
            chmod 711 ./.brew.sh
            ./.brew.sh
        fi
        if [ $ARG == "ruby" ] || [ $ARG == "all" ]; then
            # Run the .java.sh Script
            echo "------------------------------"
            echo "Setting up Ruby development environment."
            echo "------------------------------"
            echo ""
            chmod 711 ./.ruby.sh
            ./.ruby.sh
        fi
        if [ $ARG == "zsh" ] || [ $ARG == "all" ]; then
            # Run the .zsh.sh Script
            echo "------------------------------"
            echo "Intstalling and setting up Zsh, Oh-My-Zsh and plugins."
            echo "------------------------------"
            echo ""
            chmod 711 ./.zsh.sh
            ./.zsh.sh
        fi
        if [ $ARG == "web" ] || [ $ARG == "all" ]; then
            # Run the .web.sh Script
            echo "------------------------------"
            echo "Setting up JavaScript web development environment."
            echo "------------------------------"
            echo ""
            chmod 711 ./.web.sh
            ./.web.sh
        fi
        if [ $ARG == "java" ] || [ $ARG == "all" ]; then
            # Run the .java.sh Script
            echo "------------------------------"
            echo "Setting up Java development environment."
            echo "------------------------------"
            echo ""
            chmod 711 ./.java.sh
            ./.java.sh
        fi
        if [ $ARG == "python" ] || [ $ARG == "all" ]; then
            # Run the .python.sh Script
            echo "------------------------------"
            echo "Setting up Python development environment."
            echo "------------------------------"
            echo ""
            chmod 711 ./.python.sh
            ./.python.sh
        fi
        if [ $ARG == "docker" ] || [ $ARG == "all" ]; then
            # Run the .docker.sh Script
            echo "------------------------------"
            echo "Setting up Docker."
            echo "------------------------------"
            echo ""
            chmod 711 ./.docker.sh
            ./.docker.sh
        fi
        if [ $ARG == "datastores" ] || [ $ARG == "all" ]; then
            # Run the .datastores.sh Script
            echo "------------------------------"
            echo "Setting up data stores."
            echo "------------------------------"
            echo ""
            chmod 711 ./.datastores.sh
            ./.datastores.sh
        fi
    done

    echo "------------------------------"
    echo "Completed running .dots, restart your computer to ensure all updates take effect"
    echo "------------------------------"
}

read -p "This script may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    runDots $@
fi;

unset runDots;
