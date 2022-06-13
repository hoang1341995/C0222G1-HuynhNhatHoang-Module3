package regex;

public class Regex {
    public static final String REGEX_NAME = "^[\\p{Lu}\\p{Ll}\\s]+$";
    public static final String REGEX_DATE = "^((((19|[2-9]\\d)\\d{2})\\-(0[13578]|1[02])\\-(0[1-9]|[12]\\d|3[01]))|(((19|[2-9]\\d)\\d{2})\\-(0[13456789]|1[012])\\-(0[1-9]|[12]\\d|30))|(((19|[2-9]\\d)\\d{2})\\-02\\-(0[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))\\-02\\-29))$";
    public static final String REGEX_BN ="^BN(\\-)[0-9]{3}$";
    public static final String REGEX_BA ="^BA(\\-)[0-9]{3}$";
}
