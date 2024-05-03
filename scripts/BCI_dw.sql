CREATE SCHEMA INSTANCE;

CREATE TABLE `BIC Violation_dw_lgl(logical)`.INSTANCE.dim_account ( 
	account_id int64 NOT NULL  ,
	BIC_number int64  ,
	account_name string  ,
	account_type string  
 );

ALTER TABLE `BIC Violation_dw_lgl(logical)`.INSTANCE.dim_account ADD PRIMARY KEY ( account_id )  NOT ENFORCED;

CREATE TABLE `BIC Violation_dw_lgl(logical)`.INSTANCE.dim_date ( 
	date_id int64 NOT NULL  ,
	Date_original date  ,
	date_Iso datetime  ,
	year int64  ,
	quarter int64  ,
	month int64  
 );

ALTER TABLE `BIC Violation_dw_lgl(logical)`.INSTANCE.dim_date ADD PRIMARY KEY ( date_id )  NOT ENFORCED;

CREATE TABLE `BIC Violation_dw_lgl(logical)`.INSTANCE.dim_location ( 
	location_id int64 NOT NULL  ,
	borough string  ,
	Latitude bignumeric  ,
	Longtitude bignumeric  
 );

ALTER TABLE `BIC Violation_dw_lgl(logical)`.INSTANCE.dim_location ADD PRIMARY KEY ( location_id )  NOT ENFORCED;

CREATE TABLE `BIC Violation_dw_lgl(logical)`.INSTANCE.dim_violation ( 
	violation_id int64 NOT NULL  ,
	type_violation string  ,
	violation_number string  ,
	violation_phase string  
 );

ALTER TABLE `BIC Violation_dw_lgl(logical)`.INSTANCE.dim_violation ADD PRIMARY KEY ( violation_id )  NOT ENFORCED;

CREATE TABLE `BIC Violation_dw_lgl(logical)`.INSTANCE.facts_fine ( 
	fact_id int64 NOT NULL  ,
	fine_amount numeric(10,2)  ,
	maximum_fine numeric(10,2)  ,
	violation_number string  ,
	location_id int64 NOT NULL  ,
	date_id int64  ,
	violation_id int64  ,
	account_id int64  
 );

ALTER TABLE `BIC Violation_dw_lgl(logical)`.INSTANCE.facts_fine ADD PRIMARY KEY ( fact_id, location_id )  NOT ENFORCED;

ALTER TABLE `BIC Violation_dw_lgl(logical)`.INSTANCE.facts_fine ADD CONSTRAINT fk_facts_fine_dim_account FOREIGN KEY ( account_id ) REFERENCES `BIC Violation_dw_lgl(logical)`.INSTANCE.dim_account( account_id ) NOT ENFORCED;

ALTER TABLE `BIC Violation_dw_lgl(logical)`.INSTANCE.facts_fine ADD CONSTRAINT fk_facts_fine_dim_violation FOREIGN KEY ( violation_id ) REFERENCES `BIC Violation_dw_lgl(logical)`.INSTANCE.dim_violation( violation_id ) NOT ENFORCED;

ALTER TABLE `BIC Violation_dw_lgl(logical)`.INSTANCE.facts_fine ADD CONSTRAINT fk_facts_fine_dim_date FOREIGN KEY ( date_id ) REFERENCES `BIC Violation_dw_lgl(logical)`.INSTANCE.dim_date( date_id ) NOT ENFORCED;

ALTER TABLE `BIC Violation_dw_lgl(logical)`.INSTANCE.facts_fine ADD CONSTRAINT fk_facts_fine_dim_location FOREIGN KEY ( location_id ) REFERENCES `BIC Violation_dw_lgl(logical)`.INSTANCE.dim_location( location_id ) NOT ENFORCED;
