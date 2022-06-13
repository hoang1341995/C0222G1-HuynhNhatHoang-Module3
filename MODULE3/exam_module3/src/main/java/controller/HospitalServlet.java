package controller;

import model.Hospital;
import service.IHospitalService;
import service.impl.HospitalServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "HospitalServlet", value = "/danh-sach")
public class HospitalServlet extends HttpServlet {
    IHospitalService hospitalService = new HospitalServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listHospital(request,response);

    }

    private void listHospital(HttpServletRequest request, HttpServletResponse response) {
        List<Hospital> hospitalList = hospitalService.selectAll();
        request.setAttribute("hospitalList", hospitalList);
        try {
            request.getRequestDispatcher("/view/danh_sach_benh_nhan.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                editService(request, response);
                break;
            case "delete":
                deleteService(request, response);
                break;
            default:
                listHospital(request, response);
                break;
        }
    }

    private void editService(HttpServletRequest request, HttpServletResponse response) {
        Hospital hospital = new Hospital();
        hospital.setIdBenhNhan(Integer.parseInt(request.getParameter("idBenhNhan")));
        hospital.setMaBenhAn(request.getParameter("maBenhAn"));
        hospital.setMaBenhNhan(request.getParameter("maBenhNhan"));
        hospital.setTenBenhNhan(request.getParameter("tenBenhNhan"));
        hospital.setNgayNhapVien(request.getParameter("ngayNhapVien"));
        hospital.setNgayRaVien(request.getParameter("ngayRaVien"));
        hospital.setLyDoNhapVien(request.getParameter("lyDoNhapVien"));


        Map<String,String> mapRegexUpdate = hospitalService.update(hospital);

        if (mapRegexUpdate.isEmpty()){
            request.setAttribute("message", "Sửa bênh án thành công");
            request.setAttribute("openModalMessage","$('#message').modal();");
        }else {
            request.setAttribute("errorEdit",mapRegexUpdate);
            request.setAttribute("hospital",hospital);
            request.setAttribute("openModalEdit","$('#edit').modal();");
        }

        List<Hospital> hospitalList = hospitalService.selectAll();
        request.setAttribute("hospitalList", hospitalList);
        try {
            request.getRequestDispatcher("/view/danh_sach_benh_nhan.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("idDelete"));

        if (hospitalService.deleteById(id)) {
            request.setAttribute("message", "Xoá thành công");
            request.setAttribute("openModalMessage","$('#message').modal();");
        }else{
            request.setAttribute("error", "Xoá không thành công");
            request.setAttribute("openModalMessage","$('#message').modal();");
        }
        List<Hospital> hospitalList = hospitalService.selectAll();
        request.setAttribute("hospitalList", hospitalList);
        try {
            request.getRequestDispatcher("/view/danh_sach_benh_nhan.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
