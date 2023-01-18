package org.example;

public class Main {
    public static void main(String[] args) {

        BaseGameLoader wowLoader = new WorldOfWarcraftLoader();
        wowLoader.load();

        System.out.println("==========================================");

        BaseGameLoader dotaLoader = new DotaLoader();
        dotaLoader.load();




    }
}