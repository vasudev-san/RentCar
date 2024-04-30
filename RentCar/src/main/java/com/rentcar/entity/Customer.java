package com.rentcar.entity;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
public class Customer {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int customerId;

	@NotBlank(message = "*First Name is required")
    private String firstname;

	@NotBlank(message = "*Last Name is required")
    private String lastname;
	

	@NotBlank(message = "*Phone Number is required")
	@Size(min = 10, max = 10,message="*Size should be 10")
    private String phoneNo;
	
    private String gender;

	@NotBlank(message = "*Driving License is required")
    private String drivingLicenseNo;
    
    public Customer() {
    	
    }
	public Customer(String firstname, String lastname, String phoneNo, String gender, String drivingLicenseNo) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.phoneNo = phoneNo;
		this.gender = gender;
		this.drivingLicenseNo = drivingLicenseNo;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDrivingLicenseNo() {
		return drivingLicenseNo;
	}
	public void setDrivingLicenseNo(String drivingLicenseNo) {
		this.drivingLicenseNo = drivingLicenseNo;
	}
	
    
    
}
