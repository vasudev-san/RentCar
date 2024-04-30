package com.rentcar.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rentcar.entity.Booking;
import com.rentcar.entity.Customer;
import com.rentcar.entity.Vehicle;
import com.rentcar.repository.BookingRepository;
import com.rentcar.repository.CustomerRepository;
import com.rentcar.repository.VehicleRepository;

@Service
public class BookingService {

	@Autowired
	BookingRepository bookingRepository;

	@Autowired
	CustomerRepository customerRepository;

	@Autowired
	VehicleRepository vehicleRepository;

	public double addBookingDetail(int customerId, int vehicleId, LocalDate startDate, LocalDate endDate,
			double ratePerDay) {
		double totalCost = calculateTotalCost(startDate, endDate, ratePerDay);
		Customer customer = customerRepository.findById(customerId).get();
		Vehicle vehicle = vehicleRepository.findById(vehicleId).get();
		Booking booking = new Booking(customer, vehicle, startDate, endDate, totalCost);
		bookingRepository.save(booking);
		return totalCost;
	}

	public ArrayList<Booking> findAllBookingByCustomerId(int customerId) {
		Customer customer = customerRepository.findById(customerId).get();
		ArrayList<Booking> bookingList = bookingRepository.findByCustomer(customer);
		return bookingList;
	}

	private double calculateTotalCost(LocalDate startDate, LocalDate endDate, double ratePerDay) {
		long numberOfDays = startDate.until(endDate).getDays();
		if(numberOfDays == 0) {
			return ratePerDay;
		}
		return ratePerDay * numberOfDays;
	}

	public ArrayList<Booking> findAllBookingList() {
		ArrayList<Booking> bookingList = bookingRepository.findAll();
		return bookingList;
	}

	public void changePaymentStatus(int bookingId, String paymentStatus) {
		Booking booking = bookingRepository.findById(bookingId).get();
		if (paymentStatus.equals("Paid")) {
			booking.setPaymentStatus("Pending");
		} else {
			booking.setPaymentStatus("Paid");
		}
		bookingRepository.save(booking);
	}

	public boolean checkVehicleAvailability(Vehicle vehicle, LocalDate startDate, LocalDate endDate) {
		List<Booking> bookingList = bookingRepository.findByVehicle(vehicle);
		if (bookingList.isEmpty()) {
			return false;
		} else {
			boolean availability = true;
			for (Booking booking : bookingList) {
				LocalDate startDateFromPreviousBooking = booking.getStartDate();
				LocalDate endDateFromPreviousBooking = booking.getEndDate();

				boolean startDateAvailability = (startDate.isEqual(startDateFromPreviousBooking)
						|| startDate.isAfter(startDateFromPreviousBooking))
						&& (startDate.isEqual(endDateFromPreviousBooking)
								|| startDate.isBefore(endDateFromPreviousBooking));

				boolean endDateAvailability = (endDate.isEqual(startDateFromPreviousBooking)
						|| endDate.isAfter(startDateFromPreviousBooking))
						&& (endDate.isEqual(endDateFromPreviousBooking)
								|| endDate.isBefore(endDateFromPreviousBooking));

				availability = startDateAvailability || endDateAvailability;
				if (!availability) {
					break;
				}
			}
			
			return availability;
		}
	}

	public boolean checkIfDateIsInPast(LocalDate startDate, LocalDate endDate) {
		
		return startDate.isBefore(LocalDate.now()) || startDate.isBefore(LocalDate.now());
	}

	public boolean checkIfStartDateIsGreaterThenEndDate(LocalDate startDate, LocalDate endDate) {
		return startDate.isAfter(endDate);
	}

}
