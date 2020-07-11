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
    private String substructure, roof, typeOfWall;
    private boolean isSimpleTerrace;

    public HouseDTO(int numOfFloors, int areaOfFloor, String substructure, String typeOfWall, String roof, boolean isSimpleTerrace, int areaOfTum, int areaOfFlower, int areaOfLam, int areaOfCover, int areaOfNoCover) {
        this.numOfFloors = numOfFloors;
        this.areaOfFloor = areaOfFloor;
        this.areaOfTum = areaOfTum;
        this.areaOfFlower = areaOfFlower;
        this.areaOfLam = areaOfLam;
        this.areaOfCover = areaOfCover;
        this.areaOfNoCover = areaOfNoCover;
        this.substructure = substructure;
        this.typeOfWall = typeOfWall;
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
    
    // Tính tổng diện tích sàn thi công
    // = Diện tích sàn + Diện tích móng + Diện tích mái
    public double totalConstructionArea() {
        return areaOfFloor*numOfFloors + areaOfTum + substructureArea() + ceilingArea();
    }
    
    // Tính diện tích móng nhà
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
    
    // Tính diện tích mái/sân thượng
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
    
    // Ước lượng diện tích tường nhà
    public double wallArea() {
        double area = 0;
        double minPerimeter = 4*Math.sqrt(areaOfFloor);
        double maxPerimeter = 2*(6 + areaOfFloor/6);
        
        area = (minPerimeter + maxPerimeter)*numOfFloors*HouseConstant.CHIEU_CAO_MOI_TANG/2/3*4;
        return area;
    }
    
    // Tính thể tích vữa bê tông cốt thép
    public double concreteVolume() {
        double totalConstructionArea = totalConstructionArea();
        return totalConstructionArea*HouseConstant.DO_DAY_SAN;
    }
    
    // Tính thể tích vữa xây tường
    public double mortarVolume() {
        double volume = 0;
        switch (typeOfWall) {
            case HouseConstant.TUONG_10:
                volume = wallArea()*HouseConstant.VUA_TUONG_10;
                break;
            case HouseConstant.TUONG_20:
                volume = wallArea()*HouseConstant.VUA_TUONG_20;
                break;
            case HouseConstant.TUONG_30:
                volume = wallArea()*HouseConstant.VUA_TUONG_30;
                break;
        }
        return volume*3;
    }
    
    // Tính khối lượng xi măng (tấn)
    public double cementMass() {
        return Math.round((concreteVolume()*HouseConstant.XI_MANG_BETONG_250 + mortarVolume()*HouseConstant.XI_MANG_XAYTO)/1000);
    }
    
    // Tính thể tích đá dăm (m3)
    public double rockVolume() {
        return Math.round(concreteVolume()*HouseConstant.DA_DAM_BETONG_250);
    }
    
    // Tính thể tích cát vàng (m3)
    public double sandVolume() {
        return Math.round(concreteVolume()*HouseConstant.CAT_VANG_BETONG_250 + mortarVolume()*HouseConstant.CAT_VANG_XATTO);
    }
    
    // Tính khối lượng sắt thép (kg)
    public double steelMass() {
        double substructorVolume = substructureArea()*HouseConstant.DO_DAY_SAN;
        double floorVolume = (totalConstructionArea() - substructureArea())*HouseConstant.DO_DAY_SAN;
        return Math.round(substructorVolume*HouseConstant.THEP_DAM_MONG + floorVolume*HouseConstant.THEP_SAN);
//        return substructureArea()*HouseConstant.THEP_DAM_MONG + (totalConstructionArea() - substructureArea())*HouseConstant.THEP_SAN;
    }
    
    // Tính số lượng viên gạch xây tường
    public int numberOfBricks() {
        int total = 0;
        switch (typeOfWall) {
            case HouseConstant.TUONG_10:
                total = (int) wallArea()*HouseConstant.GACH_TUONG_10;
                break;
            case HouseConstant.TUONG_20:
                total = (int) wallArea()*HouseConstant.GACH_TUONG_20;
                break;
            case HouseConstant.TUONG_30:
                total = (int) wallArea()*HouseConstant.GACH_TUONG_30;
                break;
        }
        return total;
    }
    
    // Tính số lượng ngói lợp
    public int numberOfTiles() {
        double side = Math.sqrt(areaOfFloor);
        double areaOfRoof = 2*(side*Math.sqrt(2*2 + (side/2)*(side/2)));
        return (int) (areaOfRoof/HouseConstant.DIEN_TICH_NGOI_LOP);
    } 
}
