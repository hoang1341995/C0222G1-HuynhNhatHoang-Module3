package service;

import model.Hospital;

import java.util.List;
import java.util.Map;

public interface IHospitalService {

    List<Hospital> selectAll();

    Map<String, String>  update(Hospital hospital);

    boolean deleteById(Integer id);

    List<Hospital> getBenhAn();

}
