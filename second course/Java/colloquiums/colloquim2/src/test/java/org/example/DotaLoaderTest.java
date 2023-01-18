package org.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class DotaLoaderTest {
     @Test
    void createObjectstest(){
        BaseGameLoader dotaLoader = new DotaLoader();
        dotaLoader.createObjects(dotaLoader.loadLocalData());
        assertEquals( 0, dotaLoader.createObjects(dotaLoader.loadLocalData()));


    }

    @Test
    void downloadAdditionalFilesTest(){
        BaseGameLoader dotaLoader = new DotaLoader();
        assertEquals(0, dotaLoader.downloadAdditionalFiles());

    }

}