package com.rentcar.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rentcar.entity.Booking;
import com.rentcar.entity.Vehicle;
import com.rentcar.service.BookingService;
import com.rentcar.service.VehicleService;

import jakarta.validation.Valid;

@Controller
public class AdminPanelController {

	@Autowired
	VehicleService vehicleService;
	
	@Autowired
	BookingService bookingService;

	@RequestMapping("index")
	public String gotoHomePage() {
		return "index";
	}

	@RequestMapping("manageVehicle")
	public String gotoManageVehiclePage(ModelMap modelMap) {
		ArrayList<Vehicle> vehicleList = vehicleService.findAllVehicle();
		modelMap.put("vehicles", vehicleList);
		return "manageVehicle";
	}

	@RequestMapping(value = "addVehicle", method = RequestMethod.GET)
	public String addNewVehicle(ModelMap modelMap) {
		Vehicle vehicle = new Vehicle("",0,0,"");
		modelMap.put("vehicle", vehicle);
		return "addVehicle";
	}

	@RequestMapping(value = "/addVehicle", method = RequestMethod.POST)
	public String addNewVehiclePost(@Valid Vehicle vehicle,BindingResult result, ModelMap modelMap) {
		if(result.hasErrors()) {
			return "addVehicle";
		}
		vehicleService.addVehicle(vehicle);
		return "redirect:manageVehicle";
	}

	@RequestMapping(value = "/deleteVehicle")
	public String deleteVehicle(@RequestParam int id, ModelMap modelMap) {
		try {
			vehicleService.deleteVehicleById(id);
			return "redirect:manageVehicle";
		}catch (Exception e) {
			modelMap.put("error", "You can not delete this vahicle because this vehicle is already booked.");
			return "displayException";
		}
		
	}
	
	@RequestMapping(value = "updateVehicle",method = RequestMethod.GET)
	public String UpdateVehicle(@RequestParam int id,ModelMap modelMap) {
		Vehicle vehicle = vehicleService.findVehicleUsingId(id);
		modelMap.put("vehicle", vehicle);
		return "updateVehicle";
	}
	@RequestMapping(value = "updateVehicle",method = RequestMethod.POST)
	public String UpdateVehiclePost(@Valid Vehicle vehicle,BindingResult result, ModelMap modelMap) {
		if(result.hasErrors()) {
			return "updateVehicle";
		}
		
		vehicleService.UpdateVehicleDetail(vehicle);
		return "redirect:manageVehicle";
	}
	
	@RequestMapping(value = "adminBookingStatus")
	public String seeBookingDetailsAndStatus(ModelMap modelMap) {
		ArrayList<Booking> bookingList = bookingService.findAllBookingList();
		modelMap.put("bookingList",bookingList);
		return "adminBookingStatus";
	}
	
	@RequestMapping("changeStatus")
	public String changePaymentStatusForBooking(@RequestParam int id,@RequestParam String status) {
		bookingService.changePaymentStatus(id,status);
		return "redirect:adminBookingStatus";
	}
	
	@RequestMapping("displayException")
	public String displayError() {
		return "displayException";
	}
}
