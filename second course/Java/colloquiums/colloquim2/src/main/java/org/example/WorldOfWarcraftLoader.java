package org.example;

public class WorldOfWarcraftLoader extends BaseGameLoader {

    @Override
    public byte[] loadLocalData() {
        System.out.println("Loading local WoW files...");
        // Some Warcraft Code...
        return new byte[0];
    }

    @Override
    public short createObjects(byte[] data) {
        System.out.println("Creating WoW objects...");
        // Some Warcraft Code...
        return 0;
    }

    @Override
    public short downloadAdditionalFiles() {
        System.out.println("Downloading WoW sounds...");
        // Some Warcraft Code...
        return 0;
    }

    @Override
    public void initializeProfiles() {
        System.out.println("Loading WoW profiles...");
        // Some Warcraft Code...
    }

}