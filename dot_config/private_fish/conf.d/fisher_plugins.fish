# Ensure fisher is installed
if not functions -q fisher
    echo "Installing Fisher..."
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

# Install plugins from plugin list (if not already installed)
set pluginfile ~/.config/fish/fisher_plugins.txt
if test -f $pluginfile
    for plugin in (cat $pluginfile)
        if not fisher list | grep -q $plugin
            echo "Installing plugin: $plugin"
            fisher install $plugin
        end
    end
end

