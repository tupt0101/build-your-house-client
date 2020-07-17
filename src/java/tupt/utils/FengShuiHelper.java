/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tupt.utils;

import java.io.Serializable;
import java.util.HashMap;

/**
 *
 * @author sherl
 */
public class FengShuiHelper implements Serializable {
    
    public static String findFateFromYOB(int yob) {
        String fateArr[] = {"menh kim", "menh thuy", "menh hoa", "menh tho", "menh moc"};
        HashMap<Integer, String> fateHashMap = new HashMap<>(5);
        for (int i = 1; i <= fateArr.length; i++) {
            fateHashMap.put(i, fateArr[i-1]);
        }
        
        String canArr[] = {"canh", "tân", "nhâm", "quý", "giáp", "ất", "bính", "đinh", "mậu", "kỷ"};
        HashMap<Integer, String> canHashMap = new HashMap<>(10);
        for (int i = 0; i < canArr.length; i++) {
            canHashMap.put(i, canArr[i]);
        }
        
        String chiArr[] = {"tý", "sửu", "dần", "mẹo", "thìn", "tỵ", "ngọ", "mùi", "thân", "dậu", "tuất", "hợi"};  
        HashMap<Integer, String> chiHashMap = new HashMap<>(12);
        for (int i = 0; i < chiArr.length; i++) {
            chiHashMap.put(i, chiArr[i]);
        }
        
        String canOfUser = canHashMap.get(yob%10);
        String chiOfUser = chiHashMap.get((yob%100)%12);
        
        int canNumber = 0;
        int chiNumber = 0;
        switch (canOfUser) {
            case "giáp":
            case "ất": {
                canNumber = 1;
                break;
            }
            case "bính":
            case "đinh": {
                canNumber = 2;
                break;
            }
            case "mậu":
            case "kỷ": {
                canNumber = 3;
                break;
            }
            case "canh":
            case "tân": {
                canNumber = 4;
                break;
            }
            case "nhâm":
            case "quý": {
                canNumber = 5;
                break;
            }
        }
        
        switch (chiOfUser) {
            case "tý":
            case "sửu":
            case "ngọ":
            case "mùi": {
                chiNumber = 0;
                break;
            }
            case "dần":
            case "mẹo":
            case "thân":
            case "dậu": {
                chiNumber = 1;
                break;
            }
            case "thìn":
            case "tỵ":
            case "tuất":
            case "hợi": {
                chiNumber = 2;
                break;
            }
        }
        
        int fate = canNumber + chiNumber;
        return fateHashMap.get(fate > 5 ? fate - 5 : fate);
    }
}
