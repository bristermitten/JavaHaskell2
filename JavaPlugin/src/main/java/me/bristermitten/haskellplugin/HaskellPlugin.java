package me.bristermitten.haskellplugin;

import org.bukkit.*;
import org.bukkit.plugin.java.*;
import org.bukkit.command.*;
public class HaskellPlugin extends JavaPlugin {
    public static native boolean processCommand(CommandSender sender, String command, String[] args);

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        return processCommand(sender, label, args);
    }

    @Override
    public void onEnable(){
        getCommand("haskell").setExecutor(this);
    }
}
