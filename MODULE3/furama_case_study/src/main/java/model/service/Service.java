package model.service;

public class Service {
    private Integer id;
    private String code;
    private String name;
    private Double area;
    private Double serviceCost;
    private Integer maxPeople;
    private Integer rentTypeId; //table
    private String rentTypeValue;
    private Integer serviceTypeId; //table
    private String serviceTypeValue;
    private String standardRoom;
    private String description;
    private Double poolArea;
    private Integer numberFloors;

    public Service() {
    }

    public Service(Integer id,
                   String code,
                   String name,
                   Double area,
                   Double serviceCost,
                   Integer maxPeople,
                   Integer rentTypeId,
                   String rentTypeValue,
                   Integer serviceTypeId,
                   String serviceTypeValue,
                   String standardRoom,
                   String description,
                   Double poolArea,
                   Integer numberFloors) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.area = area;
        this.serviceCost = serviceCost;
        this.maxPeople = maxPeople;
        this.rentTypeId = rentTypeId;
        this.rentTypeValue = rentTypeValue;
        this.serviceTypeId = serviceTypeId;
        this.serviceTypeValue = serviceTypeValue;
        this.standardRoom = standardRoom;
        this.description = description;
        this.poolArea = poolArea;
        this.numberFloors = numberFloors;
    }

    public Double getServiceCost() {
        return serviceCost;
    }

    public void setServiceCost(Double serviceCost) {
        this.serviceCost = serviceCost;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Integer getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(Integer maxPeople) {
        this.maxPeople = maxPeople;
    }

    public Integer getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(Integer rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public String getRentTypeValue() {
        return rentTypeValue;
    }

    public void setRentTypeValue(String rentTypeValue) {
        this.rentTypeValue = rentTypeValue;
    }

    public Integer getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(Integer serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public String getServiceTypeValue() {
        return serviceTypeValue;
    }

    public void setServiceTypeValue(String serviceTypeValue) {
        this.serviceTypeValue = serviceTypeValue;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(Double poolArea) {
        this.poolArea = poolArea;
    }

    public Integer getNumberFloors() {
        return numberFloors;
    }

    public void setNumberFloors(Integer numberFloors) {
        this.numberFloors = numberFloors;
    }
}
