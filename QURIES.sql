CREATE TABLE Branch(BranchId varchar(25) not null, 
                    Branch_Name varchar(255), 
		    Region varchar(25), 
		    District varchar(25), 
		    primary key(BranchId));
					


create table Employees(EmployeeId varchar(25) NOT NULL,
                       FirstName varchar(25), 
		       LastName varchar(25), 
		       Gender varchar(1), 
		       Email varchar(25), 
		       Region varchar(25), 
		       District varchar(25), 
		       BranchId varchar(25) NOT NULL, 
		       Employee_Type ENUM('Manager', 'Support Staff') NOT NULL,
		       PRIMARY KEY(EmployeeId),
		       FOREIGN KEY(BranchId) REFERENCES Branch(branchId));
					   

create table Manager(EmployeeId varchar(25) NOT NULL,
                     Allowance int NOT NULL,
                     primary key(employeeId),
                     FOREIGN KEY (employeeId) REFERENCES Employees(employeeId));
					 
create table Support_Staff(EmployeeId varchar(25) not null,
                          Job_title varchar(25), 
			  primary key(employeeId), 
			  FOREIGN KEY(employeeId) REFERENCES Employees(employeeId));

create table customer(CustomerId varchar(25) NOT NULL, 
                      Telephone varchar(25) NOT NULL, 
		      Region varchar(25), 
		      District varchar(25),
                      Customer_Type ENUM('Individual','Organisation') NOT NULL DEFAULT 'individual',					  
		      primary key(customerId)); 
					   

create table individual(CustomerId varchar(25) not null, 
                        First_Name varchar(25) not null, 
			Last_Name varchar(25) not null, 
			Gender varchar(1) not null, 
			Birth_Date DATE, 
			primary key(CustomerId), 
			FOREIGN KEY(CustomerId) REFERENCES customer(customerId));
						
						


create table organization(customerId varchar(25) not null, 
                          TIN varchar(25) not null, 
                          Name varchar(255) not null, 
			  Org_Type varchar(25), 
			  primary key(customerId), 
			  FOREIGN KEY(customerId) REFERENCES customer(customerId));


create table Loan(LoanId varchar(25) not null, 
                  Principal int, 
		  Duration varchar(25), 
		  Interest varchar(25), 
		  Loan_Date DATE, 
		  CustomerId varchar(25), 
		  BranchId varchar(25), 
		  primary key(loanId), 
		  foreign key(CustomerId) references customer(customerId), 
		  FOREIGN KEY(BranchId) references Branch(branchId));


create table Payment(Receipt_No varchar(25) not null, 
                     Amount int not null,
		     Payment_Date DATE, 
		     Description varchar(100), 
		     LoanId varchar(25), 
		     primary key(Receipt_No), 
		     foreign key(loanId) references Loan(loanId));
					 

