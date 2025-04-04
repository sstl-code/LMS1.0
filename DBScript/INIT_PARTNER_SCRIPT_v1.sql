CREATE TABLE SA_ATTRIBUTE(ATTRIBUTEID SERIAL,ATTRIBUTENAME TEXT,ATTRIBUTETYPE SMALLINT,ATTRIBUTEDATATYPE SMALLINT, MANDATORY SMALLINT,DEFAULTVALUE TEXT,FLOV TEXT,CONSTRAINT SA_ATTRIBUTE_PKEY PRIMARY KEY (ATTRIBUTEID),CONSTRAINT SA_ATTRIBUTE_ATTRIBUTENAME_KEY UNIQUE (ATTRIBUTENAME))|
COMMENT ON COLUMN SA_ATTRIBUTE.ATTRIBUTEID IS 'This field contains the attribute id'|
COMMENT ON COLUMN SA_ATTRIBUTE.ATTRIBUTENAME IS 'This field contains unique attribute name'|
COMMENT ON COLUMN SA_ATTRIBUTE.ATTRIBUTETYPE IS 'This field contains the type of attribute, 1-> Customer, 2-> Product, 3-> Discount, 4-> Tax, 5-> Account Offering Attribute, 6-> Account'|
COMMENT ON COLUMN SA_ATTRIBUTE.ATTRIBUTEDATATYPE IS 'This field contains the datatype of attribute. 1-> Numeric, 2-> Alphanumeric, 3-> Freeflow, 4-> Date'|
COMMENT ON COLUMN SA_ATTRIBUTE.MANDATORY IS 'This field contains the mandatory status of an attribute. 1->Mandatory, 0->Non-mandatory'|
COMMENT ON COLUMN SA_ATTRIBUTE.DEFAULTVALUE IS 'This field contains the default value of an attribute'|
COMMENT ON COLUMN SA_ATTRIBUTE.FLOV IS 'This field contains the FLOV value of an attribute'|
COMMENT ON TABLE SA_ATTRIBUTE IS 'This table contains the attribute master records'|
CREATE TABLE CB_EMAILEVENT(EVENTID INTEGER PRIMARY KEY,EVENTNAME TEXT,SUBJECT TEXT,BODY	TEXT,EMAILSTATUS SMALLINT DEFAULT 1)|
COMMENT ON TABLE CB_EMAILEVENT IS 'This table stores configuration of events for which email to be generated. Initially, ITPL will be provided.'|
COMMENT ON COLUMN CB_EMAILEVENT.EVENTID IS 'Unique identifier of the event.'|
COMMENT ON COLUMN CB_EMAILEVENT.EVENTNAME IS 'Contains Event description.'|
COMMENT ON COLUMN CB_EMAILEVENT.SUBJECT IS 'Contains subject of the email corresponding to the event.'|
COMMENT ON COLUMN CB_EMAILEVENT.BODY IS 'Contains body of the email corresponding to the event.'|
COMMENT ON COLUMN CB_EMAILEVENT.EMAILSTATUS IS 'Contains status of email, whether to send or not, 1->Send/2->Donot send'|
CREATE TABLE CB_EMAILREQUEST(REQUESTID BIGSERIAL,EVENTID INTEGER REFERENCES CB_EMAILEVENT(EVENTID),MODULENAME TEXT,TOEMAILID TEXT,CCEMAILID TEXT,SUBJECT TEXT,BODY TEXT,ATTACHMENTPATH TEXT,ATTACHEDFILENAMELIST TEXT,REQUESTDATETIME TIMESTAMPTZ,PRIORITY INTEGER,SENDRETRYCOUNT INTEGER,FAILUREREASON TEXT,SENDINGDATETIME TIMESTAMPTZ,STATUS SMALLINT, ACTIONTYPE SMALLINT DEFAULT 1, BODYTEXT TEXT)|
COMMENT ON TABLE CB_EMAILREQUEST IS 'This table stores requests for sending email.'|
COMMENT ON COLUMN CB_EMAILREQUEST.REQUESTID IS 'Unique request identifier.'|
COMMENT ON COLUMN CB_EMAILREQUEST.EVENTID IS 'Contains event id, Foreign Key to CB_EMAILEVENT.EVENTID'|
COMMENT ON COLUMN CB_EMAILREQUEST.MODULENAME IS 'Name of the module from where request is made.'|
COMMENT ON COLUMN CB_EMAILREQUEST.TOEMAILID IS 'Receiver Email Address.'|
COMMENT ON COLUMN CB_EMAILREQUEST.CCEMAILID IS 'CC Email Address.'|
COMMENT ON COLUMN CB_EMAILREQUEST.SUBJECT IS 'Contains Email Subject.'|
COMMENT ON COLUMN CB_EMAILREQUEST.BODY IS 'Contains Email Body.'|
COMMENT ON COLUMN CB_EMAILREQUEST.ATTACHMENTPATH IS 'Contains Path from where files to be attached.'|
COMMENT ON COLUMN CB_EMAILREQUEST.ATTACHEDFILENAMELIST IS 'Contains attached filenames in comma separated.'|
COMMENT ON COLUMN CB_EMAILREQUEST.REQUESTDATETIME IS 'Contains the timestamp of when the request is placed.'|
COMMENT ON COLUMN CB_EMAILREQUEST.PRIORITY IS 'Priority for sending email. Highest priority->1'|
COMMENT ON COLUMN CB_EMAILREQUEST.SENDRETRYCOUNT IS 'Number of times retried to send email. MaximumRetryCount as per partner settings.'|
COMMENT ON COLUMN CB_EMAILREQUEST.FAILUREREASON IS 'Error Message while email is not sent.'|
COMMENT ON COLUMN CB_EMAILREQUEST.SENDINGDATETIME IS 'Timestamp when email is sent.'|
COMMENT ON COLUMN CB_EMAILREQUEST.STATUS IS '0->Pending, 1->Sent, 2->Faliure.'|
COMMENT ON COLUMN CB_EMAILREQUEST.ACTIONTYPE IS 'This field stores the action performed on the email record, 1- UnRead, 2-Read, 3-Deleted'|
COMMENT ON COLUMN CB_EMAILREQUEST.BODYTEXT IS 'Email Body without HTML Tags'|
INSERT INTO cb_emailevent (eventid, eventname, subject, body) VALUES (9, 'RESET_PASSWORD', 'Password reset intimation', 'ResetPassword_Email_template.htm')|
INSERT INTO cb_emailevent (eventid, eventname, subject, body) VALUES (11, 'DELETE_USER', 'User deletion intimation', 'Delete_User_template.htm')|
INSERT INTO cb_emailevent (eventid, eventname, subject, body) VALUES (4, 'GENERATE_OTP', 'OTP_Email_Subject.txt', 'OTP_Email_template.htm')|
INSERT INTO cb_emailevent (eventid, eventname, subject, body) VALUES (8, 'CHANGE_PASSWORD', 'Password change intimation', 'ChangePassword_Email_template.htm')|
INSERT INTO cb_emailevent (eventid, eventname, subject, body) VALUES (7, 'LOGIN', 'Partner portal login intimation', 'LogIn_Email_template.htm')|
INSERT INTO cb_emailevent (eventid, eventname, subject, body) VALUES (16, 'CREATE_USER', 'User creation invitation', 'Create_User_template.htm')|
INSERT INTO cb_emailevent (eventid, eventname, subject, body) VALUES (12, 'BLOCK_USER', 'User blocking intimation', 'Block_User_template.htm')|
INSERT INTO cb_emailevent (eventid, eventname, subject, body) VALUES (6, 'SIGNUP_CSR', 'User creation invitation', 'CSR_SignUp_Email_template.htm')|
INSERT INTO cb_emailevent (eventid, eventname, subject, body) VALUES (5, 'SIGNUP', 'Partner signup intimation', 'SignUp_Email_template.htm')|
INSERT INTO cb_emailevent (eventid, eventname, subject, body) VALUES (10, 'UPDATE_USER', 'Update user request', 'Update_User_template.htm')|
INSERT INTO cb_emailevent (eventid, eventname, subject, body) VALUES (17, 'UPDATE_USERROLE', 'Update user role', 'Update_UserRole_Email_template.htm')|
INSERT INTO CB_EMAILEVENT (EVENTID, EVENTNAME, SUBJECT, BODY) VALUES (29, 'CREATE_ADMIN_USER', 'Admin Portal User Creation invitaion', 'Create_AdminUser_template.htm')|
INSERT INTO CB_EMAILEVENT (EVENTID, EVENTNAME, SUBJECT, BODY) VALUES (30, 'FORGOT_PASSWORD_ADMIN_USER', 'Password Change intimation', 'Forgot_Password_AdminUser_template.htm')|
INSERT INTO CB_EMAILEVENT (EVENTID, EVENTNAME, SUBJECT, BODY) VALUES (31, 'CREATE_PARTNER_PROFILE', 'Profile creation intimation', 'Create_Partner_Profile_template.htm')|
INSERT INTO CB_EMAILEVENT (EVENTID, EVENTNAME, SUBJECT, BODY) VALUES (50, 'WORKFLOW_ASSIGNMENT', 'Workflow manual task assigned', 'Workflow_Assignment_Body.htm')|
INSERT INTO CB_EMAILEVENT (EVENTID, EVENTNAME, SUBJECT, BODY) VALUES (506, 'LANDLORD_USER_CREATION','Self Service Account Activation','Landlord_User_Creation.htm')|
CREATE TABLE AT_AUDITDETAILS(USERNAME VARCHAR,ENGINE VARCHAR,EVENTID VARCHAR,EVENT VARCHAR,ACTIVITYINFO TEXT,EVENTTIME TIMESTAMPTZ,USERID VARCHAR, ACCOUNTNO BIGINT)|
COMMENT ON TABLE AT_AUDITDETAILS IS 'This table stores audit trail details'|
COMMENT ON COLUMN AT_AUDITDETAILS.USERNAME IS 'This field contains PARE username'|
COMMENT ON COLUMN AT_AUDITDETAILS.ENGINE IS 'This field contains PARE Engine name'|
COMMENT ON COLUMN AT_AUDITDETAILS.EVENTID IS 'This field contains auto generated event code'|
COMMENT ON COLUMN AT_AUDITDETAILS.EVENT IS 'This field contains PARE action events'|
COMMENT ON COLUMN AT_AUDITDETAILS.ACTIVITYINFO IS 'This field contains audit details'|
COMMENT ON COLUMN AT_AUDITDETAILS.EVENTTIME IS 'This field contains timestamp for the event occurence'|
COMMENT ON COLUMN AT_AUDITDETAILS.USERID IS 'This field contains Modby'|
COMMENT ON COLUMN AT_AUDITDETAILS.ACCOUNTNO IS 'This field contains account number'|
CREATE TABLE cb_partnerprofile(	userid VARCHAR(320), partitionid VARCHAR(30), company_address TEXT, contact_person TEXT, contactno VARCHAR(20), contact_emailid VARCHAR(320), paymentgatewayid INTEGER, paymentgatewayvalue TEXT, taxproviderid INT4 DEFAULT 0, taxproviderconfiguration TEXT NULL)|
COMMENT ON TABLE cb_partnerprofile IS 'This table stores user wise company profile information.'|
COMMENT ON COLUMN cb_partnerprofile.userid IS 'This field contains user id.'|
COMMENT ON COLUMN cb_partnerprofile.partitionid IS 'This field contains partner id.'|
COMMENT ON COLUMN cb_partnerprofile.company_address IS 'This field contains address of company.'|
COMMENT ON COLUMN cb_partnerprofile.contact_person IS 'This field contains contact person name for communication.'|
COMMENT ON COLUMN cb_partnerprofile.contactno IS 'This field contains contact number for communication.'|
COMMENT ON COLUMN cb_partnerprofile.contact_emailid IS 'This field contains contact email id for communication.'|
COMMENT ON COLUMN cb_partnerprofile.paymentgatewayid IS 'This field contains payment gateway identfier.'|
COMMENT ON COLUMN cb_partnerprofile.paymentgatewayvalue IS 'This field contains paymentgateway value'|
COMMENT ON COLUMN cb_partnerprofile.taxproviderid IS 'This field contains tax service provider id. 0 - Internal Tax engine.'|
COMMENT ON COLUMN cb_partnerprofile.taxproviderconfiguration IS 'This field contains configuraation for external tax provider'|
CREATE TABLE tb_sites (	sitecode varchar NULL,	sitename varchar not NULL,	description text NULL,	address varchar not NULL,	region varchar not NULL,	lattitude varchar NULL,	longitude varchar NULL,	siterating varchar NULL,	status int not null,	startdate timestamptz NULL,	stopdate timestamptz NULL,	CONSTRAINT tb_sites_pk PRIMARY KEY (sitecode))|
COMMENT ON TABLE tb_sites IS 'This table contains all site information'|
CREATE TABLE tb_siteattribute (	sitecode varchar NULL,	otherinfo text not NULL,	CONSTRAINT tb_siteattribute_pk PRIMARY KEY (sitecode))|
CREATE TABLE sa_equipmenttypemaster (	equipmenttypeid serial not NULL,	equipmenttype varchar not NULL,	equipmenttypename varchar NULL,	description text NULL,	servicetype int NULL,	CONSTRAINT sa_equipmenttypemaster_un UNIQUE (equipmenttype))|
ALTER TABLE  sa_equipmenttypemaster ADD CONSTRAINT sa_equipmenttypemaster_pk PRIMARY KEY (equipmenttypeid)|
CREATE TABLE sa_vendormaster ( vendorid serial not NULL, vendorname varchar NOT NULL, description text NULL, address text NULL,	status int not NULL,	vendortype smallint not NULL, CONSTRAINT sa_vendor_pk PRIMARY KEY (vendorid))|
CREATE TABLE sa_equipmentvendor (vendorid int2 not NULL, equipmenttypeid int2 not NULL,	inputfileformat text NULL, outputfileformat text NULL, serviceagent varchar NULL, warrantyperiodindays int2 NULL, CONSTRAINT sa_equipmentvendor_pk UNIQUE  (vendorid,equipmenttypeid))|
CREATE TABLE in_equipment (	storeserialno bigserial NOT NULL,	equipmenttypeid int2 NOT NULL,	vendorid int2 NOT NULL,	description text NULL,	equipmentserialno varchar NOT NULL,	storeid int2 NOT NULL,	storelocationid varchar NULL,	creationdate timestamptz NOT NULL,	changedon timestamptz NOT NULL,	status int NOT NULL,	CONSTRAINT in_equipment_pk PRIMARY KEY (storeserialno))|
CREATE TABLE sa_equipmentattribute (	attributeid serial NOT NULL,	attributename text NOT NULL,	equipmenttypeid bigint NOT NULL,	attributedatatype int2 NOT NULL,	mandatory int2 NOT NULL,	defaultvalue text NULL,	flov text NULL,	CONSTRAINT sa_equipmentattribute_pk PRIMARY KEY (attributeid))|
CREATE TABLE in_equipmentattribute (	storeserialno int2 NULL,	otherinfo text not NULL,	CONSTRAINT in_equipmentattribute_pk PRIMARY KEY (storeserialno))|
CREATE TABLE sa_store (	storeid serial NOT NULL,	storename varchar NOT NULL,	address varchar NULL, status int NOT NULL)|
CREATE TABLE sa_storestatus (	statusid serial NOT NULL,	storeid int2 NOT NULL,	statuscode varchar NOT NULL,	statusdesc text NULL,	status smallint NOT NULL)|
CREATE TABLE in_equipmenttransaction (	transactionid bigserial NOT NULL,	storeserialno bigint NOT NULL,	startdate timestamptz NOT NULL,	enddate timestamptz NULL,	storeid int2 NOT NULL,	storelocationid varchar NOT NULL,	status int2 NOT NULL,	modby varchar NOT NULL,	modon timestamptz NOT NULL, remarks text null, recordstatus smallint NULL)|
CREATE TABLE tb_landlord (	landlordid serial NOT NULL,	landlordname varchar NOT NULL,	contactno varchar NOT NULL,	address text NOT NULL,	region varchar NOT NULL,	email varchar NOT NULL,	photo text NULL, status smallint, registrationdate timestamptz)|
COMMENT ON TABLE tb_landlord IS 'This table contains landlord details. It is the master data for all landlords'|
CREATE TABLE tb_landlordattribute(	landlordid int2 NULL,	otherinfo text not NULL,	CONSTRAINT tb_landlordattribute_pk PRIMARY KEY (landlordid))|
COMMENT ON TABLE tb_landlordattribute IS 'This table contains landlord attributes'|
CREATE TABLE tb_sitelandlord (	sitecode varchar not NULL,	landlordid int2 not NULL,	status smallint not NULL,	payoutfrequency smallint NULL,	payoutaamount numeric(20, 6) NULL,	startdate timestamptz NULL,	stopdate timestamptz NULL)|
COMMENT ON TABLE tb_sitelandlord IS 'This table contains site landlord association'|
INSERT INTO sa_store(storeid, storename, address, status) VALUES (9995, 'WAREHOUSE', 'NA', 1)|
INSERT INTO sa_store(storeid, storename, address, status) VALUES (9996, 'SITE', 'NA', 1)|
INSERT INTO sa_store(storeid, storename, address, status) VALUES (9997, 'CUSTOMER', 'NA', 1)|
INSERT INTO sa_store(storeid, storename, address, status) VALUES (9998, 'VENDOR', 'NA', 1)|
INSERT INTO sa_store(storeid, storename, address, status) VALUES (9999, 'TECHNICIAN', 'NA', 1)|
INSERT INTO sa_storestatus(statusid, storeid, statuscode, statusdesc, status)VALUES(2, 9995, 'DEFECTIVE', 'Defective in Warehouse', 1)|
INSERT INTO sa_storestatus(statusid, storeid, statuscode, statusdesc, status)VALUES(3, 9995, 'RETURNED', 'Returned to Warehouse', 1)|
INSERT INTO sa_storestatus(statusid, storeid, statuscode, statusdesc, status)VALUES(10, 9995, 'WRITTENOFF', 'Written Off', 1)|
INSERT INTO sa_storestatus(statusid, storeid, statuscode, statusdesc, status)VALUES(9999, 9995, 'AVAILABLE', 'Available in Warehouse', 1)|
INSERT INTO sa_storestatus(statusid, storeid, statuscode, statusdesc, status)VALUES(4, 9996, 'ACTIVE', 'Active at Site', 1)|
INSERT INTO sa_storestatus(statusid, storeid, statuscode, statusdesc, status)VALUES(5, 9996, 'DEACTIVE', 'Deactive at Site', 1)|
INSERT INTO sa_storestatus(statusid, storeid, statuscode, statusdesc, status)VALUES(6, 9997, 'ACTIVE', 'Active with Customer', 1)|
INSERT INTO sa_storestatus(statusid, storeid, statuscode, statusdesc, status)VALUES(7, 9997, 'DEACTIVE', 'Deactive at Customer', 1)|
INSERT INTO sa_storestatus(statusid, storeid, statuscode, statusdesc, status)VALUES(8, 9998, 'DEFECTIVE', 'Defective at Vendor', 1)|
INSERT INTO sa_storestatus(statusid, storeid, statuscode, statusdesc, status)VALUES(9, 9998, 'RETURNED', 'Returned to Vendor', 1)|
INSERT INTO sa_storestatus(statusid, storeid, statuscode, statusdesc, status)VALUES(13, 9998, 'FIXED', 'Fixed by Vendor', 1)|
INSERT INTO sa_storestatus(statusid, storeid, statuscode, statusdesc, status)VALUES(11, 9999, 'ASSIGNED', 'Assigned to Technician', 1)|
INSERT INTO sa_storestatus(statusid, storeid, statuscode, statusdesc, status)VALUES(12, 9999, 'RETURNED', 'Returned to Technician', 1)|
CREATE TABLE tb_siteagreement (	sitecode varchar NULL,	agreementname varchar NULL,	agreementdate timestamptz NULL,	startdate timestamptz NULL,	enddate timestamptz NULL,	paymentfrequency smallint NULL,	paymentamount numeric(20, 6) NULL,	paymentunit smallint NULL,	agreementid serial NOT NULL, paymentmode smallint NULL,	escalationfrequency smallint NULL,	escalationunit smallint NULL,	escalationamount numeric(20, 6) NULL, status smallint NULL)|
COMMENT ON TABLE tb_siteagreement IS 'This table contains site wise agreement details'|
COMMENT ON COLUMN tb_siteagreement.sitecode IS 'References the site for which the agreement is created'|
COMMENT ON COLUMN tb_siteagreement.agreementname IS 'Name of the agreement'|
COMMENT ON COLUMN tb_siteagreement.agreementdate IS 'Date on which agreement was done'|
COMMENT ON COLUMN tb_siteagreement.startdate IS 'Start Date of the agreement'|
COMMENT ON COLUMN tb_siteagreement.enddate IS 'End Date of the agreement'|
COMMENT ON COLUMN tb_siteagreement.paymentfrequency IS '1 - Weekly, 2-Fortnightly, 3 - Monthly, 4 - Quarterly, 5 - Half-Yearly, 6 - Yearly'|
COMMENT ON COLUMN tb_siteagreement.paymentamount IS 'Site Rent Amount'|
COMMENT ON COLUMN tb_siteagreement.paymentunit IS 'Landlord Payment Type ( 1 - Pecentage, 2 - Fixed)'|
COMMENT ON COLUMN tb_siteagreement.agreementid IS 'ID of the agreement. Unique serial number.'|
COMMENT ON COLUMN tb_siteagreement.paymentmode IS '1 - Advance Paid, 2 - Post-Paid'|
COMMENT ON COLUMN tb_siteagreement.escalationfrequency IS '1- Quarterly, 2 - Half-Yearly, 3 - Yearly'|
COMMENT ON COLUMN tb_siteagreement.escalationunit IS '1 - Pecentage, 2 - Fixed'|
COMMENT ON COLUMN tb_siteagreement.status IS '1 - Active, 0 - Pending, 2 - Deleted, 3 - Archived / Expired,4 - Rejected'|
CREATE TABLE tb_landlordpayments (	paymentid bigserial NOT NULL,	landlordid int4 NULL, 	sitecode varchar NULL, 	amount numeric(20, 6) NULL, 	paymentmode varchar NULL, 	status int2 NULL, 	requestdate timestamptz NULL, 	paymentdate timestamptz NULL,	paymentinstrumentno varchar NULL, 	remarks varchar NULL, 	transactionid varchar NULL, details text NULL)|
COMMENT ON TABLE tb_landlordpayments IS 'This table contains landlord payment records'|
COMMENT ON COLUMN tb_landlordpayments.paymentid IS 'Unique Serial No, identifies a payment record uniquely'|
COMMENT ON COLUMN tb_landlordpayments.landlordid IS 'ID of the landlord for which the payment is raised'|
COMMENT ON COLUMN tb_landlordpayments.sitecode IS 'Site Code for which the payment is raised'|
COMMENT ON COLUMN tb_landlordpayments.amount IS 'Payment amount'|
COMMENT ON COLUMN tb_landlordpayments.paymentmode IS 'Payment Mode'|
COMMENT ON COLUMN tb_landlordpayments.status IS '1 - Initiated, 2 - Posted'|
COMMENT ON COLUMN tb_landlordpayments.requestdate IS 'Date time when the payment request is raised'|
COMMENT ON COLUMN tb_landlordpayments.paymentdate IS 'Date time when the payment is posted'|
COMMENT ON COLUMN tb_landlordpayments.paymentinstrumentno IS 'Bank Account Number to which the payment is posted'|
COMMENT ON COLUMN tb_landlordpayments.remarks IS 'Remarks'|
COMMENT ON COLUMN tb_landlordpayments.transactionid IS 'Transaction Id from bank'|
COMMENT ON COLUMN tb_landlordpayments.details IS 'Details of payment in JSON format'|
CREATE TABLE tb_auditdetails (	username varchar NULL, 	engine varchar NULL, 	eventid varchar NULL,	"event" varchar NULL,	activityinfo text NULL, 	eventtime timestamptz NULL, 	userid varchar NULL, 	entitytype smallint null, 	entityvalue varchar NULL)|
COMMENT ON TABLE tb_auditdetails IS 'This table stores site / asset / landlord event details'|
COMMENT ON COLUMN tb_auditdetails.username IS 'This field contains PARE username'|
COMMENT ON COLUMN tb_auditdetails.engine IS 'This field contains PARE Engine name'|
COMMENT ON COLUMN tb_auditdetails.eventid IS 'This field contains auto generated event code'|
COMMENT ON COLUMN tb_auditdetails."event" IS 'This field contains PARE action events'|
COMMENT ON COLUMN tb_auditdetails.activityinfo IS 'This field contains audit details'|
COMMENT ON COLUMN tb_auditdetails.eventtime IS 'This field contains timestamp for the event occurence'|
COMMENT ON COLUMN tb_auditdetails.userid IS 'This field contains Modby'|
COMMENT ON COLUMN tb_auditdetails.entitytype IS '1 - Site, 2 - Asset, 3 - Landlord'|
COMMENT ON COLUMN tb_auditdetails.entityvalue IS 'SiteCode or Asset Store Serial No or LandlordId bassed on entitytype '|
CREATE TABLE tb_propertyattribute ( sitecode varchar NOT NULL,	otherinfo text NOT NULL, CONSTRAINT tb_propertyattribute_pk PRIMARY KEY (sitecode))|
COMMENT ON TABLE tb_propertyattribute IS 'This table contains the attribute information of properties (sites).'|
COMMENT ON COLUMN tb_propertyattribute.sitecode IS 'Contains the sitecode referencing the site'|
COMMENT ON COLUMN tb_propertyattribute.OTHERINFO IS 'Contains other information, i.e. attributes of sites in JSON format.'|
CREATE TABLE wfm_orders (	instanceid varchar NULL,	enginename varchar NULL,	workflow varchar NULL,	status int2 NULL,	wfmdata text NULL,	entitytype int2 NULL,	entityvalue varchar NULL,	startdate timestamptz NULL,	enddate timestamptz NULL,	createdby varchar NULL,	rating int2 NULL,	remarks text NULL,	rating_user varchar NULL)|
ALTER TABLE sa_store ADD CONSTRAINT sa_store_pk PRIMARY KEY (storeid)|
ALTER TABLE sa_store ADD CONSTRAINT sa_store_un UNIQUE (storename)|
ALTER TABLE tb_landlord ADD CONSTRAINT tb_landlord_pk PRIMARY KEY (landlordid)|
ALTER TABLE sa_storestatus ADD CONSTRAINT sa_storestatus_pk PRIMARY KEY (statusid)|
ALTER TABLE in_equipment ADD CONSTRAINT in_equipment_fk FOREIGN KEY (equipmenttypeid) REFERENCES sa_equipmenttypemaster(equipmenttypeid)|
ALTER TABLE in_equipmentattribute ADD CONSTRAINT in_equipmentattribute_fk FOREIGN KEY (storeserialno) REFERENCES in_equipment(storeserialno)|
ALTER TABLE in_equipmenttransaction ADD CONSTRAINT in_equipmenttransaction_fk FOREIGN KEY (storeserialno) REFERENCES in_equipment(storeserialno)|
ALTER TABLE in_equipmenttransaction ADD CONSTRAINT in_equipmenttransaction_fk_1 FOREIGN KEY (storeid) REFERENCES sa_store(storeid)|
ALTER TABLE in_equipmenttransaction ADD CONSTRAINT in_equipmenttransaction_fk_2 FOREIGN KEY (status) REFERENCES sa_storestatus(statusid)|
ALTER TABLE sa_equipmentattribute ADD CONSTRAINT sa_equipmentattribute_fk FOREIGN KEY (equipmenttypeid) REFERENCES sa_equipmenttypemaster(equipmenttypeid)|
ALTER TABLE sa_equipmentvendor ADD CONSTRAINT sa_equipmentvendor_fk FOREIGN KEY (equipmenttypeid) REFERENCES sa_equipmenttypemaster(equipmenttypeid)|
ALTER TABLE sa_equipmentvendor ADD CONSTRAINT sa_equipmentvendor_vendor_fk FOREIGN KEY (vendorid) REFERENCES sa_vendormaster(vendorid)|
ALTER TABLE sa_storestatus ADD CONSTRAINT sa_storestatus_fk FOREIGN KEY (storeid) REFERENCES sa_store(storeid)|
ALTER TABLE tb_landlordattribute ADD CONSTRAINT tb_landlordattribute_fk FOREIGN KEY (landlordid) REFERENCES tb_landlord(landlordid)|
ALTER TABLE tb_landlordpayments ADD CONSTRAINT tb_landlordpayments_fk FOREIGN KEY (landlordid) REFERENCES tb_landlord(landlordid)|
ALTER TABLE tb_landlordpayments ADD CONSTRAINT tb_landlordpayments_sitecode_fk FOREIGN KEY (sitecode) REFERENCES tb_sites(sitecode)|
ALTER TABLE tb_propertyattribute ADD CONSTRAINT tb_propertyattribute_fk FOREIGN KEY (sitecode) REFERENCES tb_sites(sitecode)|
ALTER TABLE tb_siteagreement ADD CONSTRAINT tb_siteagreement_fk FOREIGN KEY (sitecode) REFERENCES tb_sites(sitecode)|
ALTER TABLE tb_siteattribute ADD CONSTRAINT tb_siteattribute_fk FOREIGN KEY (sitecode) REFERENCES tb_sites(sitecode)|
ALTER TABLE tb_sitelandlord ADD CONSTRAINT tb_sitelandlord_fk FOREIGN KEY (sitecode) REFERENCES tb_sites(sitecode)|
ALTER TABLE tb_sitelandlord ADD CONSTRAINT tb_sitelandlord_fk_1 FOREIGN KEY (landlordid) REFERENCES tb_landlord(landlordid)|
CREATE TABLE tb_payoutinvoice(invoiceid bigserial NOT NULL,agreementid int8 NOT NULL,sitecode varchar NOT NULL,	landlordid int8 NOT NULL,generationdate timestamptz NOT NULL,startdate date NOT NULL,enddate date NOT NULL,amount numeric(20, 2) NOT NULL,"type" int2 NOT NULL DEFAULT 1,modby varchar NOT NULL,modon timestamptz NOT NULL,status int2 NOT NULL DEFAULT 1)|
COMMENT ON COLUMN tb_payoutinvoice.status IS '1 - New, 2 - Exported'|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Contact No 2', 8, 3, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Whatsapp No', 8, 3, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('DOB', 8, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Landlord City', 8, 3, 1, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('State', 8, 5, 1, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('PIN', 8, 3, 1, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Group Entity Name', 8, 5, 0, '', 'Laxmi Telecom,City Realty & Development Pvt Ltd,M/s Flagship Developers Pvt Ltd,JMD Maintenance Service Pvt Ltd,Best International Projectes Pvt Ltd,Bestech India Pvt Ltd,')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('TDS', 8, 2, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('PAN Status', 8, 5, 1, 'Available ', 'Available,Not Available')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('PAN', 8, 2, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('PAN Document', 8, 10, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('MSME Status', 8, 5, 1, 'Applicable', 'Applicable,Not Applicable')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('MSME Document', 8, 10, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('MSME Registration Number', 8, 2, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('MSME Registration Date', 8, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('MSME Category', 8, 5, 0, 'Small', 'Small,Micro,Medium')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('GST Status', 8, 5, 1, 'Available', 'Available,Not Available')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('GST RC Document', 8, 10, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('GST Number', 8, 2, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('SAP Vendor Code', 8, 3, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Bank Account Number Rental', 8, 3, 1, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Beneficiary Name Rental', 8, 3, 1, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('IFSC Code Rental', 8, 2, 1, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Bank Name Rental', 8, 5, 1, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Cancelled Cheque Document', 8, 10, 1, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Additional Bank Required', 8, 5, 0, 'No', 'Yes,No')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Bank Account Number EB', 8, 3, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Beneficiary Name EB', 8, 3, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('IFSC Code EB', 8, 2, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Bank Name EB', 8, 5, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Cancelled Cheque EB Document', 8, 10, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Description', 8, 3, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('City', 7, 3, 1, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Solution Type', 7, 5, 1, 'IBS/OD/ODSC/COW/IBS', 'IBS/OD/ODSC/COW/IBS,OD/IBS,OD,ODSC/Resnet')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('EB Chargeable', 7, 5, 1, 'Chargeable', 'FOC,Chargeable')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Sanction Load', 7, 2, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('SD for Electricity EB Board', 7, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Additional EB Security Deposite', 7, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('EB Invoice Frequency', 7, 5, 0, 'Monthly', 'Monthly,Quarterly,Half-Yearly,Yearly')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Electricity Unit Rate for Submeter', 7, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Land Lord EB NOC', 7, 5, 1, 'Available ', 'Available,Not Available')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('EB NOC Document', 7, 10, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('EB Meter Installation Charges Fixed', 7, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('SD for Electricity Realtor', 7, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Type of Lease Premises', 10, 5, 1, 'Government ', 'Government,Non-Government')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Rent Status', 10, 5, 1, 'All Operator', 'All Operator, Per Operator, Operator Wise, Upto 2 Operator,Upto 3 operator,FOC')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Operators', 10, 7, 0, '{"MultiSelectDefaultValue":"[]"}', '{"MultiSelectOptions":"[\"BSNL\",\"Airtel\",\"RJIO\",\"RJIO2\",\"RJIO3\",\"RJIO6\",\"RJIO10\",\"VODA\"]"}')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Rent Start Date', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Rent Expiry Date', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Rent Frequency', 10, 5, 0, 'Monthly', 'Monthly,Quarterly,Half-Yearly,Yearly')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Rent Amount', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Auto Rentals', 10, 5, 0, 'Yes', 'Yes,No')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Escalation Basis', 10, 5, 0, 'Not Applicable', 'Not Applicable,Agreement Commencement Date , Site Rent Commencement date , Tenant Rent Commencement Date')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Escalation Frequency', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Escalation Percentage', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Escalation Start Date', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Type of Payout', 10, 7, 1, '{"MultiSelectDefaultValue":"[\"Rental\"]"}', '{"MultiSelectOptions":"[\"Rental\",\"EB\",\"DG\",\"AC\",\"Maintenance\",\"BG\",\"SD\",\"EB Security\",\"EB Fixed Charges\",\"EMD\",\"Tender Fee\",\"Revenue\",\"Space Fee\",\"Conservancy Fee\",\"Cam Charges\",\"Interest\",\"Penalty\",\"Credit Note\",\"Debit Note\",\"Municipal Tax\",\"Property Tax\",\"Clamp Charges\",\"Others\"]"}')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Remarks', 10, 3, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Payment Day of Month', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('EMD', 10, 5, 1, 'Applicable ', 'Applicable,Not Applicable')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('EMD Amount', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('BG', 10, 5, 1, 'Applicable ', 'Applicable,Not Applicable')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('BG Amount', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('BG Period', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('BG Claim Period', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Renewal Period Considered in Lease Term', 10, 3, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Rent Paid in Advance', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Security Deposit', 10, 5, 1, 'Applicable ', 'Applicable,Not Applicable')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Security Amount Basis', 10, 5, 0, '', 'Base on Lease Rent ,Fixed Amount')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Security Deposit Applicable', 10, 5, 0, '', 'All Operator,Per Operator')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Security Deposit Month', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Security Deposit Amount', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Security Deposit Date', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('SD Escalation frequency', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('SD Escalation Rate', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('SD Escalation Start Date', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Acquired Space', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Space Charges', 10, 5, 1, 'Applicable ', 'Applicable,Not Applicable')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Space Charges Frequency', 10, 5, 0, '', 'Fixed,Monthly,Quarterly,Half-Yearly,Yearly')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Space Charges Amount', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Space Charge w e f', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Additional Space', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Space Charges Escalation frequency', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Space Charges Escalation Rate', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Space Charges Escalation Start Date', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Maintenance', 10, 5, 1, 'Applicable', 'Applicable,Not Applicable')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Frequency of Maintenance Charges', 10, 5, 0, '', 'Fixed,Monthly,Quarterly,Half-Yearly,Yearly')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Maintenance Charges', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Maintenance Charge w e f', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Maintenance Charges Escalation frequency', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Maintenance Charges Escalation Rate', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Maintenance Charges Escalation Start Date', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Leaky Cable', 10, 5, 1, 'Applicable', 'Applicable,Not Applicable')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Frequency of Leaky Cable Charges', 10, 5, 0, '', 'Fixed,Monthly,Quarterly,Half-Yearly,Yearly')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Leaky Cable Charges', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Leaky Cable Charges w e f', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Leaky Cable Charges Escalation frequency', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Leaky Cable Charges Escalation Rate', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Leaky Cable Charges Escalation Start Date', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Clamp Charges', 10, 5, 1, 'Not Applicable', 'Applicable,Not Applicable')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Frequency of Leaky Clamp Charges', 10, 5, 0, '', 'Fixed,Monthly,Quarterly,Half-Yearly,Yearly')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Clamp Charges Amount', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Clamp Charges w e f', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Clamp Charges Escalation frequency', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Clamp Charges Escalation Rate', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Clamp Charges Escalation Start Date', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Cable Tray Charges', 10, 5, 1, 'Not Applicable', 'Applicable,Not Applicable')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Frequency of Cable Tray Charges', 10, 5, 0, '', 'Fixed,Monthly,Quarterly,Half-Yearly,Yearly')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Cable Tray Charges Amount', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Cable Tray Charges w e f', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Cable Tray Charges Escalation frequency', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Cable Tray Charges Escalation Rate', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Cable Tray Charges Escalation Start Date', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('FCU Charges Fixed', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('FCU Charges Per Month', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Electrical Installation Charges Per Month', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Estimated Expenditure for ARO', 10, 3, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Sub Lease', 10, 5, 0, '', 'Yes,No')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Assignment of the Agreement', 10, 5, 1, 'Applicable ', 'Applicable,Not Applicable')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('SLA Based Termination', 10, 5, 1, 'Applicable ', 'Applicable,Not Applicable')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Interest Charges', 10, 5, 1, 'Applicable ', 'Applicable,Not Applicable')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Termination Period By Landlord', 10, 3, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Termination Penalty to Landlord', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Termination Period by Crest', 10, 3, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Termination Penalty to Crest', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Lock in Period Landlord', 10, 1, 1, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Lock in Period Crest', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('MC PWD Permission', 10, 5, 1, 'Available', 'Available,Not Available')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Agreement Registration', 10, 5, 1, 'Not Available', 'Available,Not Available')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Agreement Registration Amount', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Agreement Registration Date', 10, 4, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Stamp Duty Expenses borne by Landlord', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Stamp Duty Expenses borne by Crest', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Manual Adjustment', 10, 1, 0, '', '')|
INSERT INTO sa_attribute (attributename, attributetype, attributedatatype, mandatory, defaultvalue, flov) VALUES('Agreement 2nd Party Name', 10, 3, 0, '', '')|
INSERT INTO sa_equipmenttypemaster (equipmenttypeid, equipmenttype, equipmenttypename, description, servicetype) VALUES(1, 'Electric Meter', 'Electric Meter', 'Electric Meter', 0)|
INSERT INTO sa_vendormaster (vendorid, vendorname, description, address, status, vendortype) VALUES(1, 'Electric Meter Vendor', 'Dummy Electric Meter Vendor Created for Data Synchronization', 'None', 1, 0)|
INSERT INTO sa_equipmentvendor (vendorid, equipmenttypeid, inputfileformat, outputfileformat, serviceagent, warrantyperiodindays) VALUES(1, 1, '{}', '{}', 'None', NULL)|
INSERT INTO sa_equipmentattribute (attributeid, attributename, equipmenttypeid, attributedatatype, mandatory, defaultvalue, flov) VALUES(1, 'Consumer No', 1, 3, 0, '', '')|
INSERT INTO sa_equipmentattribute (attributeid, attributename, equipmenttypeid, attributedatatype, mandatory, defaultvalue, flov) VALUES(2, 'Meter Category', 1, 5, 1, 'SEB Meter', 'SEB Meter,Sub Meter,Prepaid Meter')|
INSERT INTO sa_equipmentattribute (attributeid, attributename, equipmenttypeid, attributedatatype, mandatory, defaultvalue, flov) VALUES(3, 'SEB Meter Installation Date', 1, 4, 0, '', '')|
INSERT INTO sa_equipmentattribute (attributeid, attributename, equipmenttypeid, attributedatatype, mandatory, defaultvalue, flov) VALUES(4, 'SEB Meter Authority', 1, 3, 0, '', '')|
insert into cb_emailevent (eventid,eventname,subject,body,emailstatus) values (507, 'AGREEMENT_RENEWAL_PENDENCY_NOTIFICATION','Agreement Renewal Pendency Notification','Rent_Agreement_Renewal_Pendency.html',1)|
INSERT INTO cb_emailevent (eventid, eventname, subject, body, emailstatus) VALUES(508, 'FIRST_DOCUMENT_REJECTION', 'First Document Rejection Notification', 'First_Document_Rejection_Notification.html', 1)|
INSERT INTO cb_emailevent (eventid, eventname, subject, body, emailstatus) VALUES(509, 'FIRST_DOCUMENT_APPROVAL', 'First Document Approval Notification', 'First_Document_Approval_Notification.html', 1)|
INSERT INTO cb_emailevent (eventid, eventname, subject, body, emailstatus) VALUES(510, 'LMS_SAP_LANDLORD_INTERFACE_FAILURE', 'Attention Reqd. Daily LMS to SAP Landlord File Generation', 'LMS_SAP_Landlord_File_Integration_Failure.html', 1)|
INSERT INTO cb_emailevent (eventid, eventname, subject, body, emailstatus) VALUES(511, 'LMS_SAP_LANDLORD_INTERFACE_SUCCESS', 'Daily LMS to SAP Landlord File Generation Completed Successfully', 'LMS_SAP_Landlord_File_Integration_Success.html', 1)|
INSERT INTO cb_emailevent (eventid, eventname, subject, body, emailstatus) VALUES(513, 'SAP_LMS_VENDORCODE_INTERFACE_FAILURE', 'Attention Reqd. SAP to LMS Vendor Code File Processing', 'SAP_LMS_Vendor_File_Integration_Failure.html', 1)|
INSERT INTO cb_emailevent (eventid, eventname, subject, body, emailstatus) VALUES(512, 'SAP_LMS_VENDORCODE_INTERFACE_SUCCESS', 'SAP to LMS Vendor Code File Processing', 'SAP_LMS_Vendor_File_Integration_Success.html', 1)|
insert into cb_emailevent (eventid, eventname, subject, body, emailstatus) values(516,'CREST_LMS_TT_INTERFACE_FAILURE','Attention Reqd. TT to LMS File Processing','CREST_LMS_TT_File_Processing_Failure.html',1)|
insert into cb_emailevent (eventid, eventname, subject, body, emailstatus) values(515,'CREST_LMS_TT_INTERFACE_SUCCESS','TT to LMS File Processing','CREST_LMS_TT_File_Processing_Success.html',1)|
INSERT INTO cb_emailevent (eventid, eventname, subject, body, emailstatus) VALUES(517, 'LMS_SAP_INVOICE_INTERFACE_SUCCESS', 'Daily LMS to SAP Invoice File Generation Completed Successfully', 'LMS_SAP_Invoice_File_Integration_Success.html', 1)|
INSERT INTO cb_emailevent (eventid, eventname, subject, body, emailstatus) VALUES(518, 'LMS_SAP_INVOICE_INTERFACE_FAILURE', 'Attention Reqd. Daily LMS to SAP Invoice File Generation', 'LMS_SAP_Invoice_File_Integration_Failure.html',1)|
INSERT INTO cb_emailevent (eventid, eventname, subject, body, emailstatus) VALUES(519, 'CREST_LMS_USER_CREATION', 'Crest LMS User Creation', 'CREST_LMS_User_Creation.html', 1)|
INSERT INTO cb_emailevent (eventid, eventname, subject, body, emailstatus) VALUES(520, 'CREST_LMS_USER_PWD_CHANGE', 'Crest LMS User Password Change', 'CREST_LMS_User_Password.html', 1)|
INSERT INTO cb_emailevent (eventid, eventname, subject, body, emailstatus) VALUES(521, 'NFA_REJECTION', 'NFA is rejected', 'NFA_Rejection.html', 1)|
INSERT INTO cb_emailevent (eventid, eventname, subject, body, emailstatus) VALUES(522, 'NFA_RESUBMISSION', 'NFA needs to be resubmitted', 'NFA_Resubmission.html', 1)|
INSERT INTO cb_emailevent (eventid, eventname, subject, body, emailstatus) VALUES(523, 'NFA_APPROVAL', 'NFA is Approved', 'NFA_Approval.html', 1)|
INSERT INTO	cb_emailevent (eventid,	eventname, subject,	body, emailstatus)values (526,'SAP_Vendor_Code_Not_Attached','SAP Vendor Code Not Attached','SAP_Vendor_Code_Not_Attached.html',1)|
INSERT INTO	cb_emailevent (eventid,	eventname, subject,	body, emailstatus)values (524,'PAYMENT_SUCCESS','Payment successful','SAP_LMS_Payment_File_Integration_Success.html',1)|
INSERT INTO	cb_emailevent (eventid,	eventname, subject,	body, emailstatus)values (525,'PAYMENT_FAILURE','Payment Fail','SAP_LMS_Payment_File_Integration_Failure.html',1)|
CREATE TABLE crest_galaxy_submeter_readings (	recordid serial8 NOT NULL, 	activityid int8 NULL, 	circle varchar NULL, 	siteid varchar NULL, 	sitename varchar NULL, 	sitetype varchar NULL, 	submittedby varchar NULL, 	submitdate date NULL, 	readingdate date NULL, 	previousreadingdate date NULL, 	submeterno varchar NULL, 	currentsubmeterreading int8 NULL, 	previoussubmeterreading int8 NULL, 	currentsubmeterpic varchar NULL, 	currentremark varchar NULL, 	status smallint NOT NULL DEFAULT 0, 	rejectreason varchar NULL, 	errorflag int2 NOT NULL DEFAULT 0, 	errordescription varchar NULL)|
COMMENT ON COLUMN crest_galaxy_submeter_readings.recordid IS 'Unique Autogenerated Identifier for the record'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.activityid IS 'Unique identifier maintained by Galaxy'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.circle IS 'Region/Circle of the site'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.siteid IS 'ID of the Site for which the submeter reading is taken'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.sitename IS 'Name of the Site for which the submeter reading is taken'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.sitetype IS 'Type of Site for which the submeter reading is taken'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.submittedby IS 'Galaxy user name who took the submeter reading'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.submitdate IS 'Date on which the meter reading is submitted'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.readingdate IS 'Date on which the meter reading is taken'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.previousreadingdate IS 'Date on which previous meter reading was taken'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.submeterno IS 'Sub meter serial number'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.currentsubmeterreading IS 'Current sub meter reading value'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.previoussubmeterreading IS 'Previous sub meter reading value'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.currentsubmeterpic IS 'Complete URL of the current sub meter pic'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.currentremark IS 'Remarks if any'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.status IS '0 - To be processed, 1 - Approved, 2 - Rejected'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.errorflag IS '14 digit binary string converted into decimal, to identify which fields have error denoted by 1 otherwise 0. 0 means no error in any field. 16383 - means error in all 14 fields'|
COMMENT ON COLUMN crest_galaxy_submeter_readings.errordescription IS 'Description of error'|
ALTER TABLE crest_galaxy_submeter_readings ADD activityid varchar NULL|
CREATE TABLE crest_sitetenancies (	recordid serial8 NOT NULL, 	sitecode varchar NOT NULL, 	projectref varchar NOT NULL, 	projectstatus varchar NOT NULL, 	opconame varchar NOT NULL, 	mrfai_date date NOT NULL, 	tenantstatus smallint NOT NULL DEFAULT 1, 	removal_date date NULL, 	recordstatus smallint NOT NULL DEFAULT 1, 	eventtype varchar, 	remarks varchar, 	modonts timestamp with time zone NOT NULL, 	solutiontype varchar not null)|
ALTER TABLE crest_sitetenancies ADD CONSTRAINT crest_sitetenancies_un UNIQUE (projectref)|
COMMENT ON COLUMN crest_sitetenancies.recordid IS 'Unique recor identifier'|
COMMENT ON COLUMN crest_sitetenancies.sitecode IS 'Unique identification for the site'|
COMMENT ON COLUMN crest_sitetenancies.projectref IS 'Project Reference Number to identify the project in TT. It is unique'|
COMMENT ON COLUMN crest_sitetenancies.projectstatus IS 'Status of the project in TT'|
COMMENT ON COLUMN crest_sitetenancies.opconame IS 'Name of the tenant operator'|
COMMENT ON COLUMN crest_sitetenancies.mrfai_date IS 'Date on which Tenant is MRFAI'|
COMMENT ON COLUMN crest_sitetenancies.tenantstatus IS '1 - Tenant Active, 0 - Tenant Removed'|
COMMENT ON COLUMN crest_sitetenancies.removal_date IS 'Date when the tenant is removed from the site'|
COMMENT ON COLUMN crest_sitetenancies.recordstatus IS 'Record Status, 1 - Active, 0 - Inactive'|
COMMENT ON COLUMN crest_sitetenancies.eventtype IS 'NB or TI based on which even created this record'|
COMMENT ON COLUMN crest_sitetenancies.remarks IS 'Remarks if any'|
COMMENT ON COLUMN crest_sitetenancies.modonts IS 'Record update date time'|
COMMENT ON COLUMN crest_sitetenancies.solutiontype IS 'Solution Type for the operator'|
CREATE TABLE crest_invoice_summary (	invoiceid serial8 NOT NULL, 	invoiceno varchar NOT NULL, 	sitecode varchar NOT NULL, 	sitename varchar NOT NULL, 	circle varchar NOT NULL, 	landlordid int8 NOT NULL, 	sapvendorcode varchar NULL, 	landlordname varchar NOT NULL, 	rentshare numeric(5, 2) NOT NULL DEFAULT 100, 	solutiontype varchar NULL, 	billingtype smallint NOT NULL DEFAULT 1, 	rentstatus varchar NULL, 	invoicetype smallint NOT NULL, 	invoicedate timestamptz NOT NULL, 	dueon varchar NULL, 	billingcycle varchar NOT NULL, 	period_startdate timestamptz NOT NULL, 	period_enddate timestamptz NOT NULL, 	grossinvoiceamount numeric(20, 2) NOT NULL, 	gst_rate numeric(5, 2) NOT NULL DEFAULT 0, 	invoiceamount numeric(20, 2) NOT NULL, 	billforoperator varchar NULL, 	invoicearrears numeric(20, 2) NULL DEFAULT 0, 	status smallint NOT NULL DEFAULT 0, 	submissiondate timestamptz NULL, 	receiveddate varchar NULL, 	tds_rate numeric(5, 2) NOT NULL DEFAULT 0, 	duedate timestamptz NULL, 	rejectreason varchar NULL, 	remarks1 varchar NULL, 	remarks2 varchar NULL, 	fileuuid varchar NULL, auto_flag smallint default 0, glcode varchar NULL)|
COMMENT ON COLUMN crest_invoice_summary.invoiceid IS 'Unique ID for an Invoice. Sequentially generated'|
COMMENT ON COLUMN crest_invoice_summary.invoiceno IS 'Invoice No.'|
COMMENT ON COLUMN crest_invoice_summary.sitecode IS 'Site for which the invoice is generated'|
COMMENT ON COLUMN crest_invoice_summary.sitename IS 'Name of the site for which this invoice is generated'|
COMMENT ON COLUMN crest_invoice_summary.landlordid IS 'Id of the landlord for which this invoice is generated. To be auto populated'|
COMMENT ON COLUMN crest_invoice_summary.sapvendorcode IS 'SAP vendor code for the landlord for which this invoice is generated'|
COMMENT ON COLUMN crest_invoice_summary.landlordname IS 'Name of the landlord for which this invoice is generated'|
COMMENT ON COLUMN crest_invoice_summary.rentshare IS 'Percentage of Rent share of the landlord from the site'|
COMMENT ON COLUMN crest_invoice_summary.solutiontype IS 'Solution Type as deployed in site'|
COMMENT ON COLUMN crest_invoice_summary.billingtype IS '1 - Agreement based, 2 - Invoice based, 3 - NFA based, 4 - Galaxy Based'|
COMMENT ON COLUMN crest_invoice_summary.rentstatus IS 'As defined in Agreement data field with same name'|
COMMENT ON COLUMN crest_invoice_summary.invoicetype IS 'Type of Invoice.1- Rent, 2-Maintenance, 3-Escalation, 4-Rent+ Space Charges + Conservancy Fee, 5-Space Charges & Conservancy Fee, 6-Space Charges, 7-Waiver, 8-Debit Note, 9-Credit Note, 10-Interest Charges, 11-NFA, 12-SD - License Fee,13-Others,14-Advance,15-SD-EB,16-EB-Advance,17-EB,18-FCU,19-DG,20-EB+FCU,21-EB+DG,22-EB Fixed Charges'|
COMMENT ON COLUMN crest_invoice_summary.invoicedate IS 'Date on which invoice is generated'|
COMMENT ON COLUMN crest_invoice_summary.dueon IS 'Day of Month on which agreement is due as defined in Agreement data field �Payment Day of Month�'|
COMMENT ON COLUMN crest_invoice_summary.billingcycle IS 'As defined in the Agreement data field named �Rent Frequency�'|
COMMENT ON COLUMN crest_invoice_summary.period_startdate IS 'Start Date of the invoice'|
COMMENT ON COLUMN crest_invoice_summary.period_enddate IS 'End date of the invoice'|
COMMENT ON COLUMN crest_invoice_summary.grossinvoiceamount IS 'Gross Invoice Amount before tax'|
COMMENT ON COLUMN crest_invoice_summary.gst_rate IS 'Applicable GST %. '|
COMMENT ON COLUMN crest_invoice_summary.invoiceamount IS 'Gross + GST'|
COMMENT ON COLUMN crest_invoice_summary.billforoperator IS 'comma separerated list of operators for which the invoice is applicable'|
COMMENT ON COLUMN crest_invoice_summary.invoicearrears IS 'Arrear amount of invoice if any.'|
COMMENT ON COLUMN crest_invoice_summary.status IS '0-To be Processed, 1-Hold by EMG, 2 - Rejected by EMG, 3-Approved by EMG, 4-Rejected by Finance, 5-Approved by Finance, 6-Sent to SAP, 7-Payment Record Received,,8-Cancelled,9-Resend'|
COMMENT ON COLUMN crest_invoice_summary.submissiondate IS 'Date on which EMG has approved the invoice'|
COMMENT ON COLUMN crest_invoice_summary.receiveddate IS 'Date on which the invoice is received'|
COMMENT ON COLUMN crest_invoice_summary.tds_rate IS 'Percentage of Rent to be withheld as TDS'|
COMMENT ON COLUMN crest_invoice_summary.duedate IS 'Date on which the invoice is due for payment as mentioned in the invoice'|
COMMENT ON COLUMN crest_invoice_summary.rejectreason IS 'Reject reason'|
COMMENT ON COLUMN crest_invoice_summary.fileuuid IS 'File uploaded against the invoice. File UUID is stored'|
CREATE TABLE crest_invoice_details_usage (	invoiceid bigserial NOT NULL, 	meterserialno varchar NULL, 	consumerno varchar NULL, 	metertype int2 NULL, 	sanctionload varchar NULL, 	noofdays int2 NOT NULL DEFAULT 0, 	opening_reading int8 NOT NULL DEFAULT 0, 	closing_reading int8 NOT NULL DEFAULT 0, 	calculated_consumption int8 NOT NULL DEFAULT 0, 	manual_consumption numeric(10, 2) NOT NULL DEFAULT 0, 	per_day_consumption numeric(10, 2) NOT NULL DEFAULT 0, 	eb_amount numeric(20, 2) NOT NULL DEFAULT 0, 	unit_rate numeric(20, 2) NOT NULL DEFAULT 0, 	fix_load_charge numeric(20, 2) NULL DEFAULT 0, 	dg_charge numeric(20, 2) NULL DEFAULT 0, 	fcu_charge numeric(20, 2) NULL DEFAULT 0, 	late_payment_service_charge numeric(20, 2) NULL DEFAULT 0, 	othercharges numeric(20, 2) NULL DEFAULT 0, 	lpsc_payable int2 NOT NULL DEFAULT 0, 	final_payable_amount numeric(20, 2) NOT NULL DEFAULT 0)|
COMMENT ON COLUMN crest_invoice_details_usage.invoiceid IS 'Invoice Id'|
COMMENT ON COLUMN crest_invoice_details_usage.meterserialno IS 'Meter serial number for which invoice being booked'|
COMMENT ON COLUMN crest_invoice_details_usage.consumerno IS 'Consumer no for EB Meter Type'|
COMMENT ON COLUMN crest_invoice_details_usage.metertype IS '1-SEB Meter,2-Sub Meter,3-Prepaid Meter'|
COMMENT ON COLUMN crest_invoice_details_usage.sanctionload IS 'load sanctioned for the site meter'|
COMMENT ON COLUMN crest_invoice_details_usage.noofdays IS 'No of days calculated from invoice period start & end date'|
COMMENT ON COLUMN crest_invoice_details_usage.opening_reading IS 'Previous Meter Reading'|
COMMENT ON COLUMN crest_invoice_details_usage.closing_reading IS 'Current Meter Reading'|
COMMENT ON COLUMN crest_invoice_details_usage.calculated_consumption IS 'Calculated using opening and closing reading'|
COMMENT ON COLUMN crest_invoice_details_usage.manual_consumption IS 'Consumption manually entered'|
COMMENT ON COLUMN crest_invoice_details_usage.per_day_consumption IS 'Auto calculated by dividing Reading based Consumption or Manual Consumption (if entered) by No. Of Days.'|
COMMENT ON COLUMN crest_invoice_details_usage.eb_amount IS 'EB charge amount entered'|
COMMENT ON COLUMN crest_invoice_details_usage.unit_rate IS 'Auto calculated by dividing EB Amount with Reading based Consumption or Manual Consumption (if entered)'|
COMMENT ON COLUMN crest_invoice_details_usage.fix_load_charge IS 'Fix load charge to be entered manually'|
COMMENT ON COLUMN crest_invoice_details_usage.dg_charge IS 'DG charge if applicable'|
COMMENT ON COLUMN crest_invoice_details_usage.fcu_charge IS 'Fix unit charges if applicable'|
COMMENT ON COLUMN crest_invoice_details_usage.late_payment_service_charge IS 'late payment charge if any'|
COMMENT ON COLUMN crest_invoice_details_usage.othercharges IS 'To be auto calculated. Total - EB Amount - Fix load Charges - DG Charges - FCU Charges � LPSC � Arrear'|
COMMENT ON COLUMN crest_invoice_details_usage.lpsc_payable IS '0-Not Payable, 1-Payable'|
COMMENT ON COLUMN crest_invoice_details_usage.final_payable_amount IS '- Invoice Amount + LPSC if LPSC is payable otherwise Invoice Amount'|
ALTER TABLE tb_siteagreement ADD agreementtype smallint NOT NULL DEFAULT 1|
COMMENT ON COLUMN tb_siteagreement.agreementtype IS 'Type of agreement. 1-Main, 2-Addendum'|
ALTER TABLE tb_landlord ADD modonts timestamptz NOT NULL DEFAULT now()|
COMMENT ON COLUMN tb_landlord.modonts IS 'To capture landlord data modifications for both basic details and attributes'|
CREATE TABLE crest_lms_sap_interface_process_stats (	serialno serial8 NOT NULL, 	processtype smallint NOT NULL, 	rundate timestamptz NOT NULL DEFAULT now(), 	filename varchar NOT NULL, 	processstatus smallint NOT NULL DEFAULT 1, 	failurereason varchar NULL)|
COMMENT ON COLUMN crest_lms_sap_interface_process_stats.serialno IS 'Serial No'|
COMMENT ON COLUMN crest_lms_sap_interface_process_stats.processtype IS '1 - LMS to SAP Landlord, 2 - LMS to SAP Invoice, 3 - SAP to LMS Vendor Code'|
COMMENT ON COLUMN crest_lms_sap_interface_process_stats.rundate IS 'Date on which the process ran'|
COMMENT ON COLUMN crest_lms_sap_interface_process_stats.filename IS 'Name of the file generated or processed'|
COMMENT ON COLUMN crest_lms_sap_interface_process_stats.processstatus IS '1 - Success, 0 - Error'|
COMMENT ON COLUMN crest_lms_sap_interface_process_stats.failurereason IS 'Reason for failure if any'|
CREATE SEQUENCE sap_landlord_recordid	INCREMENT BY 1	MINVALUE 1	MAXVALUE 9223372036854775807	START 1	CACHE 1	NO CYCLE|
CREATE TABLE tb_crestdatauploadstats(   transactionserialno serial8 NOT NULL,     transactiondate timestamptz,     filename varchar,     transactiontype varchar,     totalrecords integer,     processedrecords integer,     rejectedrecords integer,     transactioneddatetime timestamptz)|
CREATE TABLE crest_lms_tt_interface_process_stats (	slno serial8, 	filename varchar, 	rundate timestamptz, 	processstatus smallint NOT NULL DEFAULT 1, 	failurereason varchar NULL)|
CREATE TABLE crest_siteagreementdtl (    sitecode character varying ,    agreementname character varying ,    agreementdate timestamp with time zone,    startdate timestamp with time zone,    enddate timestamp with time zone,    status smallint,    attributedetails character varying )|
CREATE TABLE crest_lms_galaxy_run_stat (slno serial8 NOT NULL,	rundate timestamptz NOT NULL)|
CREATE TABLE tb_nfa_approval_record ( serialno bigserial NOT NULL, nfadocketno varchar NULL, approvarname varchar NULL, approvalstatus varchar NULL, approvalremarks varchar NULL, peerreviwer varchar NULL, modonts timestamptz NULL)|
comment on column tb_nfa_approval_record.serialno is 'serial no. of records'|
comment on column tb_nfa_approval_record.nfadocketno  is 'NFA Docket no.'|
comment on column tb_nfa_approval_record.approvalstatus  is 'status of the record-Approved,Resubmit,Rejected'|
comment on column tb_nfa_approval_record.approvarname is 'shows Approver name'|
comment on column tb_nfa_approval_record.approvalremarks  is 'shows remarks '|
comment on column tb_nfa_approval_record.peerreviwer  is 'shows the selected peers'|
CREATE TABLE crest_sap_glcode (id serial NOT NULL, glcode varchar NOT NULL, description varchar NULL, status smallint NOT NULL DEFAULT 1)|
COMMENT ON COLUMN crest_sap_glcode.id IS 'Auto generated id (serial Number)'|
COMMENT ON COLUMN crest_sap_glcode.glcode IS 'GL Code'|
COMMENT ON COLUMN crest_sap_glcode.description IS 'Description'|
COMMENT ON COLUMN crest_sap_glcode.status IS '1- Active, 0-Inactive'|
CREATE TABLE crest_circlelist (	circle_id serial NOT NULL,circlename varchar NULL)|
INSERT INTO crest_circlelist (circlename) VALUES ('MHG')|
INSERT INTO crest_circlelist (circlename) VALUES('WB+Nesa')| 
INSERT INTO crest_circlelist (circlename) VALUES('GUJ+MPCG')|
INSERT INTO crest_circlelist (circlename) VALUES('TN+KL')|
INSERT INTO crest_circlelist (circlename) VALUES('Mumbai')|
INSERT INTO crest_circlelist (circlename) VALUES('DEL NCR')|
INSERT INTO crest_circlelist (circlename) VALUES('BHR')|
INSERT INTO crest_circlelist (circlename) VALUES('KTK')|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Security Deposit EB Board - Non Current', 'Security Deposit EB Board - Non Current', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Security Deposit Realter  - Non Current', 'Security Deposit Realter  - Non Current', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('EMD', 'EMD', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Income on Security -EB Board', 'Income on Security -EB Board', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Rent Realtor Expense-IBS Taxeble', 'Rent Realtor Expense-IBS Taxeble', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Rent Realtor Expense-IBS Non Taxeble', 'Rent Realtor Expense-IBS Non Taxeble', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Rent Realtor Expense-ODSC/HPSC Taxeble', 'Rent Realtor Expense-ODSC/HPSC Taxeble', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Rent Realtor Expense-ODSC/HPSC Non Taxeble', 'Rent Realtor Expense-ODSC/HPSC Non Taxeble', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Consultancy Charges-TCIL', 'Consultancy Charges-TCIL', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Penalty', 'Penalty', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Stamp Duty', 'Stamp Duty', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Interest on Late Payment', 'Interest on Late Payment', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Rebate & Discount', 'Rebate & Discount', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Electricity Charges-IBS Taxeble', 'Electricity Charges-IBS Taxeble', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Electricity Charges-IBS  Non Taxeble', 'Electricity Charges-IBS  Non Taxeble', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Electricity Charges-ODSC/HPSC Non Taxeble', 'Electricity Charges-ODSC/HPSC Non Taxeble', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Late Payment Charges EB', 'Late Payment Charges EB', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('Electricity Charges-ODSC/HPSC Taxeble', 'Electricity Charges-ODSC/HPSC Taxeble', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('CWIP Bool Site-IBS', 'CWIP Bool Site-IBS', 1)|
INSERT INTO crest_sap_glcode (glcode, description, status) VALUES('CWIP Bool Site-Small Cell', 'CWIP Bool Site-Small Cell', 1)|
ALTER TABLE crest_invoice_summary ADD CONSTRAINT crest_invoice_summary_fk FOREIGN KEY (sitecode) REFERENCES tb_sites(sitecode)|
ALTER TABLE crest_invoice_summary ADD CONSTRAINT crest_invoice_summary_landlord_fk FOREIGN KEY (landlordid) REFERENCES tb_landlord(landlordid)|
ALTER TABLE crest_invoice_summary ADD CONSTRAINT crest_invoice_summary_pk PRIMARY KEY (invoiceid)|
ALTER TABLE crest_invoice_details_usage ADD CONSTRAINT crest_invoice_details_usage_fk FOREIGN KEY (invoiceid) REFERENCES crest_invoice_summary(invoiceid)|
ALTER TABLE crest_sitetenancies ADD CONSTRAINT crest_sitetenancies_fk FOREIGN KEY (sitecode) REFERENCES tb_sites(sitecode)|
ALTER table crest_invoice_summary ADD agreementid int|
ALTER table crest_invoice_summary ADD agreementname varchar|
ALTER table crest_invoice_details_usage ADD agreementid int|
ALTER table crest_invoice_details_usage ADD agreementname varchar|
ALTER table tb_siteagreement ADD agreementtenure  int|
CREATE TABLE tb_state (id serial,statename varchar(255),statecode varchar(50),status integer)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Andaman and Nicobar Islands', 'AN', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Andhra Pradesh', 'AP', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Arunachal Pradesh', 'AR', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Assam', 'AS', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Bihar', 'BR', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Chandigarh', 'CH', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Chhattisgarh', 'CR', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Dadra And Nagar Haveli and Daman and Diu', 'DN', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Delhi', 'DL', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Goa', 'GA', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Gujarat', 'GJ', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Haryana', 'HR', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Himachal Pradesh', 'HP', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Jammu and Kashmir', 'JK', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Jharkhand', 'JH', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Karnataka', 'KT', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Kerala', 'KL', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Ladakh', 'LK', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Lakshadweep', 'LD', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Madhya Pradesh', 'MP', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Maharashtra', 'MH', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Manipur', 'MN', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Meghalaya', 'ML', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Mizoram', 'MZ', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Nagaland', 'NL', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Odisha', 'OD', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Other', 'OT', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Puducherry', 'PD', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Punjab', 'PB', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Rajasthan', 'RJ', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Sikkim', 'SK', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Tamil Nadu', 'TN', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Telangana', 'TL', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Tripura', 'TR', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Uttar Pradesh', 'UP', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('Uttarakhand', 'UK', 1)|
INSERT INTO tb_state (statename, statecode, status) VALUES('West Bengal', 'WB', 1)|
CREATE TABLE tb_Bank (id serial,bankname varchar(255),bankcode varchar(50),status integer)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('HDFC Bank', 'HDFC', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('State Bank Of India', 'SBI', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Allahabad Bank', 'ALB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Andhra Bank', 'ANB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('BAC Bank', 'BAC', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Bank Of Baroda', 'BOB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Bank of India', 'BOI', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Central Bank of India', 'CBI', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Canara Bank', 'CNB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Fedral Bank', 'FDB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('ICICI Bank', 'ICICI', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('IDFC Bank', 'IDFC', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Punjab National Bank', 'SVC', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('SVC Bank', 'HDFC', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('United Bank of India', 'UBI', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('UCB Bank', 'UCB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('UTI Bank', 'UTI', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Yes Bank', 'YSB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Other Banks', 'OTH', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('AXIS Bank', 'UTIB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Kotak Bank', 'KKBK', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Bank Of Maharastra', 'BOM', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('City Bank', 'CB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('DBS Bank', 'DBS', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('IDBI BANK LTD', 'IDBI', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('IDFC First Bank', 'IDFCF', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('INDIAN BANK', 'IDIB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Indusind Bank', 'INDB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Karnataka Bank', 'KARB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Lakshmi Vilas Bank', 'LAVB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('NKGSB CO-OP BANK LTD', 'NKGSB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('ORIENTAL BANK OF COMMERCE', 'OBC', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Punjab & Sind Bank', 'PSB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Standard Chartered Bank', 'SCBL', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('The Jammu And Kashmir Bank Ltd', 'JAKA', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('The Shamrao Vithal Co-operative Bank', 'SVCB', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Ujjivan Small Finance Bank', 'UJVN', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('Union Bank of India', 'UBIN', 1)|
INSERT INTO tb_bank (bankname, bankcode, status) VALUES('DNS Bank', 'DNS', 1)|
ALTER table crest_invoice_summary ADD igst varchar(50)|
CREATE TABLE tb_draftdata (serialno serial4 NOT NULL,userid varchar(100) NULL,"type" int4 NULL,draftdata text NULL)|
ALTER TABLE tb_siteagreement ADD createon timestamp default CURRENT_TIMESTAMP|
ALTER TABLE tb_siteagreement ADD stopdate timestamp|
ALTER TABLE tb_siteagreement ADD stopby varchar|
CREATE TABLE tb_document_approval_record (serialno bigserial NOT NULL,docketno varchar NULL,taskname varchar NULL,approvarname varchar NULL,approveraccepttime timestamp NULL,approvalstatus varchar NULL,actiontimestamp timestamp NULL,approvalremarks varchar NULL,modonts timestamp NULL DEFAULT CURRENT_TIMESTAMP)|
ALTER TABLE tb_document_approval_record ADD agreementid integer|
create table crest_status (serialno serial,invoiceid Integer,status Integer,actiontime timestamp,username varchar,createon timestamp null default CURRENT_TIMESTAMP,moduletype Integer)|
COMMENT ON COLUMN crest_status.invoiceid IS 'Invoice Id'|
COMMENT ON COLUMN crest_status.status IS '0-To be Processed, 1-Hold by EMG, 2 - Rejected by EMG, 3-Approved by EMG, 4-Rejected by Finance, 5-Approved by Finance, 6-Sent to SAP, 7-Payment Record Received,,8-Cancelled,9-Resend'|
COMMENT ON COLUMN crest_status.actiontime IS 'Timestamp for every action'|
COMMENT ON COLUMN crest_status.username IS 'user for every action'|
COMMENT ON COLUMN crest_status.moduletype IS '1-Invoice'|
alter table tb_document_approval_record add column workgroup varchar |
alter table tb_draftdata add column fileuid varchar|
create table crest_equipment_dump ( transactionid bigserial not null,storeserialno bigint not null,startdate timestamptz not null,enddate timestamptz null,storeid int2 not null,storelocationid varchar not null,status int2 not null,modby varchar not null,modon timestamptz not null,remarks text null,recordstatus smallint null)|
alter table crest_equipment_dump add column stopby varchar|
alter table crest_equipment_dump add column createdby varchar|
alter table tb_siteagreement add column modby varchar|
ALTER TABLE tb_siteagreement ADD upcomingescalationdate timestamptz NULL|
COMMENT ON COLUMN tb_siteagreement.upcomingescalationdate IS 'store upcoming escalation date'|
create table crest_agreement_history ( sitecode varchar null,agreementname varchar null,agreementdate timestamptz null,startdate timestamptz null,enddate timestamptz null,paymentfrequency smallint null,paymentamount numeric(20,6) null,paymentunit smallint null,agreementid serial not null,paymentmode smallint null,escalationfrequency smallint null,escalationunit smallint null,escalationamount numeric(20,6) null,status smallint null,create_on timestamp default CURRENT_TIMESTAMP,modby varchar)|
alter table crest_invoice_summary add column mrfai_date timestamptz|
alter table crest_invoice_summary add column rcc_date varchar|
alter table crest_invoice_summary add column escalationpercentage integer|
alter table crest_invoice_summary add column escalationfrequency integer|
alter table crest_invoice_summary add column agreementenddate timestamptz|
alter table crest_invoice_summary add column upcomingescalationdate varchar|
alter table crest_invoice_summary add column upcomingescalatedamount numeric(20, 2)|
alter table crest_invoice_summary add column rentamount numeric(20, 2)|


CREATE TABLE crest_invoice_pendency_report (
	id int8 serial,
	landlord_id int8 NULL,
	landlord_name varchar(250) NULL,
	sitecode varchar(250) NULL,
	circle varchar(200) NULL,
	address text NULL,
	monthname1 varchar(50) NULL,
	pendancy1 varchar(10) NULL,
	monthname2 varchar(50) NULL,
	pendancy2 varchar(10) NULL,
	monthname3 varchar(50) NULL,
	pendancy3 varchar(10) NULL,
	monthname4 varchar(50) NULL,
	pendancy4 varchar(10) NULL,
	monthname5 varchar(50) NULL,
	pendancy5 varchar(10) NULL,
	monthname6 varchar(50) NULL,
	pendancy6 varchar(10) NULL,
	monthname7 varchar(50) NULL,
	pendancy7 varchar(10) NULL,
	monthname8 varchar(50) NULL,
	pendancy8 varchar(10) NULL,
	monthname9 varchar(50) NULL,
	pendancy9 varchar(10) NULL,
	monthname10 varchar(50) NULL,
	pendancy10 varchar(10) NULL,
	monthname11 varchar(50) NULL,
	pendancy11 varchar(10) NULL,
	monthname12 varchar(50) NULL,
	pendancy12 varchar(10) NULL,
	totalopen int8 NULL,
	CONSTRAINT crest_invoice_pendency_report_pkey PRIMARY KEY (id)
)|

ALTER TABLE tb_sites ADD create_on timestamptz NOT NULL DEFAULT now()|
ALTER TABLE tb_siteattribute  ADD create_on timestamptz NOT NULL DEFAULT now()|

ALTER TABLE tb_propertyattribute  ADD create_on timestamptz NOT NULL DEFAULT now()|


CREATE TABLE crest_dump_landlord (
	serialno serial,
	landlordid int4 ,
	sitecode varchar ,
	agreementid int4 ,
	createon  timestamptz NOT NULL DEFAULT now()
)|
CREATE OR REPLACE FUNCTION add_landlord()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
   insert
	into crest_dump_landlord(landlordid)values(new.landlordid)|
return new|
END|
$function$
|

create trigger update_landlord_trig after update on tb_landlord for each row execute function add_landlord()|
    
create trigger add_landlord_trig after insert on tb_landlord for each row execute function add_landlord()|


ALTER TABLE IF EXISTS crest_siteagreementdtl
    ADD COLUMN user_id character varying COLLATE pg_catalog."default"|	
    

COMMIT|
