CREATE SCHEMA IF NOT EXISTS "bic";

CREATE  TABLE "bic".dim_account (
	account_id           INT  NOT NULL  ,
	bic_number           INT    ,
	account_name         VARCHAR(100)    ,
	account_type         VARCHAR(255)    ,
	CONSTRAINT pk_dim_account PRIMARY KEY ( account_id )
 );

CREATE  TABLE "bic".dim_date (
	date_id              INT  NOT NULL  ,
	date_original        DATE    ,
	date_iso             DATE    ,
	"year"               INT    ,
	quarter              INT    ,
	"month"              INT    ,
	CONSTRAINT pk_dim_date PRIMARY KEY ( date_id )
 );

CREATE  TABLE "bic".dim_location (
	location_id          INT  NOT NULL  ,
	borough              VARCHAR(255)    ,
	latitude             Decimal    ,
	longtitude           Decimal    ,
	CONSTRAINT pk_dim_location PRIMARY KEY ( location_id )
 );

CREATE  TABLE "bic".dim_violation (
	violation_id         INT  NOT NULL  ,
	type_violation       VARCHAR(255)    ,
	violation_number     VARCHAR(255)    ,
	violation_phase      VARCHAR(255)    ,
	CONSTRAINT pk_dim_violation PRIMARY KEY ( violation_id )
 );

CREATE  TABLE "bic".facts_fine (
	fact_id              BIGINT  NOT NULL  ,
	fine_amount          DECIMAL(10,2)    ,
	maximum_fine         DECIMAL(10,2)    ,
	violation_number     VARCHAR(255)    ,
	location_id          INT  NOT NULL  ,
	date_id              INT    ,
	violation_id         INT    ,
	account_id           INT    ,
	CONSTRAINT pk_facts_fine PRIMARY KEY ( fact_id, location_id )
 );

CREATE UNIQUE INDEX unq_account_id ON "bic".facts_fine ( account_id );

CREATE UNIQUE INDEX unq_violation_id ON "bic".facts_fine ( violation_id );

CREATE UNIQUE INDEX unq_date_id ON "bic".facts_fine ( date_id );

CREATE UNIQUE INDEX unq_location_id ON "bic".facts_fine ( location_id );

ALTER TABLE "bic".facts_fine ADD CONSTRAINT fk_facts_fine_dim_account FOREIGN KEY ( account_id ) REFERENCES "bic".dim_account( account_id );

ALTER TABLE "bic".facts_fine ADD CONSTRAINT fk_facts_fine_dim_violation FOREIGN KEY ( violation_id ) REFERENCES "bic".dim_violation( violation_id );

ALTER TABLE "bic".facts_fine ADD CONSTRAINT fk_facts_fine_dim_date FOREIGN KEY ( date_id ) REFERENCES "bic".dim_date( date_id );

ALTER TABLE "bic".facts_fine ADD CONSTRAINT fk_facts_fine_dim_location FOREIGN KEY ( location_id ) REFERENCES "bic".dim_location( location_id );
