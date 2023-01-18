package org.example;

public abstract class BaseGameLoader {

    public void load() {
        byte[] data = loadLocalData();
        createObjects(data);
        downloadAdditionalFiles();
        cleanTempFiles();
        initializeProfiles();
    }

    abstract byte[] loadLocalData();

    abstract short createObjects(byte[] data);

    abstract short downloadAdditionalFiles();

    abstract void initializeProfiles();

    protected void cleanTempFiles() {
        System.out.println("Cleaning temporary files...");
        // Some Common Code...
    }
}
