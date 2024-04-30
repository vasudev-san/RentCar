package com.rentcar.controller;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rentcar.entity.Booking;
import com.rentcar.entity.Customer;
import com.rentcar.entity.Vehicle;
import com.rentcar.service.BookingService;
import com.rentcar.service.CustomerService;
import com.rentcar.service.VehicleService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustomerPanelController {
	@Autowired
	VehicleService vehicleService;
	
	@Autowired
	BookingService bookingService;
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping("home")
	public String customerHomePage() {
		return "home";
	}
	@RequestMapping("bookingVehicle")
	public String bookingVehiclePage(ModelMap modelMap) {
		ArrayList<Vehicle> vehicleList = vehicleService.findAllVehicle();
		modelMap.put("vehicleList", vehicleList);
		return "bookingVehicle";
	}
	
	@RequestMapping(value = "bookingVehicleNextPage", method= RequestMethod.GET)
	public String bookingVehicleNextPage(@RequestParam int id,ModelMap modelMap) {
		Vehicle vehicle = vehicleService.findVehicleUsingId(id);
		modelMap.put("vehicle", vehicle);
		return "bookingVehicleNextPage";
	}
	
	@RequestMapping(value = "bookingVehicleNextPage", method= RequestMethod.POST)
	public String bookingVehicleNextPagePost(@RequestParam int id,@RequestParam LocalDate startDate,@RequestParam LocalDate endDate,HttpServletRequest request,ModelMap modelMap) {
		Vehicle vehicle = vehicleService.findVehicleUsingId(id);
		
		if(bookingService.checkVehicleAvailability(vehicle,startDate,endDate)) {
			modelMap.put("error", "This vehicle is not available for given dates");
			return "bookingVehicleNextPage";
		}
		else if(bookingService.checkIfDateIsInPast(startDate,endDate)) {
			modelMap.put("error", "Date should be greater than "+LocalDate.now());
			return "bookingVehicleNextPage";
		}
		else if(bookingService.checkIfStartDateIsGreaterThenEndDate(startDate,endDate)) {
			modelMap.put("error", "Start Date should not be greater than End Date");
			return "bookingVehicleNextPage";
		}
		else {
			int currentCustomerId = (int) request.getSession().getAttribute("currentCustomer");
			double totalCost = bookingService.addBookingDetail(currentCustomerId,id,startDate,endDate,vehicle.getRatePerDay());
			modelMap.put("totalCost", totalCost);
			return "bookingDone";
		}
	}
	
	@RequestMapping("bookings")
	public String displayBookingDetails(ModelMap modelMap,HttpServletRequest request) {
		int currentCustomerId = (int) request.getSession().getAttribute("currentCustomer");
		ArrayList<Booking> bookingList = bookingService.findAllBookingByCustomerId(currentCustomerId);
		
		modelMap.put("bookingList", bookingList);
		return "displayBooking";
	}
	
	@RequestMapping("userAccount")
	public String displayCustomerAccount(HttpServletRequest request,ModelMap modelMap) {
		int currentCustomerId = (int) request.getSession().getAttribute("currentCustomer");
		Customer customer = customerService.fetchCustomerDetail(currentCustomerId);
		modelMap.put("customer", customer);
		return "customerDetail";
	}
}
