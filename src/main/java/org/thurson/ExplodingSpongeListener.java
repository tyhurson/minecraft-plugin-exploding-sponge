package org.thurson;

import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.block.Block;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.block.Action;
import org.bukkit.event.player.PlayerInteractEvent;


public class ExplodingSpongeListener implements Listener {
    @EventHandler
    public void onPlayerInteract(PlayerInteractEvent event) {
        // Fires when a player left clicks or right clicks

        Action action = event.getAction();
        Player player = event.getPlayer();

        // Check that the player is left clicking
        if(action == Action.LEFT_CLICK_AIR || action == Action.LEFT_CLICK_BLOCK) {
            // Check that the player is holding a sponge
            if(player.getInventory().getItemInMainHand().getType() == Material.SPONGE) {
                // Get the block the player is looking at
                Block targetBlock = player.getTargetBlock(null, 100);

                // Create an explosion originating at that block
                Bukkit.getWorld("world").createExplosion(targetBlock.getLocation(), 10);
            }
        }
    }
}
