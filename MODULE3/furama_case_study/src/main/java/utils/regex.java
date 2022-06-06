package utils;

public class regex {
    public static final String REGEX_NAME = "^[\\p{Lu}\\p{Ll}\\s]+$";
    public static final String REGEX_DATE = "^((((19|[2-9]\\d)\\d{2})\\-(0[13578]|1[02])\\-(0[1-9]|[12]\\d|3[01]))|(((19|[2-9]\\d)\\d{2})\\-(0[13456789]|1[012])\\-(0[1-9]|[12]\\d|30))|(((19|[2-9]\\d)\\d{2})\\-02\\-(0[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))\\-02\\-29))$";
    public static final String REGEX_NUMBER = "^[0-9]+$";
    public static final String REGEX_PHONE =   "^(84|0[3|5|7|8|9])+([0-9]{8})$"; //"^((\\(84\\)(\\+))|0)(90|91)+([0-9]{7})$";
    public static final String REGEX_EMAIL = "^[\\w\\-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
    public static final String REGEX_CODE_CUSTOMER ="^KH(\\-)[0-9]{4}$";
    public static final String REGEX_CODE_SERVICE ="^DV(\\-)[0-9]{4}$";
}
