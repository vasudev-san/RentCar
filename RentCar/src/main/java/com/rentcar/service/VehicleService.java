package com.rentcar.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rentcar.entity.Vehicle;
import com.rentcar.repository.VehicleRepository;

@Service
public class VehicleService {
	@Autowired
	VehicleRepository vehicleRepository;
	 
	
	public void addVehicle(Vehicle vehicle) {
		vehicleRepository.save(vehicle); 
	}

	public ArrayList<Vehicle> findAllVehicle() {
        return vehicleRepository.findAll();
    }
	public void deleteVehicleById(int id) {
		vehicleRepository.deleteById(id);
	}

	public Vehicle findVehicleUsingId(int id) {
		Vehicle vehicle = vehicleRepository.findById(id).get();
		return vehicle;
	}

	
	public void UpdateVehicleDetail(Vehicle vehicle) {
        Vehicle existingVehicle = vehicleRepository.findById(vehicle.getVehicleId()).orElse(null);
        if (existingVehicle != null) {
            existingVehicle.setModel(vehicle.getModel());
            existingVehicle.setCapacity(vehicle.getCapacity());
            existingVehicle.setRatePerDay(vehicle.getRatePerDay());
            existingVehicle.setLicensePlate(vehicle.getLicensePlate());
            vehicleRepository.save(existingVehicle);
        }
    }
}
