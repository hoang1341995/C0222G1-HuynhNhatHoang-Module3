package repository.impl;

import model.Hospital;
import repository.DAO;
import repository.IHospitalRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class HospitalRepoImpl implements IHospitalRepo {
    private static final String SELECT_ALL = "SELECT *,ma_benh_an FROM benh_nhan bn " +
            " join benh_an ba on bn.id_benh_an = ba.id_benh_an WHERE delete_benh_nhan = 0;";

    private static final String DELETE = "UPDATE benh_nhan SET delete_benh_nhan = '1' WHERE (id_benh_nhan = ?);";
    private static final String UPDATE = "UPDATE benh_nhan SET `ten_benh_nhan` = ?, `ngay_nhap_vien` = ?, `ngay_ra_vien` = ?, `ly_do_nhap_vien` = ? WHERE (`id_benh_nhan` = ?);";

    DAO dao  = new DAO();
    @Override
    public List<Hospital> selectAll() {
        List<Hospital> hospitalList = new ArrayList<>();
        Connection connection = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Hospital hospital = new Hospital();
                hospital.setIdBenhAn(rs.getInt("id_benh_an"));
                hospital.setMaBenhAn(rs.getString("ma_benh_an"));
                hospital.setIdBenhNhan(rs.getInt("id_benh_nhan"));
                hospital.setMaBenhNhan(rs.getString("ma_benh_nhan"));
                hospital.setTenBenhNhan(rs.getString("ten_benh_nhan"));
                hospital.setNgayNhapVien(rs.getString("ngay_nhap_vien"));
                hospital.setNgayRaVien(rs.getString("ngay_nhap_vien"));
                hospital.setLyDoNhapVien(rs.getString("ly_do_nhap_vien"));

                hospitalList.add(hospital);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hospitalList;
    }

    @Override
    public void update(Hospital hospital) {
        Connection connection  = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE);
            ps.setString(1, hospital.getTenBenhNhan());
            ps.setString(2, hospital.getNgayNhapVien());
            ps.setString(3, hospital.getNgayRaVien());
            ps.setString(4, hospital.getLyDoNhapVien());
            ps.setInt(5, hospital.getIdBenhNhan());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean deleteById(Integer id) {
        boolean flag = false;
        Connection connection = dao.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE);
            ps.setInt(1, id);
            flag = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public List<Hospital> getBenhAn() {
        return null;
    }
}
