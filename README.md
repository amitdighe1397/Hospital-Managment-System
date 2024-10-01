# Hospital Management System

This Hospital Management System (HMS) is designed to streamline the operations of healthcare institutions, including hospitals and clinics.
The system provides comprehensive functionalities for managing patient records, appointments, billing, staff management, inventory, and more. 
Built with a focus on efficiency and user-friendly interfaces, the HMS aims to improve the overall patient experience and administrative workflow. 

## Features

- **Patient Management:** Register new patients, maintain detailed patient records, track patient history, and manage appointments.
- **Appointment Scheduling:** Simplify the process of scheduling, rescheduling, and canceling appointments with a dynamic calendar interface.
- **Billing and Invoicing:** Automated billing processes with detailed invoice generation and payment tracking.
- **Staff Management:** Manage staff details, shift schedules, and payroll efficiently.
- **Inventory Management:** Keep track of medical supplies, equipment, and other inventory items to ensure availability and avoid stockouts.
- **Reporting and Analytics:** Generate insightful reports and analytics to aid in decision-making and improve operational efficiency.

## Technologies Used

- **Frontend:** HTML, Bootstrap
- **Backend:** Java 17, JSP
- **Database:** MySQL
- **Authentication:** JWT, OAuth

## Prerequisites

- Java 17
- Apache Tomcat
- MySQL
- Maven

## Getting Started

To get started with the Hospital Management System, follow these steps:

### Clone the Repository

```bash
git clone https://github.com/amitdighe1397/Hospital-Managment-System.git
cd hospital-management-system
CREATE DATABASE hospital_management;
CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `appoinDate` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phNo` varchar(45) NOT NULL,
  `diseases` varchar(45) NOT NULL,
  `doctorId` int NOT NULL,
  `address` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`user_id`),
  KEY `did_idx` (`doctorId`),
  CONSTRAINT `did` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `quoli` varchar(45) NOT NULL,
  `spec` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobno` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `specialist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `student` (
  `id` bigint NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `prn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user_dtls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `student_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

