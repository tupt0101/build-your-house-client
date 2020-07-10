/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tupt.dtos;

import tupt.constants.HouseConstant;

/**
 *
 * @author sherl
 */
public class HouseDTO {
    private int numOfFloors, areaOfFloor, areaOfTum, areaOfFlower, areaOfLam, areaOfCover, areaOfNoCover;
    private String substructure, roof;
    private boolean isSimpleTerrace;

    public HouseDTO(int numOfFloors, int areaOfFloor, String substructure, String roof, boolean isSimpleTerrace, int areaOfTum, int areaOfFlower, int areaOfLam, int areaOfCover, int areaOfNoCover) {
        this.numOfFloors = numOfFloors;
        this.areaOfFloor = areaOfFloor;
        this.areaOfTum = areaOfTum;
        this.areaOfFlower = areaOfFlower;
        this.areaOfLam = areaOfLam;
        this.areaOfCover = areaOfCover;
        this.areaOfNoCover = areaOfNoCover;
        this.substructure = substructure;
        this.roof = roof;
        this.isSimpleTerrace = isSimpleTerrace;
    }

    public int getNumOfFloors() {
        return numOfFloors;
    }

    public void setNumOfFloors(int numOfFloors) {
        this.numOfFloors = numOfFloors;
    }

    public int getAreaOfFloor() {
        return areaOfFloor;
    }

    public void setAreaOfFloor(int areaOfFloor) {
        this.areaOfFloor = areaOfFloor;
    }

    public int getAreaOfTum() {
        return areaOfTum;
    }

    public void setAreaOfTum(int areaOfTum) {
        this.areaOfTum = areaOfTum;
    }

    public int getAreaOfFlower() {
        return areaOfFlower;
    }

    public void setAreaOfFlower(int areaOfFlower) {
        this.areaOfFlower = areaOfFlower;
    }

    public int getAreaOfLam() {
        return areaOfLam;
    }

    public void setAreaOfLam(int areaOfLam) {
        this.areaOfLam = areaOfLam;
    }

    public int getAreaOfCover() {
        return areaOfCover;
    }

    public void setAreaOfCover(int areaOfCover) {
        this.areaOfCover = areaOfCover;
    }

    public int getAreaOfNoCover() {
        return areaOfNoCover;
    }

    public void setAreaOfNoCover(int areaOfNoCover) {
        this.areaOfNoCover = areaOfNoCover;
    }

    public String getSubstructure() {
        return substructure;
    }

    public void setSubstructure(String substructure) {
        this.substructure = substructure;
    }

    public String getRoof() {
        return roof;
    }

    public void setRoof(String roof) {
        this.roof = roof;
    }

    public boolean isIsSimpleTerrace() {
        return isSimpleTerrace;
    }

    public void setIsSimpleTerrace(boolean isSimpleTerrace) {
        this.isSimpleTerrace = isSimpleTerrace;
    }
    
    // Tong dien tich san thi cong
    // = Dien tich san + Dien tich mong + Dien tich mai
    public double totalConstructionArea() {
        return areaOfFloor*numOfFloors + areaOfTum + substructureArea() + ceilingArea();
    }
    
    // Tinh dien tich mong nha
    public double substructureArea() {
        double area = 0;
        switch (substructure) {
            case HouseConstant.MONG_DON:
                area = areaOfFloor*0.2;
                break;
            case HouseConstant.MONG_BANG:
                area = areaOfFloor*0.4;
                break;
            case HouseConstant.MONG_COC:
                area = areaOfFloor*0.3;
                break;
            case HouseConstant.MONG_COC_BE_TONG:
                area = areaOfFloor*0.5;
                break;
        }
        return area;
    }
    
    // Tinh dien tich mai/san thuong
    public double ceilingArea() {
        double area = 0;
        if (roof != null) {
            switch (roof) {
                case HouseConstant.MAI_CHONG_THAM:
                    area = areaOfFloor*0.15;
                    break;
                case HouseConstant.MAI_CHONG_NONG:
                    area = areaOfFloor*0.3;
                    break;
                case HouseConstant.MAI_NGOI_TRAN_GIA:
                    area = areaOfFloor;
                    break;
                case HouseConstant.MAI_NGOI_TRAN_THACH_CAO:
                    area = areaOfFloor*1.25;
                    break;
                case HouseConstant.MAI_NGOI_BE_TONG:
                    area = areaOfFloor*1.5;
                    break;
                case HouseConstant.MAI_TON:
                    area = areaOfFloor*0.75;
                    break;
            }
        } else {
            if (isSimpleTerrace) {
                area = areaOfFloor*0.5;
            } else {
                area = areaOfFlower*0.75 + areaOfLam*0.75 + areaOfCover*0.75 + areaOfNoCover*0.5;
            }
        }
        return area;
    }
}
