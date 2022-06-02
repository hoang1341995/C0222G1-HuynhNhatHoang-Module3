package model;

public class Person {
    private int id;
    private String name;
    private String dayOfBirth;
    private String idCard;
    private String gender;
    private String phone;
    private String email;
    private String address;

    public Person() {
    }

    public Person(int id,
                  String name,
                  String dayOfBirth,
                  String idCard,
                  String gender,
                  String phone,
                  String email,
                  String address) {
        this.id = id;
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.idCard = idCard;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(String dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}


