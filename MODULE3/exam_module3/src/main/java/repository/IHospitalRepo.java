package repository;

import model.Hospital;

import java.util.List;
import java.util.Map;

public interface IHospitalRepo {
    List<Hospital> selectAll();

    void update(Hospital hospital);

    boolean deleteById(Integer id);

    List<Hospital> getBenhAn();
}
