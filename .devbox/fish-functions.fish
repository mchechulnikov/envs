# Fish shell functions for DevBox environment

# Show DevBox environment information
function dev-help --description "Show all available DevBox tools and commands"
    if test -f (pwd)/.devbox/devbox-info.sh
        bash (pwd)/.devbox/devbox-info.sh
    else if test -f "$DEVBOX_PROJECT_ROOT/.devbox/devbox-info.sh"
        bash "$DEVBOX_PROJECT_ROOT/.devbox/devbox-info.sh"
    else
        echo "Error: devbox-info.sh not found"
        return 1
    end
end