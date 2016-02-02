#! /bin/bash

if $1 == "--help"; then
	echo "Usage: source setup_machine.sh [options]"
	echo ""
	echo "Available options:"
	echo "--without-base     Does not run installation of core software including node, python, coreutils, etc..."
	echo "--with-base"       Forces install of core software.  Basically the opposite of --without-base
	echo "--config-only      Only installs .dotfiles and configuration files.  All software is ignored."
	echo "--data-science     Installs python modules necessary for data science related work (numpy, scikit-learn, etc..."
	echo "--frontend-dev     Installs node modules helpful for frontend development"
else
	# If --without-base flag is not present (--without-base flag would keep this from running) or --with-base
		source ./setup/install_base.sh
	# fi

	# Run necessary installs associated with provided flags
	for i in $@
	do
		# If data-science params set... install necessary software
		case $i in --config-only)
			source setup/run_config.sh
		esac
		case $i in --data-science)
			if eval "python -v"; then
				source setup/install_data_science.sh
			else
			  echo "Python not detected... rerun this script using the --with-base option"
			fi
		esac
		case $i in --frontend-dev)
			if eval "npm -v"; then
				echo "Installing global packages for frontend development"
				source setup/install_frontend_dev.sh
			else
				echo "NPM not detected... rerun this script using the --with-base option"
			fi
		esac
	done
fi
