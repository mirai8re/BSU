package org.example;

public class DotaLoader extends BaseGameLoader {

    @Override
    public byte[] loadLocalData() {
        System.out.println("Loading Dota files...");
        // Some Dota Code...
        return new byte[0];
    }

    @Override
    public short createObjects(byte[] data) {
        System.out.println("Creating Dota objects...");
        // Some Dota Code...
        return 0;
    }

    @Override
    public short downloadAdditionalFiles() {
        System.out.println("Downloading Dota sounds...");
        // Some Dota Code...
        return 0;
    }

    @Override
    public void initializeProfiles() {
        System.out.println("Loading Dota profiles...");
        // Some Dota Code...
    }

}