package model;
public class Employeeee extends Person {
    private Double salary;
    private Integer positionId;
    private Integer educationId;
    private  Integer divisionId;

    public Employeeee() {
    }
    public Employeeee(String name, String birthday, String idCard, Double salary, String phone,
                    String email, String address, Integer positionId, Integer educationId, Integer divisionId) {
        super(name, birthday, idCard, phone, email, address);
        this.salary = salary;
        this.positionId = positionId;
        this.educationId = educationId;
        this.divisionId = divisionId;
    }

    public Employeeee(Integer id, String name, String birthday, String idCard, Double salary, String phone,
                    String email, String address, Integer positionId, Integer educationId, Integer divisionId) {
        super(id, name, birthday, idCard, phone, email, address);
        this.salary = salary;
        this.positionId = positionId;
        this.educationId = educationId;
        this.divisionId = divisionId;
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
}
