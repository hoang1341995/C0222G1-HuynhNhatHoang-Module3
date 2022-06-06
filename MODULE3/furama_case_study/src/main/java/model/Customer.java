package model;

public class Customer extends Person {
    private  String code;
    private Integer gender;
    private Integer customerTypeId;

    public Customer() {
    }

    public Customer(Integer id,
                    String code,
                    String name,
                    String birthday,
                    Integer gender,
                    String idCard,
                    String phone,
                    String email,
                    String address,
                    Integer customerTypeId) {
        super(id, name, birthday, idCard, phone, email, address);
        this.code = code;
        this.gender = gender;
        this.customerTypeId = customerTypeId;
    }


    public Customer(String code, String name, String birthday,Integer gender, String idCard, String phone, String email, String address,  Integer customerTypeId) {
        super( name, birthday, idCard, phone, email, address);
        this.code = code;
        this.gender = gender;
        this.customerTypeId = customerTypeId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Integer getCustomerTypeId() {
        return customerTypeId;
    }

    public void setCustomerTypeId(Integer customerTypeId) {
        this.customerTypeId = customerTypeId;
    }
}