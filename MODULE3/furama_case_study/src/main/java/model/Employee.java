package model;

public class Employee extends Person {
    private Double salary;
    private Integer positionId;
    private Integer educationId;
    private  Integer divisionId;
    private String positionValue;
    private String educationValue;
    private  String divisionValue;
    private  String username;
    private  String password;

    public Employee() {
    }

    public Employee(Integer id, String name, String birthday, String idCard, Double salary, String phone,
                    String email, String address, Integer positionId, Integer educationId, Integer divisionId,
                    String positionValue,String educationValue,String divisionValue,String username,String password) {
        super(id, name, birthday, idCard, phone, email, address);
        this.salary = salary;
        this.positionId = positionId;
        this.educationId = educationId;
        this.divisionId = divisionId;
        this.positionValue = positionValue;
        this.educationValue = educationValue;
        this.divisionValue = divisionValue;
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public Integer getEducationId() {
        return educationId;
    }

    public void setEducationId(Integer educationId) {
        this.educationId = educationId;
    }

    public Integer getDivisionId() {
        return divisionId;
    }

    public void setDivisionId(Integer divisionId) {
        this.divisionId = divisionId;
    }

    public String getPositionValue() {
        return positionValue;
    }

    public void setPositionValue(String positionValue) {
        this.positionValue = positionValue;
    }

    public String getEducationValue() {
        return educationValue;
    }

    public void setEducationValue(String educationValue) {
        this.educationValue = educationValue;
    }

    public String getDivisionValue() {
        return divisionValue;
    }

    public void setDivisionValue(String divisionValue) {
        this.divisionValue = divisionValue;
    }
}