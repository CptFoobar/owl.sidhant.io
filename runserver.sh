##
# Script to build and serve jekyll website on local host in developer mode,
# and then rebuild site in production mode, with Google Analtics code in place.
# This is done to avoid false stats due to GA code in development mode.
##

clear
set -e

# When
control_c() {
    echo -e "\nSession stopped. Rebuilding site in production mode..."
    bundle exec jekyll build --quiet
    echo "Done."
    exit $?
}

# trap keyboard interrupt (control-c)
trap 'control_c;' SIGINT SIGQUIT

echo "Running jekyll serve in development mode..."
bundle exec jekyll serve --watch --config _config.yml,_config_dev.yml $@
