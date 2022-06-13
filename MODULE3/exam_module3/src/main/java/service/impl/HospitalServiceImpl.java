package service.impl;

import model.Hospital;
import repository.IHospitalRepo;
import repository.impl.HospitalRepoImpl;
import service.IHospitalService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import static regex.Regex.*;

public class HospitalServiceImpl implements IHospitalService {
    IHospitalRepo hospitalRepo = new HospitalRepoImpl();

    @Override
    public List<Hospital> selectAll() {
        return hospitalRepo.selectAll();
    }

    @Override
    public Map<String, String> update(Hospital hospital) {
        Map<String, String> mapRegexUpdate = new HashMap<>();
        boolean flag = true;
        if (!Pattern.matches(REGEX_NAME,hospital.getTenBenhNhan())){
            flag = false;
            mapRegexUpdate.put("TenBenhNhan","Tên phải viết hoa chữ cái đầu. (vd: Nhật Hoàng)");
        }
        if (hospital.getLyDoNhapVien().equals("")){
            flag = false;
            mapRegexUpdate.put("lyDoNhapVien","Chưa nhập lý do");
        }
        if (flag){
            hospitalRepo.update(hospital);
        }
        return mapRegexUpdate;
    }

    @Override
    public boolean deleteById(Integer id) {
        return hospitalRepo.deleteById(id);
    }

    @Override
    public List<Hospital> getBenhAn() {
        return null;
    }
}
