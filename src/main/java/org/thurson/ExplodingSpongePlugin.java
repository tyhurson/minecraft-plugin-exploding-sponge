package org.thurson;

import org.bukkit.plugin.java.JavaPlugin;


public class ExplodingSpongePlugin extends JavaPlugin {
    @Override
    public void onEnable(){
        // Registers our event listener
        getServer().getPluginManager().registerEvents(new ExplodingSpongeListener(), this);
    }
}
