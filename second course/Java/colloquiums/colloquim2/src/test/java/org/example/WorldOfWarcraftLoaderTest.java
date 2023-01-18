package org.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class WorldOfWarcraftLoaderTest {
    @Test
    void createObjectstest(){
        BaseGameLoader wowLoader = new WorldOfWarcraftLoader();
        wowLoader.load();
        assertEquals( 0, wowLoader.createObjects(wowLoader.loadLocalData()));


    }

    @Test
    void downloadAdditionalFilesTest(){
        BaseGameLoader wowLoader = new DotaLoader();
        assertEquals(0, wowLoader.downloadAdditionalFiles());

    }

}