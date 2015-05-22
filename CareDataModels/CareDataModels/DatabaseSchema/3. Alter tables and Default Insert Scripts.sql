--ALTER TABLE Doctors ADD HospitalId int 
--ALTER TABLE Patients ADD ImageContent image
----update Patients set ImageContent=(select PrescriptionImage from Prescriptions where PrescriptionId=1) where phone='9494949494'
GO
--ALTER TABLE MedicalRecords ADD ImageContent image 
GO
--ALTER TABLE MedicalRecords ADD DoctorID int 
GO   
--ALTER TABLE [dbo].[MedicalRecords]  ADD  constraint [FK_MedicalRecords_DoctorsId] FOREIGN KEY([DoctorID]) REFERENCES [dbo].[Doctors] ([DoctorID])
GO
--UPDATE MedicalRecords SET MedicalRecordName=0 WHERE MedicalRecordName IS NULL
--ALTER TABLE MedicalRecords ALTER COLUMN MedicalRecordName nvarchar(50) NULL 
ALTER TABLE Doctors ADD Intervels int
GO
--delete  Admins where AdminID>1
--truncate  table Staff
--truncate  table Patients
--truncate  table appointments
--truncate  table Doctors
--delete  Hospitals where HospitalId>-1
--truncate  table Prescriptions
--truncate  table MedicalRecords
--truncate  table Feedback
--truncate  table HospitalToDoctor
GO
------------ Default Insert Scripts 
/* 
INSERT [dbo].[Roles] ([RoleId], [Name], [Description]) VALUES (1, N'SuperAdmin', N'Can create Admins')
INSERT [dbo].[Roles] ([RoleId], [Name], [Description]) VALUES (2, N'Admin', N'Can create Staff')
INSERT [dbo].[Roles] ([RoleId], [Name], [Description]) VALUES (4, N'Staff', N'Can create Patients & Doctors')
INSERT [dbo].[Roles] ([RoleId], [Name], [Description]) VALUES (8, N'Doctor', N'Can access Patients and Resources')
INSERT [dbo].[Roles] ([RoleId], [Name], [Description]) VALUES (16, N'Patient', N'Can access his/her resources')
GO
SET IDENTITY_INSERT dbo.[Admins] off;
INSERT INTO [dbo].[Admins]
           ([HospitalID]
           ,[FirstName]
           ,[LastName]
           ,[UserName]
           ,[Password]
           ,[RoleId]
           ,[Email]
           ,[Phone]
           ,[Gender]
           ,[FailedLoginAttempts]
           ,[IsActive] )
     VALUES
           (-1 ,'super','admin'
           ,'superadmin','superadmin'
          ,1
           ,'super@admin.com'
           ,'9999999999'
           ,1
           ,0
           ,1)
GO
SET IDENTITY_INSERT dbo.[Hospitals] Off;
INSERT INTO [dbo].[Hospitals]
           ([HospitalId],[HospitalDisplayId]
           ,[Name])
     VALUES
           (-1,
           'AllHospitals'
           ,'AllHospitals')
 */
GO



GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

GO
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (1, N'India')
GO
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[States] ON 

GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (1, N'Andaman and Nicobar Island', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (2, N'Andhra Pradesh', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (3, N'Arunachal Pradesh', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (4, N'Assam', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (5, N'Bihar', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (6, N'Chandigarh', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (7, N'Chhattisgarh', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (8, N'Dadra and Nagar Haveli', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (9, N'Daman and Diu', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (10, N'Delhi', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (11, N'Goa', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (12, N'Gujarat', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (13, N'Haryana', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (14, N'Himachal Pradesh', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (15, N'Jammu and Kashmir', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (16, N'Jharkhand', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (17, N'Karnataka', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (18, N'Kerala', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (19, N'Lakshadweep', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (20, N'Madhya Pradesh', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (21, N'Maharashtra', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (22, N'Manipur', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (23, N'Meghalaya', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (24, N'Mizoram', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (25, N'Nagaland', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (26, N'Odisha', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (27, N'Puducherry', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (28, N'Punjab', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (29, N'Rajasthan', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (30, N'Sikkim', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (31, N'Tamil Nadu', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (32, N'Telangana', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (33, N'Tripura', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (34, N'Uttar Pradesh', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (35, N'Uttarakhand', 1)
GO
INSERT [dbo].[States] ([StateId], [StateName], [CountryId]) VALUES (36, N'West Bengal', 1)
GO
SET IDENTITY_INSERT [dbo].[States] OFF
GO
SET IDENTITY_INSERT [dbo].[Districts] ON 

GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (1, N'Nicobar', 1)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (2, N'North and Middle Andaman', 1)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (3, N'South Andaman', 1)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (4, N'Anantapur', 2)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (5, N'Chittoor', 2)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (6, N'Cuddapah', 2)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (7, N'East Godavari', 2)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (8, N'Guntur', 2)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (9, N'Krishna', 2)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (10, N'Kurnool', 2)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (11, N'Nellore', 2)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (12, N'Prakasam', 2)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (13, N'Srikakulam', 2)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (14, N'Visakhapatnam', 2)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (15, N'Vizianagaram', 2)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (16, N'West Godavari', 2)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (17, N'Anjaw', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (18, N'Changlang', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (19, N'Dibang Valley', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (20, N'East Kameng', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (21, N'East Siang', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (22, N'Kurung Kumey', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (23, N'Lohit', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (24, N'Longding', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (25, N'Lower Dibang Valley', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (26, N'Lower Subansiri', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (27, N'Papum Pare', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (28, N'Tawang', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (29, N'Tirap', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (30, N'Upper Siang', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (31, N'Upper Subansiri', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (32, N'West Kameng', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (33, N'West Siang', 3)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (34, N'Baksa', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (35, N'Barpeta', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (36, N'Bongaigaon', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (37, N'Cachar', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (38, N'Chirang', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (39, N'Darrang', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (40, N'Dhemaji', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (41, N'Dhubri', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (42, N'Dibrugarh', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (43, N'Dima Hasao', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (44, N'Goalpara', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (45, N'Golaghat', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (46, N'Hailakandi', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (47, N'Jorhat', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (48, N'Kamrup Metropolitan', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (49, N'Kamrup', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (50, N'Karbi Anglong', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (51, N'Karimganj', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (52, N'Kokrajhar', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (53, N'Lakhimpur', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (54, N'Morigaon', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (55, N'Nagaon', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (56, N'Nalbari', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (57, N'Sivasagar', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (58, N'Sonitpur', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (59, N'Tinsukia', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (60, N'Udalguri', 4)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (61, N'Araria', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (62, N'Arwal', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (63, N'Aurangabad', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (64, N'Banka', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (65, N'Begusarai', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (66, N'Bhagalpur', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (67, N'Bhojpur', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (68, N'Buxar', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (69, N'Darbhanga', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (70, N'East Champaran (Motihari)', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (71, N'Gaya', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (72, N'Gopalganj', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (73, N'Jamui', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (74, N'Jehanabad', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (75, N'Kaimur (Bhabua)', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (76, N'Katihar', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (77, N'Khagaria', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (78, N'Kishanganj', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (79, N'Lakhisarai', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (80, N'Madhepura', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (81, N'Madhubani', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (82, N'Munger (Monghyr)', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (83, N'Muzaffarpur', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (84, N'Nalanda', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (85, N'Nawada', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (86, N'Patna', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (87, N'Purnia (Purnea)', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (88, N'Rohtas', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (89, N'Saharsa', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (90, N'Samastipur', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (91, N'Saran', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (92, N'Sheikhpura', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (93, N'Sheohar', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (94, N'Sitamarhi', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (95, N'Siwan', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (96, N'Supaul', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (97, N'Vaishali', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (98, N'West Champaran', 5)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (99, N'Chandigarh', 6)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (100, N'Balod', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (101, N'Baloda Bazar', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (102, N'Balrampur', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (103, N'Bastar', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (104, N'Bemetara', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (105, N'Bijapur', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (106, N'Bilaspur', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (107, N'Dantewada (South Bastar)', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (108, N'Dhamtari', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (109, N'Durg', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (110, N'Gariaband', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (111, N'Janjgir-Champa', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (112, N'Jashpur', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (113, N'Kabirdham (Kawardha)', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (114, N'Kanker (North Bastar)', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (115, N'Kondagaon', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (116, N'Korba', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (117, N'Korea (Koriya)', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (118, N'Mahasamund', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (119, N'Mungeli', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (120, N'Narayanpur', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (121, N'Raigarh', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (122, N'Raipur', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (123, N'Rajnandgaon', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (124, N'Sukma', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (125, N'Surajpur', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (126, N'Surguja', 7)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (127, N'Dadra & Nagar Haveli', 8)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (128, N'Daman', 9)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (129, N'Diu', 9)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (130, N'Central Delhi', 10)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (131, N'East Delhi', 10)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (132, N'New Delhi', 10)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (133, N'North Delhi', 10)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (134, N'North East Delhi', 10)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (135, N'North West Delhi', 10)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (136, N'South Delhi', 10)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (137, N'South West Delhi', 10)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (138, N'West Delhi', 10)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (139, N'North Goa', 11)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (140, N'South Goa', 11)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (141, N'Ahmedabad', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (142, N'Amreli', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (143, N'Anand', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (144, N'Aravalli', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (145, N'Banaskantha (Palanpur)', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (146, N'Bharuch', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (147, N'Bhavnagar', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (148, N'Botad', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (149, N'Chhota Udepur', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (150, N'Dahod', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (151, N'Dangs (Ahwa)', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (152, N'Devbhoomi Dwarka', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (153, N'Gandhinagar', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (154, N'Gir Somnath', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (155, N'Jamnagar', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (156, N'Junagadh', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (157, N'Kachchh', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (158, N'Kheda (Nadiad)', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (159, N'Mahisagar', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (160, N'Mehsana', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (161, N'Morbi', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (162, N'Narmada (Rajpipla)', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (163, N'Navsari', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (164, N'Panchmahal (Godhra)', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (165, N'Patan', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (166, N'Porbandar', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (167, N'Rajkot', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (168, N'Sabarkantha (Himmatnagar)', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (169, N'Surat', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (170, N'Surendranagar', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (171, N'Tapi (Vyara)', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (172, N'Vadodara', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (173, N'Valsad', 12)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (174, N'Ambala', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (175, N'Bhiwani', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (176, N'Faridabad', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (177, N'Fatehabad', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (178, N'Gurgaon', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (179, N'Hisar', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (180, N'Jhajjar', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (181, N'Jind', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (182, N'Kaithal', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (183, N'Karnal', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (184, N'Kurukshetra', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (185, N'Mahendragarh', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (186, N'Mewat', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (187, N'Palwal', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (188, N'Panchkula', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (189, N'Panipat', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (190, N'Rewari', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (191, N'Rohtak', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (192, N'Sirsa', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (193, N'Sonipat', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (194, N'Yamunanagar', 13)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (195, N'Bilaspur', 14)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (196, N'Chamba', 14)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (197, N'Hamirpur', 14)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (198, N'Kangra', 14)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (199, N'Kinnaur', 14)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (200, N'Kullu', 14)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (201, N'Lahaul & Spiti', 14)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (202, N'Mandi', 14)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (203, N'Shimla', 14)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (204, N'Sirmaur (Sirmour)', 14)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (205, N'Solan', 14)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (206, N'Una', 14)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (207, N'Anantnag', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (208, N'Bandipora', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (209, N'Baramulla', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (210, N'Budgam', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (211, N'Doda', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (212, N'Ganderbal', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (213, N'Jammu', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (214, N'Kargil', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (215, N'Kathua', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (216, N'Kishtwar', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (217, N'Kulgam', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (218, N'Kupwara', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (219, N'Leh', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (220, N'Poonch', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (221, N'Pulwama', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (222, N'Rajouri', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (223, N'Ramban', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (224, N'Reasi', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (225, N'Samba', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (226, N'Shopian', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (227, N'Srinagar', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (228, N'Udhampur', 15)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (229, N'Bokaro', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (230, N'Chatra', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (231, N'Deoghar', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (232, N'Dhanbad', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (233, N'Dumka', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (234, N'East Singhbhum', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (235, N'Garhwa', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (236, N'Giridih', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (237, N'Godda', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (238, N'Gumla', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (239, N'Hazaribag', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (240, N'Jamtara', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (241, N'Khunti', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (242, N'Koderma', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (243, N'Latehar', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (244, N'Lohardaga', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (245, N'Pakur', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (246, N'Palamu', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (247, N'Ramgarh', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (248, N'Ranchi', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (249, N'Sahibganj', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (250, N'Seraikela-Kharsawan', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (251, N'Simdega', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (252, N'West Singhbhum', 16)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (253, N'Bagalkot', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (254, N'Bangalore Rural', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (255, N'Bangalore Urban', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (256, N'Belgaum', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (257, N'Bellary', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (258, N'Bidar', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (259, N'Bijapur', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (260, N'Chamarajanagar', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (261, N'Chickmagalur', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (262, N'Chikballapur', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (263, N'Chitradurga', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (264, N'Dakshina Kannada', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (265, N'Davangere', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (266, N'Dharwad', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (267, N'Gadag', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (268, N'Gulbarga', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (269, N'Hassan', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (270, N'Haveri', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (271, N'Kodagu', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (272, N'Kolar', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (273, N'Koppal', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (274, N'Mandya', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (275, N'Mysore', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (276, N'Raichur', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (277, N'Ramnagara', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (278, N'Shimoga', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (279, N'Tumkur', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (280, N'Udupi', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (281, N'Uttara Kannada (Karwar)', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (282, N'Yadgir', 17)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (283, N'Alappuzha', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (284, N'Ernakulam', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (285, N'Idukki', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (286, N'Kannur', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (287, N'Kasaragod', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (288, N'Kollam', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (289, N'Kottayam', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (290, N'Kozhikode', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (291, N'Malappuram', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (292, N'Palakkad', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (293, N'Pathanamthitta', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (294, N'Thiruvananthapuram', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (295, N'Thrissur', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (296, N'Wayanad', 18)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (297, N'Lakshadweep', 19)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (298, N'Alirajpur', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (299, N'Anuppur', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (300, N'Ashoknagar', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (301, N'Balaghat', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (302, N'Barwani', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (303, N'Betul', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (304, N'Bhind', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (305, N'Bhopal', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (306, N'Burhanpur', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (307, N'Chhatarpur', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (308, N'Chhindwara', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (309, N'Damoh', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (310, N'Datia', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (311, N'Dewas', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (312, N'Dhar', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (313, N'Dindori', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (314, N'Guna', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (315, N'Gwalior', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (316, N'Harda', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (317, N'Hoshangabad', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (318, N'Indore', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (319, N'Jabalpur', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (320, N'Jhabua', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (321, N'Katni', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (322, N'Khandwa', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (323, N'Khargone', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (324, N'Mandla', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (325, N'Mandsaur', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (326, N'Morena', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (327, N'Narsinghpur', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (328, N'Neemuch', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (329, N'Panna', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (330, N'Raisen', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (331, N'Rajgarh', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (332, N'Ratlam', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (333, N'Rewa', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (334, N'Sagar', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (335, N'Satna', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (336, N'Sehore', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (337, N'Seoni', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (338, N'Shahdol', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (339, N'Shajapur', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (340, N'Sheopur', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (341, N'Shivpuri', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (342, N'Sidhi', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (343, N'Singrauli', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (344, N'Tikamgarh', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (345, N'Ujjain', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (346, N'Umaria', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (347, N'Vidisha', 20)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (348, N'Ahmednagar', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (349, N'Akola', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (350, N'Amravati', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (351, N'Aurangabad', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (352, N'Beed', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (353, N'Bhandara', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (354, N'Buldhana', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (355, N'Chandrapur', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (356, N'Dhule', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (357, N'Gadchiroli', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (358, N'Gondia', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (359, N'Hingoli', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (360, N'Jalgaon', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (361, N'Jalna', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (362, N'Kolhapur', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (363, N'Latur', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (364, N'Mumbai City', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (365, N'Mumbai Suburban', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (366, N'Nagpur', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (367, N'Nanded', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (368, N'Nandurbar', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (369, N'Nashik', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (370, N'Osmanabad', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (371, N'Parbhani', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (372, N'Pune', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (373, N'Raigad', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (374, N'Ratnagiri', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (375, N'Sangli', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (376, N'Satara', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (377, N'Sindhudurg', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (378, N'Solapur', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (379, N'Thane', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (380, N'Wardha', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (381, N'Washim', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (382, N'Yavatmal', 21)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (383, N'Bishnupur', 22)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (384, N'Chandel', 22)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (385, N'Churachandpur', 22)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (386, N'Imphal East', 22)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (387, N'Imphal West', 22)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (388, N'Senapati', 22)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (389, N'Tamenglong', 22)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (390, N'Thoubal', 22)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (391, N'Ukhrul', 22)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (392, N'East Garo Hills', 23)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (393, N'East Jaintia Hills', 23)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (394, N'East Khasi Hills', 23)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (395, N'North Garo Hills', 23)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (396, N'Ri Bhoi', 23)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (397, N'South Garo Hills', 23)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (398, N'South West Garo Hills', 23)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (399, N'South West Khasi Hills', 23)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (400, N'West Garo Hills', 23)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (401, N'West Jaintia Hills', 23)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (402, N'West Khasi Hills', 23)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (403, N'Aizawl', 24)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (404, N'Champhai', 24)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (405, N'Kolasib', 24)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (406, N'Lawngtlai', 24)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (407, N'Lunglei', 24)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (408, N'Mamit', 24)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (409, N'Saiha', 24)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (410, N'Serchhip', 24)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (411, N'Dimapur', 25)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (412, N'Kiphire', 25)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (413, N'Kohima', 25)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (414, N'Longleng', 25)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (415, N'Mokokchung', 25)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (416, N'Mon', 25)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (417, N'Peren', 25)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (418, N'Phek', 25)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (419, N'Tuensang', 25)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (420, N'Wokha', 25)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (421, N'Zunheboto', 25)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (422, N'Angul', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (423, N'Balangir', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (424, N'Balasore', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (425, N'Bargarh', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (426, N'Bhadrak', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (427, N'Boudh', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (428, N'Cuttack', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (429, N'Deogarh', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (430, N'Dhenkanal', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (431, N'Gajapati', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (432, N'Ganjam', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (433, N'Jagatsinghapur', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (434, N'Jajpur', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (435, N'Jharsuguda', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (436, N'Kalahandi', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (437, N'Kandhamal', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (438, N'Kendrapara', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (439, N'Kendujhar (Keonjhar)', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (440, N'Khordha', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (441, N'Koraput', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (442, N'Malkangiri', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (443, N'Mayurbhanj', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (444, N'Nabarangpur', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (445, N'Nayagarh', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (446, N'Nuapada', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (447, N'Puri', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (448, N'Rayagada', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (449, N'Sambalpur', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (450, N'Sonepur', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (451, N'Sundargarh', 26)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (452, N'Karaikal', 27)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (453, N'Mahe', 27)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (454, N'Pondicherry', 27)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (455, N'Yanam', 27)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (456, N'Amritsar', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (457, N'Barnala', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (458, N'Bathinda', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (459, N'Faridkot', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (460, N'Fatehgarh Sahib', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (461, N'Fazilka', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (462, N'Ferozepur', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (463, N'Gurdaspur', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (464, N'Hoshiarpur', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (465, N'Jalandhar', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (466, N'Kapurthala', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (467, N'Ludhiana', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (468, N'Mansa', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (469, N'Moga', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (470, N'Muktsar', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (471, N'Nawanshahr', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (472, N'Pathankot', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (473, N'Patiala', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (474, N'Rupnagar', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (475, N'Sangrur', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (476, N'SAS Nagar (Mohali)', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (477, N'Tarn Taran', 28)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (478, N'Ajmer', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (479, N'Alwar', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (480, N'Banswara', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (481, N'Baran', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (482, N'Barmer', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (483, N'Bharatpur', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (484, N'Bhilwara', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (485, N'Bikaner', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (486, N'Bundi', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (487, N'Chittorgarh', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (488, N'Churu', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (489, N'Dausa', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (490, N'Dholpur', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (491, N'Dungarpur', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (492, N'Hanumangarh', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (493, N'Jaipur', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (494, N'Jaisalmer', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (495, N'Jalore', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (496, N'Jhalawar', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (497, N'Jhunjhunu', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (498, N'Jodhpur', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (499, N'Karauli', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (500, N'Kota', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (501, N'Nagaur', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (502, N'Pali', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (503, N'Pratapgarh', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (504, N'Rajsamand', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (505, N'Sawai Madhopur', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (506, N'Sikar', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (507, N'Sirohi', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (508, N'Sri Ganganagar', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (509, N'Tonk', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (510, N'Udaipur', 29)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (511, N'East Sikkim', 30)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (512, N'North Sikkim', 30)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (513, N'South Sikkim', 30)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (514, N'West Sikkim', 30)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (515, N'Ariyalur', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (516, N'Chennai', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (517, N'Coimbatore', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (518, N'Cuddalore', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (519, N'Dharmapuri', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (520, N'Dindigul', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (521, N'Erode', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (522, N'Kanchipuram', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (523, N'Kanyakumari', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (524, N'Karur', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (525, N'Krishnagiri', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (526, N'Madurai', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (527, N'Nagapattinam', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (528, N'Namakkal', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (529, N'Nilgiris', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (530, N'Perambalur', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (531, N'Pudukkottai', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (532, N'Ramanathapuram', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (533, N'Salem', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (534, N'Sivaganga', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (535, N'Thanjavur', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (536, N'Theni', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (537, N'Thoothukudi (Tuticorin)', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (538, N'Tiruchirappalli', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (539, N'Tirunelveli', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (540, N'Tiruppur', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (541, N'Tiruvallur', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (542, N'Tiruvannamalai', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (543, N'Tiruvarur', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (544, N'Vellore', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (545, N'Viluppuram', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (546, N'Virudhunagar', 31)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (547, N'Adilabad', 32)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (548, N'Hyderabad', 32)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (549, N'Karimnagar', 32)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (550, N'Khammam', 32)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (551, N'Mahabubnagar', 32)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (552, N'Medak', 32)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (553, N'Nalgonda', 32)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (554, N'Nizamabad', 32)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (555, N'Rangareddy', 32)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (556, N'Warangal', 32)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (557, N'Dhalai', 33)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (558, N'Gomati', 33)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (559, N'Khowai', 33)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (560, N'North Tripura', 33)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (561, N'Sepahijala', 33)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (562, N'South Tripura', 33)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (563, N'Unakoti', 33)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (564, N'West Tripura', 33)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (565, N'Agra', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (566, N'Aligarh', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (567, N'Allahabad', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (568, N'Ambedkar Nagar', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (569, N'Auraiya', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (570, N'Azamgarh', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (571, N'Baghpat', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (572, N'Bahraich', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (573, N'Ballia', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (574, N'Balrampur', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (575, N'Banda', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (576, N'Barabanki', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (577, N'Bareilly', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (578, N'Basti', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (579, N'Bhim Nagar', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (580, N'Bijnor', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (581, N'Budaun', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (582, N'Bulandshahr', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (583, N'Chandauli', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (584, N'Chatrapati Sahuji Mahraj Nagar', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (585, N'Chitrakoot', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (586, N'Deoria', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (587, N'Etah', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (588, N'Etawah', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (589, N'Faizabad', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (590, N'Farrukhabad', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (591, N'Fatehpur', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (592, N'Firozabad', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (593, N'Gautam Buddha Nagar', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (594, N'Ghaziabad', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (595, N'Ghazipur', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (596, N'Gonda', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (597, N'Gorakhpur', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (598, N'Hamirpur', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (599, N'Hardoi', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (600, N'Hathras', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (601, N'Jalaun', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (602, N'Jaunpur', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (603, N'Jhansi', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (604, N'Jyotiba Phule Nagar (J.P. Nagar)', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (605, N'Kannauj', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (606, N'Kanpur Dehat', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (607, N'Kanpur Nagar', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (608, N'Kanshiram Nagar (Kasganj)', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (609, N'Kaushambi', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (610, N'Kushinagar (Padrauna)', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (611, N'Lakhimpur - Kheri', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (612, N'Lalitpur', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (613, N'Lucknow', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (614, N'Maharajganj', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (615, N'Mahoba', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (616, N'Mainpuri', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (617, N'Mathura', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (618, N'Mau', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (619, N'Meerut', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (620, N'Mirzapur', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (621, N'Moradabad', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (622, N'Muzaffarnagar', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (623, N'Panchsheel Nagar', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (624, N'Pilibhit', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (625, N'Prabuddh Nagar', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (626, N'Pratapgarh', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (627, N'RaeBareli', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (628, N'Rampur', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (629, N'Saharanpur', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (630, N'Sant Kabir Nagar', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (631, N'Sant Ravidas Nagar', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (632, N'Shahjahanpur', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (633, N'Shravasti', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (634, N'Siddharth Nagar', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (635, N'Sitapur', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (636, N'Sonbhadra', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (637, N'Sultanpur', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (638, N'Unnao', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (639, N'Varanasi', 34)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (640, N'Almora', 35)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (641, N'Bageshwar', 35)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (642, N'Chamoli', 35)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (643, N'Champawat', 35)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (644, N'Dehradun', 35)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (645, N'Haridwar', 35)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (646, N'Nainital', 35)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (647, N'Pauri Garhwal', 35)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (648, N'Pithoragarh', 35)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (649, N'Rudraprayag', 35)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (650, N'Tehri Garhwal', 35)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (651, N'Udham Singh Nagar', 35)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (652, N'Uttarkashi', 35)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (653, N'Bankura', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (654, N'Birbhum', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (655, N'Burdwan (Bardhaman)', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (656, N'Cooch Behar', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (657, N'Dakshin Dinajpur (South Dinajpur)', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (658, N'Darjeeling', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (659, N'Hooghly', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (660, N'Howrah', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (661, N'Jalpaiguri', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (662, N'Kolkata', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (663, N'Malda', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (664, N'Murshidabad', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (665, N'Nadia', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (666, N'North 24 Parganas', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (667, N'Paschim Medinipur (West Medinipur)', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (668, N'Purba Medinipur (East Medinipur)', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (669, N'Purulia', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (670, N'South 24 Parganas', 36)
GO
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [StateId]) VALUES (671, N'Uttar Dinajpur (North Dinajpur)', 36)
GO
SET IDENTITY_INSERT [dbo].[Districts] OFF
GO

SET IDENTITY_INSERT [dbo].[SubRegions] ON 

GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1, N'Car Nicobar', 1)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2, N'Nancowry', 1)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3, N'Great Nicobar', 1)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4, N'Diglipur', 2)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5, N'Mayabunder', 2)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (6, N'Rangat', 2)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (7, N'Ferrargunj', 3)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (8, N'Port Blair', 3)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (9, N'Little Andaman', 3)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (10, N'Hayuliang', 17)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (11, N'Manchal', 17)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (12, N'Goiliang', 17)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (13, N'Chaglagam', 17)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (14, N'Metengliang', 17)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (15, N'Kibithoo', 17)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (16, N'Walong', 17)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (17, N'Hawai', 17)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (18, N'Khimiyong', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (19, N'Yatdam', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (20, N'Changlang', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (21, N'Namtok', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (22, N'Manmao', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (23, N'Renuk', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (24, N'Lyngok-Longtoi', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (25, N'Nampong', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (26, N'Tikhak Rima Putok', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (27, N'Jairampur', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (28, N'Vijoynagar', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (29, N'Miao', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (30, N'Kharsang', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (31, N'Diyun', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (32, N'Bordumsa', 18)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (33, N'Mipi', 19)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (34, N'Anini', 19)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (35, N'Etalin', 19)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (36, N'Anelih', 19)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (37, N'Kronli (Arzoo circle)', 19)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (38, N'Seijosa', 20)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (39, N'Dissing-Passo', 20)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (40, N'Pakke-Kessang', 20)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (41, N'Pizirang(Veo)', 20)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (42, N'Richukrong', 20)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (43, N'Seppa', 20)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (44, N'Lada', 20)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (45, N'Bameng', 20)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (46, N'Pipu-Dipu', 20)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (47, N'Gyawe Purang', 20)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (48, N'Khenewa', 20)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (49, N'Chayangtajo', 20)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (50, N'Sawa', 20)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (51, N'Boleng', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (52, N'Riga', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (53, N'Pangin', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (54, N'Kebang', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (55, N'Rebo-Perging', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (56, N'Koyu', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (57, N'Kora', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (58, N'Nari', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (59, N'New Seren', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (60, N'Bilat', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (61, N'Ruksin', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (62, N'Sille-Oyan', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (63, N'Pasighat', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (64, N'Mebo', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (65, N'Namsing', 21)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (66, N'Palin', 22)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (67, N'Yangte', 22)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (68, N'Sangram', 22)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (69, N'Nyapin', 22)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (70, N'Phassang', 22)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (71, N'Koloriang', 22)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (72, N'Chambang', 22)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (73, N'Gangte', 22)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (74, N'Tarak-Lengdi', 22)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (75, N'Sarli', 22)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (76, N'Parsi-Parlo', 22)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (77, N'Damin', 22)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (78, N'Longding Koling (Pipsorang)', 22)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (79, N'Tali', 22)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (80, N'Sunpura', 23)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (81, N'Tezu', 23)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (82, N'Wakro', 23)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (83, N'Chongkham', 23)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (84, N'Namsai', 23)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (85, N'Lathao', 23)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (86, N'Piyong', 23)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (87, N'Lekang (Mahadevpur)', 23)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (88, N'Hunli', 25)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (89, N'Desali', 25)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (90, N'Roing', 25)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (91, N'Dambuk', 25)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (92, N'Tinali ( Paglam )', 25)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (93, N'Koronu', 25)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (94, N'Dollungmukh', 26)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (95, N'Raga', 26)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (96, N'Ziro (Sadar)', 26)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (97, N'Old Ziro', 26)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (98, N'Yachuli', 26)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (99, N'Yazali', 26)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (100, N'Pistana', 26)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (101, N'Kamporijo', 26)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (102, N'Balijan', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (103, N'Banderdawa', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (104, N'Sangdupota (Besar Nello)', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (105, N'Taraso', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (106, N'Itanagar', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (107, N'Naharlagun', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (108, N'Doimukh', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (109, N'Gumto', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (110, N'Toru', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (111, N'Sagalee', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (112, N'Parang', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (113, N'Leporiang', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (114, N'Mengio', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (115, N'Kimin', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (116, N'Kakoi', 27)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (117, N'Zemithang', 28)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (118, N'Lumla', 28)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (119, N'Dudunghar', 28)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (120, N'Tawang', 28)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (121, N'Kitpi', 28)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (122, N'Jang', 28)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (123, N'Lhou', 28)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (124, N'Mukto', 28)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (125, N'Bongkhar', 28)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (126, N'Thingbu', 28)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (127, N'Namsang', 29)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (128, N'Soha', 29)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (129, N'Khonsa', 29)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (130, N'Dadam', 29)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (131, N'Kanubari', 29)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (132, N'Lawnu', 29)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (133, N'Longding', 29)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (134, N'Pumao', 29)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (135, N'Pangchao', 29)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (136, N'Wakka', 29)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (137, N'Laju', 29)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (138, N'Tuting', 30)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (139, N'Migging', 30)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (140, N'Palling', 30)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (141, N'Gelling', 30)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (142, N'Singa', 30)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (143, N'Yingkiong', 30)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (144, N'Jengging', 30)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (145, N'Geku', 30)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (146, N'Mariyang', 30)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (147, N'Mopom ( Adipasi )', 30)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (148, N'Katan', 30)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (149, N'Taksing', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (150, N'Limeking', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (151, N'Nacho', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (152, N'Siyum', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (153, N'Taliha', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (154, N'Payeng', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (155, N'Giba', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (156, N'Chetam (Peer Yapu)', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (157, N'Daporijo', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (158, N'Puchi Geko', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (159, N'Dumporijo', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (160, N'Gussar', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (161, N'Gite-Ripa', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (162, N'Baririjo', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (163, N'Maro', 31)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (164, N'Dirang', 32)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (165, N'Thembang', 32)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (166, N'Nafra', 32)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (167, N'Bomdila', 32)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (168, N'Kalaktang', 32)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (169, N'Shergaon', 32)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (170, N'Rupa', 32)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (171, N'Singchung', 32)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (172, N'Jamiri', 32)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (173, N'Thrizino', 32)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (174, N'Bhalukpong', 32)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (175, N'Kamengbari-Doimara', 32)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (176, N'Balemu', 32)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (177, N'Mechuka', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (178, N'Monigong', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (179, N'Pidi', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (180, N'Payum', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (181, N'Tato', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (182, N'Kaying', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (183, N'Darak', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (184, N'Kamba', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (185, N'Rumgong', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (186, N'Jomlo Mobuk', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (187, N'Liromoba', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (188, N'Yomcha', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (189, N'Aalo', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (190, N'Tirbin', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (191, N'Basar', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (192, N'Daring', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (193, N'Gensi', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (194, N'Sibe', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (195, N'Likabali', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (196, N'Kangku', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (197, N'Bagra', 33)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (198, N'Barnagar (Pt)', 34)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (199, N'Bajali (Pt)', 34)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (200, N'Sarupeta (Pt)', 34)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (201, N'Jalah (Pt)', 34)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (202, N'Goreswar (Pt)', 34)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (203, N'Rangia (Pt)', 34)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (204, N'Barama (Pt)', 34)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (205, N'Tihu (Pt)', 34)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (206, N'Ghograpar (Pt)', 34)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (207, N'Baska', 34)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (208, N'Baganpara (Pt)', 34)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (209, N'Tamulpur', 34)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (210, N'Pathorighat (Pt)', 34)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (211, N'Barnagar (Pt)', 35)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (212, N'Kalgachia', 35)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (213, N'Baghbor', 35)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (214, N'Chenga', 35)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (215, N'Barpeta', 35)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (216, N'Sarthebari', 35)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (217, N'Bajali (Pt)', 35)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (218, N'Sarupeta (Pt)', 35)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (219, N'Jalah (Pt)', 35)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (220, N'Boitamari', 36)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (221, N'Srijangram', 36)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (222, N'Bijni (Pt)', 36)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (223, N'Sidli (Pt)', 36)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (224, N'Bongaigaon (Pt)', 36)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (225, N'Katigora', 37)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (226, N'Silchar', 37)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (227, N'Udarbond', 37)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (228, N'Sonai', 37)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (229, N'Lakhipur', 37)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (230, N'Kokrajhar (Pt)', 38)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (231, N'Bengtol', 38)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (232, N'Sidli (Pt)', 38)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (233, N'Bongaigaon (Pt)', 38)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (234, N'Bijni (Pt)', 38)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (235, N'Barnagar (Pt)', 38)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (236, N'Khoirabari (Pt)', 39)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (237, N'Pathorighat (Pt)', 39)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (238, N'Sipajhar', 39)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (239, N'Mangaldoi (Pt)', 39)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (240, N'Kalaigaon (Pt)', 39)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (241, N'Dalgaon (Pt)', 39)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (242, N'Dhemaji', 40)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (243, N'Sissibargaon', 40)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (244, N'Jonai', 40)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (245, N'Dhakuakhana (Pt-I)', 40)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (246, N'Subansiri (Pt-I)', 40)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (247, N'Gogamukh', 40)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (248, N'Gossaigaon (Pt)', 41)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (249, N'Agamoni', 41)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (250, N'Golokganj (Pt)', 41)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (251, N'Dhubri (Pt)', 41)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (252, N'Bagribari (Pt)', 41)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (253, N'Bilasipara (Pt)', 41)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (254, N'Chapar (Pt)', 41)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (255, N'South Salmara', 41)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (256, N'Mankachar', 41)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (257, N'Dibrugarh West', 42)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (258, N'Dibrugarh East', 42)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (259, N'Chabua', 42)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (260, N'Tengakhat', 42)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (261, N'Moran', 42)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (262, N'Tingkhong', 42)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (263, N'Naharkatiya', 42)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (264, N'Umrangso', 43)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (265, N'Haflong', 43)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (266, N'Mahur', 43)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (267, N'Maibong', 43)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (268, N'Lakhipur', 44)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (269, N'Balijana', 44)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (270, N'Matia', 44)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (271, N'Dudhnai', 44)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (272, N'Rangjuli', 44)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (273, N'Bokakhat', 45)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (274, N'Khumtai', 45)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (275, N'Dergaon', 45)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (276, N'Golaghat', 45)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (277, N'Morangi', 45)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (278, N'Sarupathar', 45)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (279, N'Algapur', 46)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (280, N'Hailakandi', 46)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (281, N'Lala', 46)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (282, N'Katlichara', 46)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (283, N'Majuli', 47)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (284, N'Jorhat West', 47)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (285, N'Jorhat East', 47)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (286, N'Teok', 47)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (287, N'Titabor', 47)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (288, N'Mariani', 47)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (289, N'Azara', 48)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (290, N'North Guwahati (Pt)', 48)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (291, N'Guwahati', 48)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (292, N'Dispur', 48)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (293, N'Sonapur', 48)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (294, N'Chandrapur', 48)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (295, N'Goreswar (Pt)', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (296, N'Rangia (Pt)', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (297, N'Koya', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (298, N'Kamalpur', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (299, N'Hajo', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (300, N'Chhaygaon', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (301, N'Goroimari', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (302, N'Chamaria', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (303, N'Nagarbera', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (304, N'Boko', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (305, N'Palasbari', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (306, N'North Guwahati (Pt)', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (307, N'Donka', 50)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (308, N'Diphu', 50)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (309, N'Phuloni', 50)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (310, N'Silonijan', 50)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (311, N'Karimganj', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (312, N'Badarpur', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (313, N'Nilambazar', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (314, N'Patharkandi', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (315, N'Ramkrishna Nagar', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (316, N'Gossaigaon (Pt)', 52)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (317, N'Bhowraguri', 52)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (318, N'Dotoma', 52)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (319, N'Kokrajhar (Pt)', 52)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (320, N'Golokganj (Pt)', 52)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (321, N'Dhubri (Pt)', 52)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (322, N'Bagribari (Pt)', 52)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (323, N'Bilasipara (Pt)', 52)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (324, N'Chapar (Pt)', 52)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (325, N'Narayanpur', 53)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (326, N'Bihpuria', 53)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (327, N'Naobaicha', 53)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (328, N'Kadam', 53)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (329, N'North Lakhimpur', 53)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (330, N'Dhakuakhana (Pt)', 53)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (331, N'Subansiri (Pt)', 53)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (332, N'Mayong', 54)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (333, N'Bhuragaon', 54)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (334, N'Laharighat', 54)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (335, N'Marigaon', 54)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (336, N'Mikirbheta', 54)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (337, N'Kaliabor', 55)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (338, N'Samaguri', 55)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (339, N'Rupahi', 55)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (340, N'Dhing', 55)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (341, N'Nagaon', 55)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (342, N'Raha', 55)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (343, N'Kampur', 55)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (344, N'Hojai', 55)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (345, N'Doboka', 55)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (346, N'Lanka', 55)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (347, N'Barama (Pt)', 56)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (348, N'Tihu (Pt)', 56)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (349, N'Pachim Nalbari', 56)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (350, N'Barkhetri', 56)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (351, N'Barbhag', 56)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (352, N'Nalbari', 56)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (353, N'Banekuchi', 56)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (354, N'Ghograpar (Pt)', 56)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (355, N'Baganpara (Pt)', 56)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (356, N'Dimow', 57)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (357, N'Sibsagar', 57)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (358, N'Amguri', 57)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (359, N'Nazira', 57)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (360, N'Sonari', 57)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (361, N'Mahmora', 57)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (362, N'Dhekiajuli (Pt)', 58)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (363, N'Chariduar', 58)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (364, N'Tezpur', 58)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (365, N'Na-Duar', 58)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (366, N'Biswanath', 58)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (367, N'Helem', 58)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (368, N'Gohpur', 58)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (369, N'Sadiya', 59)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (370, N'Doom Dooma', 59)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (371, N'Tinsukia', 59)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (372, N'Margherita', 59)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (373, N'Khoirabari (Pt)', 60)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (374, N'Pathorighat (Pt)', 60)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (375, N'Mangaldoi (Pt)', 60)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (376, N'Kalaigaon (Pt)', 60)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (377, N'Dalgaon (Pt)', 60)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (378, N'Harisinga', 60)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (379, N'Udalguri', 60)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (380, N'Mazbat', 60)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (381, N'Dhekiajuli (Pt)', 60)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (382, N'Narpatganj', 61)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (383, N'Forbesganj', 61)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (384, N'Bhargama', 61)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (385, N'Raniganj', 61)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (386, N'Araria', 61)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (387, N'Kursakatta', 61)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (388, N'Sikti', 61)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (389, N'Palasi', 61)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (390, N'Jokihat', 61)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (391, N'Arwal', 62)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (392, N'Kaler', 62)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (393, N'Karpi', 62)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (394, N'Sonbhadra Banshi Suryapur', 62)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (395, N'Kurtha', 62)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (396, N'Daudnagar', 63)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (397, N'Haspura', 63)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (398, N'Goh', 63)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (399, N'Rafiganj', 63)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (400, N'Obra', 63)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (401, N'Aurangabad', 63)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (402, N'Barun', 63)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (403, N'Nabinagar', 63)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (404, N'Kutumba', 63)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (405, N'Deo', 63)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (406, N'Madanpur', 63)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (407, N'Shambhuganj', 64)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (408, N'Amarpur', 64)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (409, N'Rajaun', 64)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (410, N'Dhuraiya', 64)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (411, N'Barahat', 64)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (412, N'Banka', 64)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (413, N'Phulidumar', 64)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (414, N'Belhar', 64)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (415, N'Chanan', 64)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (416, N'Katoria', 64)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (417, N'Bausi', 64)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (418, N'Khudabandpur', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (419, N'Chhorahi', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (420, N'Garhpura', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (421, N'Cheria Bariarpur', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (422, N'Bhagwanpur', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (423, N'Mansurchak', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (424, N'Bachhwara', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (425, N'Teghra', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (426, N'Barauni', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (427, N'Birpur', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (428, N'Begusarai', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (429, N'Naokothi', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (430, N'Bakhri', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (431, N'Dandari', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (432, N'Sahebpur Kamal', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (433, N'Balia', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (434, N'Matihani', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (435, N'Shamho Akha Kurha', 65)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (436, N'Narayanpur', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (437, N'Bihpur', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (438, N'Kharik', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (439, N'Naugachhia', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (440, N'Rangra Chowk', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (441, N'Gopalpur', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (442, N'Pirpainti', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (443, N'Colgong', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (444, N'Ismailpur', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (445, N'Sabour', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (446, N'Nathnagar', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (447, N'Sultanganj', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (448, N'Shahkund', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (449, N'Goradih', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (450, N'Jagdishpur', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (451, N'Sonhaula', 66)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (452, N'Shahpur', 67)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (453, N'Arrah', 67)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (454, N'Barhara', 67)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (455, N'Koilwar', 67)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (456, N'Sandesh', 67)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (457, N'Udwant Nagar', 67)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (458, N'Behea', 67)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (459, N'Jagdishpur', 67)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (460, N'Piro', 67)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (461, N'Charpokhari', 67)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (462, N'Garhani', 67)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (463, N'Agiaon', 67)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (464, N'Tarari', 67)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (465, N'Sahar', 67)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (466, N'Simri', 68)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (467, N'Chakki', 68)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (468, N'Barhampur', 68)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (469, N'Chaugain', 68)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (470, N'Kesath', 68)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (471, N'Dumraon', 68)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (472, N'Buxar', 68)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (473, N'Chausa', 68)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (474, N'Rajpur', 68)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (475, N'Itarhi', 68)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (476, N'Nawanagar', 68)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (477, N'Jale', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (478, N'Singhwara', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (479, N'Keotiranway', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (480, N'Darbhanga', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (481, N'Manigachhi', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (482, N'Tardih', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (483, N'Alinagar', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (484, N'Benipur', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (485, N'Bahadurpur', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (486, N'Hanumannagar', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (487, N'Hayaghat', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (488, N'Baheri', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (489, N'Biraul', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (490, N'Ghanshyampur', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (491, N'Kiratpur', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (492, N'Gora Bauram', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (493, N'Kusheshwar Asthan', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (494, N'Kusheshwar Asthan Purbi', 69)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (495, N'Raxaul', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (496, N'Adapur', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (497, N'Ramgarhwa', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (498, N'Sugauli', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (499, N'Banjaria', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (500, N'Narkatia', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (501, N'Bankatwa', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (502, N'Ghorasahan', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (503, N'Dhaka', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (504, N'Chiraia', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (505, N'Motihari', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (506, N'Turkaulia', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (507, N'Harsidhi', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (508, N'Paharpur', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (509, N'Areraj', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (510, N'Sangrampur', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (511, N'Kesaria', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (512, N'Kalyanpur', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (513, N'Kotwa', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (514, N'Piprakothi', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (515, N'Chakia(Pipra)', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (516, N'Pakri Dayal', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (517, N'Patahi', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (518, N'Phenhara', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (519, N'Madhuban', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (520, N'Tetaria', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (521, N'Mehsi', 70)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (522, N'Konch', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (523, N'Tikari', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (524, N'Belaganj', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (525, N'Khizirsarai', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (526, N'Neem Chak Bathani', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (527, N'Muhra', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (528, N'Atri', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (529, N'Manpur', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (530, N'Gaya Town C.D.Block', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (531, N'Paraiya', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (532, N'Guraru', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (533, N'Gurua', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (534, N'Amas', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (535, N'Banke Bazar', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (536, N'Imamganj', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (537, N'Dumaria', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (538, N'Sherghati', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (539, N'Dobhi', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (540, N'Bodh Gaya', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (541, N'Tan Kuppa', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (542, N'Wazirganj', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (543, N'Fatehpur', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (544, N'Mohanpur', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (545, N'Barachatti', 71)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (546, N'Katiya', 72)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (547, N'Bijaipur', 72)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (548, N'Bhorey', 72)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (549, N'Pach Deuri', 72)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (550, N'Kuchaikote', 72)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (551, N'Phulwaria', 72)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (552, N'Hathua', 72)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (553, N'Uchkagaon', 72)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (554, N'Thawe', 72)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (555, N'Gopalganj', 72)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (556, N'Manjha', 72)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (557, N'Barauli', 72)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (558, N'Sidhwalia', 72)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (559, N'Baikunthpur', 72)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (560, N'Islamnagar Aliganj', 73)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (561, N'Sikandra', 73)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (562, N'Jamui', 73)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (563, N'Barhat', 73)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (564, N'Lakshmipur', 73)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (565, N'Jhajha', 73)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (566, N'Gidhaur', 73)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (567, N'Khaira', 73)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (568, N'Sono', 73)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (569, N'Chakai', 73)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (570, N'Ratni Faridpur', 74)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (571, N'Jehanabad', 74)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (572, N'Kako', 74)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (573, N'Modanganj', 74)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (574, N'Ghoshi', 74)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (575, N'Makhdumpur', 74)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (576, N'Hulasganj', 74)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (577, N'Ramgarh', 75)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (578, N'Nuaon', 75)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (579, N'Kudra', 75)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (580, N'Mohania', 75)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (581, N'Durgawati', 75)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (582, N'Chand', 75)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (583, N'Chainpur', 75)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (584, N'Bhabua', 75)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (585, N'Rampur', 75)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (586, N'Bhagwanpur', 75)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (587, N'Adhaura', 75)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (588, N'Falka', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (589, N'Korha', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (590, N'Hasanganj', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (591, N'Kadwa', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (592, N'Balrampur', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (593, N'Barsoi', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (594, N'Azamnagar', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (595, N'Pranpur', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (596, N'Dandkhora', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (597, N'Katihar', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (598, N'Mansahi', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (599, N'Barari', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (600, N'Sameli', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (601, N'Kursela', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (602, N'Manihari', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (603, N'Amdabad', 76)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (604, N'Alauli', 77)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (605, N'Khagaria', 77)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (606, N'Mansi', 77)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (607, N'Chautham', 77)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (608, N'Beldaur', 77)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (609, N'Gogri', 77)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (610, N'Parbatta', 77)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (611, N'Terhagachh', 78)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (612, N'Dighalbank', 78)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (613, N'Thakurganj', 78)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (614, N'Pothia', 78)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (615, N'Bahadurganj', 78)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (616, N'Kochadhamin', 78)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (617, N'Kishanganj', 78)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (618, N'Barahiya', 79)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (619, N'Pipariya', 79)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (620, N'Surajgarha', 79)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (621, N'Lakhisarai', 79)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (622, N'Chanan*', 79)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (623, N'Ramgarh Chowk', 79)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (624, N'Halsi', 79)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (625, N'Gamharia', 80)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (626, N'Singheshwar', 80)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (627, N'Ghailarh', 80)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (628, N'Madhepura', 80)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (629, N'Shankarpur', 80)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (630, N'Kumarkhand', 80)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (631, N'Murliganj', 80)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (632, N'Gwalpara', 80)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (633, N'Bihariganj', 80)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (634, N'Kishanganj', 80)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (635, N'Puraini', 80)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (636, N'Alamnagar', 80)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (637, N'Chausa', 80)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (638, N'Rajnagar', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (639, N'Andhratharhi', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (640, N'Jhanjharpur', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (641, N'Ghoghardiha', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (642, N'Lakhnaur', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (643, N'Madhepur', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (644, N'Madhwapur', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (645, N'Harlakhi', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (646, N'Basopatti', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (647, N'Jainagar', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (648, N'Ladania', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (649, N'Laukaha', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (650, N'Laukahi', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (651, N'Phulparas', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (652, N'Babubarhi', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (653, N'Khajauli', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (654, N'Kaluahi', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (655, N'Benipatti', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (656, N'Bisfi', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (657, N'Madhubani', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (658, N'Pandaul', 81)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (659, N'Munger', 82)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (660, N'Bariarpur', 82)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (661, N'Jamalpur', 82)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (662, N'Dharhara', 82)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (663, N'Kharagpur', 82)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (664, N'Asarganj', 82)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (665, N'Tarapur', 82)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (666, N'Tetiha Bambor', 82)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (667, N'Sangrampur', 82)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (668, N'Sahebganj', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (669, N'Baruraj (Motipur)', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (670, N'Paroo', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (671, N'Saraiya', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (672, N'Marwan', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (673, N'Kanti', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (674, N'Minapur', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (675, N'Bochaha', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (676, N'Aurai', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (677, N'Katra', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (678, N'Gaighat', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (679, N'Bandra', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (680, N'Dholi (Moraul)', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (681, N'Musahri', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (682, N'Kurhani', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (683, N'Sakra', 83)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (684, N'Karai Parsurai', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (685, N'Nagar Nausa', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (686, N'Harnaut', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (687, N'Chandi', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (688, N'Rahui', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (689, N'Bind', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (690, N'Sarmera', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (691, N'Asthawan', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (692, N'Bihar', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (693, N'Noorsarai', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (694, N'Tharthari', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (695, N'Parbalpur', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (696, N'Hilsa', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (697, N'Ekangarsarai', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (698, N'Islampur', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (699, N'Ben', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (700, N'Rajgir', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (701, N'Silao', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (702, N'Giriak', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (703, N'Katrisarai', 84)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (704, N'Nardiganj', 85)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (705, N'Nawada', 85)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (706, N'Warisaliganj', 85)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (707, N'Kashi Chak', 85)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (708, N'Pakribarawan', 85)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (709, N'Kawakol', 85)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (710, N'Roh', 85)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (711, N'Gobindpur', 85)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (712, N'Akbarpur', 85)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (713, N'Hisua', 85)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (714, N'Narhat', 85)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (715, N'Meskaur', 85)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (716, N'Sirdala', 85)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (717, N'Rajauli', 85)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (718, N'Patna Rural', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (719, N'Sampatchak', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (720, N'Phulwari', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (721, N'Bihta', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (722, N'Naubatpur', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (723, N'Bikram', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (724, N'Dulhin Bazar', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (725, N'Paliganj', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (726, N'Masaurhi', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (727, N'Dhanarua', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (728, N'Punpun', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (729, N'Fatwah', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (730, N'Daniawan', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (731, N'Khusrupur', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (732, N'Bakhtiarpur', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (733, N'Athmalgola', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (734, N'Belchhi', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (735, N'Barh', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (736, N'Pandarak', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (737, N'Ghoswari', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (738, N'Mokameh', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (739, N'Maner', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (740, N'Dinapur-Cum-Khagaul', 86)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (741, N'Banmankhi', 87)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (742, N'Barhara', 87)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (743, N'Bhawanipur', 87)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (744, N'Rupauli', 87)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (745, N'Dhamdaha', 87)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (746, N'Krityanand Nagar', 87)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (747, N'Purnia East', 87)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (748, N'Kasba', 87)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (749, N'Srinagar', 87)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (750, N'Jalalgarh', 87)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (751, N'Amour', 87)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (752, N'Baisa', 87)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (753, N'Baisi', 87)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (754, N'Dagarua', 87)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (755, N'Kochas', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (756, N'Dinara', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (757, N'Dawath', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (758, N'Suryapura', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (759, N'Bikramganj', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (760, N'Karakat', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (761, N'Nasriganj', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (762, N'Rajpur', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (763, N'Sanjhauli', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (764, N'Nokha', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (765, N'Kargahar', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (766, N'Chenari', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (767, N'Nauhatta', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (768, N'Sheosagar', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (769, N'Sasaram', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (770, N'Akorhi Gola', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (771, N'Dehri', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (772, N'Tilouthu', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (773, N'Rohtas', 88)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (774, N'Nauhatta', 89)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (775, N'Satar Kataiya', 89)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (776, N'Mahishi', 89)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (777, N'Kahara', 89)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (778, N'Saur Bazar', 89)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (779, N'Patarghat', 89)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (780, N'Sonbarsa', 89)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (781, N'Simri Bakhtiarpur', 89)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (782, N'Salkhua', 89)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (783, N'Banma Itahri', 89)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (784, N'Kalyanpur', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (785, N'Warisnagar', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (786, N'Shivaji Nagar', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (787, N'Khanpur', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (788, N'Samastipur', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (789, N'Pusa', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (790, N'Tajpur', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (791, N'Morwa', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (792, N'Patori', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (793, N'Mohanpur', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (794, N'Mohiuddinagar', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (795, N'Sarairanjan', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (796, N'Vidyapati Nagar', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (797, N'Dalsinghsarai', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (798, N'Ujiarpur', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (799, N'Bibhutpur', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (800, N'Rosera', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (801, N'Singhia', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (802, N'Hasanpur', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (803, N'Bithan', 90)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (804, N'Mashrakh', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (805, N'Panapur', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (806, N'Taraiya', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (807, N'Ishupur', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (808, N'Baniapur', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (809, N'Lahladpur', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (810, N'Ekma', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (811, N'Manjhi', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (812, N'Jalalpur', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (813, N'Revelganj', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (814, N'Chapra', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (815, N'Nagra', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (816, N'Marhaura', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (817, N'Amnour', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (818, N'Maker', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (819, N'Parsa', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (820, N'Dariapur', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (821, N'Garkha', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (822, N'Dighwara', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (823, N'Sonepur', 91)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (824, N'Barbigha', 92)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (825, N'Shekhopur Sarai', 92)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (826, N'Sheikhpura', 92)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (827, N'Ghat Kusumbha', 92)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (828, N'Chewara', 92)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (829, N'Ariari', 92)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (830, N'Purnahiya', 93)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (831, N'Piprarhi', 93)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (832, N'Sheohar', 93)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (833, N'Dumri Katsari', 93)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (834, N'Tariani Chowk', 93)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (835, N'Bairgania', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (836, N'Suppi', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (837, N'Majorganj', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (838, N'Sonbarsa', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (839, N'Parihar', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (840, N'Sursand', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (841, N'Bathnaha', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (842, N'Riga', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (843, N'Parsauni', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (844, N'Belsand', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (845, N'Runisaidpur', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (846, N'Dumra', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (847, N'Bajpatti', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (848, N'Charaut', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (849, N'Pupri', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (850, N'Nanpur', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (851, N'Bokhara', 94)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (852, N'Nautan', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (853, N'Siwan', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (854, N'Barharia', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (855, N'Goriakothi', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (856, N'Lakri Nabiganj', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (857, N'Basantpur', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (858, N'Bhagwanpur Hat', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (859, N'Maharajganj', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (860, N'Pachrukhi', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (861, N'Hussainganj', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (862, N'Ziradei', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (863, N'Mairwa', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (864, N'Guthani', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (865, N'Darauli', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (866, N'Andar', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (867, N'Raghunathpur', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (868, N'Hasanpura', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (869, N'Daraundha', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (870, N'Siswan', 95)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (871, N'Nirmali', 96)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (872, N'Basantpur', 96)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (873, N'Chhatapur', 96)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (874, N'Pratapganj', 96)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (875, N'Raghopur', 96)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (876, N'Saraigarh Bhaptiyahi', 96)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (877, N'Kishanpur', 96)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (878, N'Marauna', 96)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (879, N'Supaul', 96)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (880, N'Pipra', 96)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (881, N'Tribeniganj', 96)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (882, N'Vaishali', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (883, N'Paterhi Belsar', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (884, N'Lalganj', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (885, N'Bhagwanpur', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (886, N'Goraul', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (887, N'Chehra Kalan', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (888, N'Patepur', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (889, N'Mahua', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (890, N'Jandaha', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (891, N'Raja Pakar', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (892, N'Hajipur', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (893, N'Raghopur', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (894, N'Bidupur', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (895, N'Desri', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (896, N'Sahdai Buzurg', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (897, N'Mahnar', 97)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (898, N'Sidhaw', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (899, N'Ramnagar', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (900, N'Gaunaha', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (901, N'Mainatanr', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (902, N'Narkatiaganj', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (903, N'Lauriya', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (904, N'Bagaha', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (905, N'Piprasi', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (906, N'Madhubani', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (907, N'Bhitaha', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (908, N'Thakrahan', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (909, N'Jogapatti', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (910, N'Chanpatia', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (911, N'Sikta', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (912, N'Majhaulia', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (913, N'Bettiah', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (914, N'Bairia', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (915, N'Nautan', 98)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (916, N'Chandigarh', 99)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (917, N'Bhopalpattnam', 105)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (918, N'Usur', 105)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (919, N'Bijapur', 105)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (920, N'Bhairamgarh', 105)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (921, N'Pendra Road Gorella', 106)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (922, N'Marwahi', 106)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (923, N'Pendra', 106)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (924, N'Lormi', 106)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (925, N'Kota', 106)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (926, N'Mungeli', 106)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (927, N'Pathariya', 106)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (928, N'Takhatpur', 106)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (929, N'Bilaspur', 106)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (930, N'Masturi', 106)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (931, N'Bilha', 106)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (932, N'Dantewada', 107)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (933, N'Gidam', 107)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (934, N'Katekalyan', 107)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (935, N'Kuakonda', 107)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (936, N'Konta', 107)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (937, N'Chhindgarh', 107)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (938, N'Sukma', 107)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (939, N'Kurud', 108)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (940, N'Magarlod', 108)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (941, N'Dhamtari', 108)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (942, N'Nagri', 108)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (943, N'Nawagarh', 109)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (944, N'Bemetara', 109)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (945, N'Saja', 109)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (946, N'Thanakhamria', 109)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (947, N'Berla', 109)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (948, N'Dhamdha', 109)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (949, N'Durg', 109)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (950, N'Patan', 109)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (951, N'Gunderdehi', 109)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (952, N'Dondi Luhara', 109)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (953, N'Balod', 109)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (954, N'Dondi', 109)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (955, N'Gurur', 109)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (956, N'Janjgir', 111)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (957, N'Akaltara', 111)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (958, N'Baloda', 111)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (959, N'Nawagarh', 111)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (960, N'Champa', 111)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (961, N'Sakti', 111)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (962, N'Pamgarh', 111)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (963, N'Dabhra', 111)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (964, N'Malkharoda', 111)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (965, N'Jaijaipur', 111)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (966, N'Bagicha', 112)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (967, N'Kansabel', 112)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (968, N'Jashpur', 112)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (969, N'Manora', 112)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (970, N'Kunkuri', 112)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (971, N'Duldula', 112)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (972, N'Farsabahar', 112)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (973, N'Pathalgaon', 112)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (974, N'Kawardha', 113)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (975, N'Bodla', 113)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (976, N'Sahaspur Lohara', 113)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (977, N'Pandariya', 113)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (978, N'Charama', 114)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (979, N'Bhanupratappur', 114)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (980, N'Durgkondal', 114)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (981, N'Kanker', 114)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (982, N'Narharpur', 114)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (983, N'Antagarh', 114)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (984, N'Pakhanjur', 114)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (985, N'Katghora', 116)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (986, N'Poundi-Uproda', 116)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (987, N'Pali', 116)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (988, N'Korba', 116)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (989, N'Kartala', 116)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (990, N'Bharatpur', 117)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (991, N'Baikunthpur', 117)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (992, N'Sonhat', 117)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (993, N'Manendragarh', 117)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (994, N'Khadganva', 117)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (995, N'Basna', 118)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (996, N'Saraipali', 118)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (997, N'Mahasamund', 118)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (998, N'Pithora', 118)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (999, N'Bagbahra', 118)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1000, N'Narayanpur', 120)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1001, N'Orchha', 120)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1002, N'Udaipur (Dharamjaigarh)', 121)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1003, N'Lailunga', 121)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1004, N'Gharghoda', 121)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1005, N'Tamnar', 121)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1006, N'Raigarh', 121)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1007, N'Pusour', 121)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1008, N'Kharsia', 121)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1009, N'Sarangarh', 121)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1010, N'Baramkela', 121)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1011, N'Simga', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1012, N'Bhatapara', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1013, N'Baloda Bazar', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1014, N'Palari', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1015, N'Kasdol', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1016, N'Bilaigarh', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1017, N'Arang', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1018, N'Abhanpur', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1019, N'Raipur', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1020, N'Rajim', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1021, N'Tilda', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1022, N'Bindranavagarh(Gariyaband)', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1023, N'Chhura', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1024, N'Mainpur', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1025, N'Deobhog', 122)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1026, N'Chhuikhadan', 123)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1027, N'Khairagarh', 123)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1028, N'Dongargarh', 123)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1029, N'Rajnandgaon', 123)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1030, N'Chhuriya', 123)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1031, N'Dongargaon', 123)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1032, N'Mohla', 123)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1033, N'Manpur', 123)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1034, N'Ambagarh', 123)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1035, N'Ramanujganj', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1036, N'Balrampur', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1037, N'Wadrafnagar', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1038, N'Pratappur', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1039, N'Samri(kusmi)', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1040, N'Shankargarh', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1041, N'Surajpur', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1042, N'Oudgi', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1043, N'Bhaiyathan', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1044, N'Ramanujnagar', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1045, N'Premnagar', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1046, N'Ambikapur', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1047, N'Lakhanpur', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1048, N'Udaypur', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1049, N'Rajpur', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1050, N'Lundra', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1051, N'Sitapur', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1052, N'Batouli', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1053, N'Mainpat', 126)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1054, N'Dadra & Nagar Haveli', 127)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1055, N'Daman', 128)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1056, N'Diu', 129)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1057, N'Darya Ganj', 130)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1058, N'Pahar Ganj', 130)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1059, N'Karol Bagh', 130)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1060, N'Gandhi Nagar', 131)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1061, N'Vivek Vihar', 131)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1062, N'Preet Vihar', 131)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1063, N'Connaught Place', 132)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1064, N'Chanakya Puri', 132)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1065, N'Parliament Street', 132)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1066, N'Civil Lines', 133)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1067, N'Sadar Bazar', 133)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1068, N'Kotwali', 133)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1069, N'Seelam Pur', 134)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1070, N'Shahdara', 134)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1071, N'Seema Puri', 134)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1072, N'Narela', 135)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1073, N'Saraswati Vihar', 135)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1074, N'Model Town', 135)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1075, N'Hauz Khas', 136)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1076, N'Defence Colony', 136)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1077, N'Kalkaji', 136)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1078, N'Najafgarh', 137)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1079, N'Delhi Cantonment', 137)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1080, N'Vasant Vihar', 137)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1081, N'Patel Nagar', 138)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1082, N'Rajouri Garden', 138)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1083, N'Punjabi Bagh', 138)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1084, N'Pernem', 139)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1085, N'Bardez', 139)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1086, N'Tiswadi', 139)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1087, N'Bicholim', 139)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1088, N'Satari', 139)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1089, N'Ponda', 139)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1090, N'Mormugao', 140)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1091, N'Salcete', 140)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1092, N'Quepem', 140)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1093, N'Sanguem', 140)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1094, N'Canacona', 140)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1095, N'Mandal', 141)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1096, N'Detroj-Rampura', 141)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1097, N'Viramgam', 141)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1098, N'Sanand', 141)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1099, N'Ahmadabad City', 141)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1100, N'Daskroi', 141)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1101, N'Dholka', 141)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1102, N'Bavla', 141)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1103, N'Ranpur', 141)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1104, N'Barwala', 141)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1105, N'Dhandhuka', 141)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1106, N'Kunkavav Vadia', 142)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1107, N'Babra', 142)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1108, N'Lathi', 142)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1109, N'Lilia', 142)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1110, N'Amreli', 142)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1111, N'Bagasara', 142)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1112, N'Dhari', 142)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1113, N'Savar Kundla', 142)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1114, N'Khambha', 142)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1115, N'Jafrabad', 142)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1116, N'Rajula', 142)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1117, N'Tarapur', 143)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1118, N'Sojitra', 143)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1119, N'Umreth', 143)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1120, N'Anand', 143)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1121, N'Petlad', 143)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1122, N'Khambhat', 143)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1123, N'Borsad', 143)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1124, N'Anklav', 143)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1125, N'Danta', 145)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1126, N'Vadgam', 145)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1127, N'Palanpur', 145)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1128, N'Deesa', 145)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1129, N'Deodar', 145)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1130, N'Bhabhar', 145)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1131, N'Kankrej', 145)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1132, N'Vav', 145)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1133, N'Tharad', 145)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1134, N'Dhanera', 145)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1135, N'Dantiwada', 145)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1136, N'Amirgadh', 145)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1137, N'Jambusar', 146)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1138, N'Amod', 146)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1139, N'Vagra', 146)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1140, N'Bharuch', 146)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1141, N'Jhagadia', 146)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1142, N'Anklesvar', 146)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1143, N'Hansot', 146)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1144, N'Valia', 146)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1145, N'Botad', 147)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1146, N'Vallabhipur', 147)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1147, N'Gadhada', 147)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1148, N'Umrala', 147)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1149, N'Bhavnagar', 147)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1150, N'Ghogha', 147)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1151, N'Sihor', 147)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1152, N'Gariadhar', 147)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1153, N'Palitana', 147)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1154, N'Talaja', 147)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1155, N'Mahuva', 147)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1156, N'Fatepura', 150)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1157, N'Jhalod', 150)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1158, N'Limkheda', 150)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1159, N'Dohad', 150)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1160, N'Garbada', 150)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1161, N'Devgadbaria', 150)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1162, N'Dhanpur', 150)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1163, N'The Dangs', 151)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1164, N'Kalol', 153)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1165, N'Mansa', 153)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1166, N'Gandhinagar', 153)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1167, N'Dehgam', 153)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1168, N'Okhamandal', 155)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1169, N'Khambhalia', 155)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1170, N'Jamnagar', 155)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1171, N'Jodiya', 155)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1172, N'Dhrol', 155)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1173, N'Kalavad', 155)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1174, N'Lalpur', 155)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1175, N'Kalyanpur', 155)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1176, N'Bhanvad', 155)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1177, N'Jamjodhpur', 155)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1178, N'Manavadar', 156)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1179, N'Vanthali', 156)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1180, N'Junagadh', 156)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1181, N'Bhesan', 156)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1182, N'Visavadar', 156)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1183, N'Mendarda', 156)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1184, N'Keshod', 156)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1185, N'Mangrol', 156)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1186, N'Malia', 156)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1187, N'Talala', 156)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1188, N'Patan-Veraval', 156)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1189, N'Sutrapada', 156)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1190, N'Kodinar', 156)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1191, N'Una', 156)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1192, N'Lakhpat', 157)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1193, N'Rapar', 157)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1194, N'Bhachau', 157)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1195, N'Anjar', 157)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1196, N'Bhuj', 157)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1197, N'Nakhatrana', 157)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1198, N'Abdasa', 157)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1199, N'Mandvi', 157)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1200, N'Mundra', 157)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1201, N'Gandhidham', 157)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1202, N'Kapadvanj', 158)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1203, N'Virpur', 158)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1204, N'Balasinor', 158)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1205, N'Kathlal', 158)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1206, N'Mehmedabad', 158)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1207, N'Kheda', 158)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1208, N'Matar', 158)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1209, N'Nadiad', 158)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1210, N'Mahudha', 158)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1211, N'Thasra', 158)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1212, N'Satlasana', 160)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1213, N'Kheralu', 160)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1214, N'Unjha', 160)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1215, N'Visnagar', 160)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1216, N'Vadnagar', 160)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1217, N'Vijapur', 160)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1218, N'Mahesana', 160)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1219, N'Becharaji', 160)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1220, N'Kadi', 160)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1221, N'Tilakwada', 162)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1222, N'Nandod', 162)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1223, N'Dediapada', 162)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1224, N'Sagbara', 162)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1225, N'Navsari', 163)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1226, N'Jalalpore', 163)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1227, N'Gandevi', 163)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1228, N'Chikhli', 163)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1229, N'Bansda', 163)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1230, N'Kalol', 164)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1231, N'Ghoghamba', 164)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1232, N'Halol', 164)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1233, N'Jambughoda', 164)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1234, N'Khanpur', 164)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1235, N'Kadana', 164)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1236, N'Santrampur', 164)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1237, N'Lunawada', 164)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1238, N'Shehera', 164)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1239, N'Morwa (Hadaf)', 164)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1240, N'Godhra', 164)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1241, N'Santalpur', 165)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1242, N'Radhanpur', 165)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1243, N'Sidhpur', 165)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1244, N'Patan', 165)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1245, N'Harij', 165)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1246, N'Sami', 165)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1247, N'Chanasma', 165)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1248, N'Porbandar', 166)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1249, N'Ranavav', 166)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1250, N'Kutiyana', 166)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1251, N'Maliya', 167)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1252, N'Morvi', 167)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1253, N'Tankara', 167)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1254, N'Wankaner', 167)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1255, N'Paddhari', 167)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1256, N'Rajkot', 167)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1257, N'Lodhika', 167)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1258, N'Kotda Sangani', 167)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1259, N'Jasdan', 167)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1260, N'Gondal', 167)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1261, N'Jamkandorna', 167)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1262, N'Upleta', 167)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1263, N'Dhoraji', 167)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1264, N'Jetpur', 167)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1265, N'Khedbrahma', 168)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1266, N'Vijaynagar', 168)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1267, N'Vadali', 168)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1268, N'Idar', 168)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1269, N'Bhiloda', 168)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1270, N'Meghraj', 168)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1271, N'Himatnagar', 168)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1272, N'Prantij', 168)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1273, N'Talod', 168)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1274, N'Modasa', 168)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1275, N'Dhansura', 168)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1276, N'Malpur', 168)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1277, N'Bayad', 168)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1278, N'Olpad', 169)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1279, N'Mangrol', 169)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1280, N'Umarpada', 169)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1281, N'Mandvi', 169)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1282, N'Kamrej', 169)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1283, N'Surat City', 169)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1284, N'Chorasi', 169)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1285, N'Palsana', 169)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1286, N'Bardoli', 169)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1287, N'Mahuva', 169)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1288, N'Halvad', 170)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1289, N'Dhrangadhra', 170)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1290, N'Dasada', 170)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1291, N'Lakhtar', 170)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1292, N'Wadhwan', 170)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1293, N'Muli', 170)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1294, N'Chotila', 170)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1295, N'Sayla', 170)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1296, N'Chuda', 170)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1297, N'Limbdi', 170)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1298, N'Nizar', 171)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1299, N'Uchchhal', 171)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1300, N'Songadh', 171)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1301, N'Vyara', 171)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1302, N'Valod', 171)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1303, N'Savli', 172)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1304, N'Vadodara', 172)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1305, N'Vaghodia', 172)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1306, N'Jetpur Pavi', 172)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1307, N'Chhota Udaipur', 172)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1308, N'Kavant', 172)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1309, N'Nasvadi', 172)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1310, N'Sankheda', 172)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1311, N'Dabhoi', 172)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1312, N'Padra', 172)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1313, N'Karjan', 172)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1314, N'Sinor', 172)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1315, N'Valsad', 173)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1316, N'Dharampur', 173)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1317, N'Pardi', 173)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1318, N'Kaprada', 173)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1319, N'Umbergaon', 173)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1320, N'Naraingarh', 174)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1321, N'Ambala', 174)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1322, N'Barara', 174)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1323, N'Bawani Khera', 175)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1324, N'Bhiwani', 175)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1325, N'Tosham', 175)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1326, N'Siwani', 175)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1327, N'Loharu', 175)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1328, N'Dadri', 175)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1329, N'Badhra', 175)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1330, N'Faridabad', 176)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1331, N'Ballabgarh', 176)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1332, N'Ratia', 177)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1333, N'Tohana', 177)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1334, N'Fatehabad', 177)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1335, N'Pataudi', 178)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1336, N'Gurgaon', 178)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1337, N'Farrukhnagar', 178)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1338, N'Manesar', 178)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1339, N'Sohna', 178)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1340, N'Adampur', 179)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1341, N'Hisar', 179)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1342, N'Narnaund', 179)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1343, N'Hansi', 179)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1344, N'Beri', 180)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1345, N'Bahadurgarh', 180)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1346, N'Jhajjar', 180)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1347, N'Matenhail', 180)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1348, N'Narwana', 181)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1349, N'Jind', 181)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1350, N'Julana', 181)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1351, N'Safidon', 181)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1352, N'Guhla', 182)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1353, N'Kaithal', 182)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1354, N'Fatehpur Pundri', 182)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1355, N'Nilokheri', 183)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1356, N'Indri', 183)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1357, N'Karnal', 183)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1358, N'Assandh', 183)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1359, N'Gharaunda', 183)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1360, N'Shahbad', 184)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1361, N'Pehowa', 184)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1362, N'Thanesar', 184)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1363, N'Mahendragarh', 185)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1364, N'Narnaul', 185)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1365, N'Taoru', 186)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1366, N'Nuh', 186)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1367, N'Ferozepur Jhirka', 186)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1368, N'Punahana', 186)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1369, N'Palwal', 187)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1370, N'Hathin', 187)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1371, N'Hodal', 187)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1372, N'Kalka', 188)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1373, N'Panchkula', 188)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1374, N'Panipat', 189)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1375, N'Israna', 189)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1376, N'Samalkha', 189)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1377, N'Kosli', 190)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1378, N'Rewari', 190)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1379, N'Bawal', 190)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1380, N'Maham', 191)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1381, N'Rohtak', 191)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1382, N'Sampla', 191)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1383, N'Dabwali', 192)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1384, N'Sirsa', 192)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1385, N'Rania', 192)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1386, N'Ellenabad', 192)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1387, N'Gohana', 193)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1388, N'Ganaur', 193)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1389, N'Sonipat', 193)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1390, N'Kharkhoda', 193)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1391, N'Jagadhri', 194)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1392, N'Bilaspur', 194)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1393, N'Chhachhrauli', 194)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1394, N'Ghumarwin', 195)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1395, N'Bharari', 195)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1396, N'Jhanduta', 195)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1397, N'Naina Devi', 195)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1398, N'Bilaspur Sadar', 195)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1399, N'Namhol', 195)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1400, N'Pangi', 196)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1401, N'Chaurah', 196)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1402, N'Saluni', 196)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1403, N'Bhalai', 196)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1404, N'Dalhousie', 196)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1405, N'Bhattiyat', 196)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1406, N'Sihunta', 196)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1407, N'Chamba', 196)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1408, N'Holi', 196)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1409, N'Brahmaur', 196)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1410, N'Tira Sujanpur', 197)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1411, N'Nadaun', 197)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1412, N'Galore', 197)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1413, N'Hamirpur', 197)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1414, N'Barsar', 197)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1415, N'Dhatwal', 197)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1416, N'Bhoranj', 197)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1417, N'Nurpur', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1418, N'Indora', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1419, N'Fatehpur', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1420, N'Jawali', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1421, N'Harchakian', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1422, N'Shahpur', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1423, N'Dharmsala', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1424, N'Kangra', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1425, N'Nagrota Bagwan', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1426, N'Baroh', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1427, N'Dera Gopipur', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1428, N'Jawalamukhi', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1429, N'Jaswan', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1430, N'Rakkar', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1431, N'Khundian', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1432, N'Thural', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1433, N'Dhira', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1434, N'Jaisinghpur', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1435, N'Palampur', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1436, N'Baijnath', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1437, N'Multhan', 198)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1438, N'Hangrang', 199)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1439, N'Poo', 199)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1440, N'Morang', 199)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1441, N'Kalpa', 199)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1442, N'Nichar', 199)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1443, N'Sangla', 199)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1444, N'Manali', 200)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1445, N'Kullu', 200)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1446, N'Sainj', 200)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1447, N'Banjar', 200)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1448, N'Ani', 200)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1449, N'Nermand', 200)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1450, N'Udaipur', 201)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1451, N'Lahul', 201)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1452, N'Spiti', 201)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1453, N'Padhar', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1454, N'Jogindarnagar', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1455, N'Lad Bharol', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1456, N'Sandhol', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1457, N'Dharmpur', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1458, N'Kotli', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1459, N'Sarkaghat', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1460, N'Bhadrota', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1461, N'Baldwara', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1462, N'Sundarnagar', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1463, N'Mandi', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1464, N'Aut', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1465, N'Bali Chowki', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1466, N'Thunag', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1467, N'Chachyot', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1468, N'Nihri', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1469, N'Karsog', 202)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1470, N'Rampur', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1471, N'Nankhari', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1472, N'Kumharsain', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1473, N'Seoni', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1474, N'Shimla   ( Rural )', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1475, N'Shimla (urban)', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1476, N'Junga', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1477, N'Theog', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1478, N'Chaupal', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1479, N'Cheta', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1480, N'Nerua', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1481, N'Jubbal', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1482, N'Kotkhai', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1483, N'Tikar', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1484, N'Rohru', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1485, N'Chirgaon', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1486, N'Dodra Kwar', 203)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1487, N'Rajgarh', 204)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1488, N'Nohra', 204)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1489, N'Pachhad', 204)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1490, N'Renuka', 204)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1491, N'Dadahu', 204)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1492, N'Nahan', 204)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1493, N'Paonta Sahib', 204)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1494, N'Kamrau', 204)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1495, N'Shalai', 204)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1496, N'Ronhat', 204)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1497, N'Arki', 205)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1498, N'Darlaghat', 205)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1499, N'Ramshahr', 205)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1500, N'Nalagarh', 205)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1501, N'Baddi', 205)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1502, N'Krishangarh', 205)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1503, N'Kasauli', 205)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1504, N'Solan', 205)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1505, N'Kandaghat', 205)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1506, N'Bharwain', 206)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1507, N'Amb', 206)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1508, N'Bangana', 206)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1509, N'Una', 206)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1510, N'Haroli', 206)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1511, N'Pahalgam', 207)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1512, N'Bijbehara', 207)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1513, N'Anantnag', 207)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1514, N'Shangus', 207)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1515, N'Kokernag', 207)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1516, N'Dooru', 207)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1517, N'Gurez', 208)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1518, N'Bandipora', 208)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1519, N'Sonawari', 208)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1520, N'Sopore', 209)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1521, N'Rafiabad', 209)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1522, N'Pattan', 209)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1523, N'Baramulla', 209)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1524, N'Kreeri', 209)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1525, N'Uri', 209)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1526, N'Boniyar', 209)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1527, N'Tangmarg', 209)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1528, N'Khag', 210)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1529, N'Beerwah', 210)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1530, N'Khansahib', 210)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1531, N'Budgam', 210)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1532, N'Chadoora', 210)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1533, N'Charar- E- Shrief', 210)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1534, N'Doda', 211)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1535, N'Thathri', 211)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1536, N'Gandoh', 211)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1537, N'Bhaderwah', 211)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1538, N'Lar', 212)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1539, N'Kangan', 212)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1540, N'Ganderbal', 212)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1541, N'Akhnoor', 213)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1542, N'Jammu', 213)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1543, N'Ranbir Singh Pora', 213)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1544, N'Bishnah', 213)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1545, N'Kargil', 214)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1546, N'Sanku', 214)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1547, N'Zanskar', 214)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1548, N'Billawar', 215)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1549, N'Bashohli', 215)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1550, N'Bani', 215)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1551, N'Kathua', 215)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1552, N'Hiranagar', 215)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1553, N'Kishtwar', 216)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1554, N'Marwah', 216)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1555, N'Chhatroo', 216)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1556, N'Atholi (Paddar)', 216)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1557, N'Kulgam', 217)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1558, N'Devsar', 217)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1559, N'Damhal Hanjipora', 217)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1560, N'Kupwara', 218)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1561, N'Handwara', 218)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1562, N'Karnah', 218)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1563, N'Leh', 219)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1564, N'Nubra', 219)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1565, N'Khalsi', 219)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1566, N'Haveli', 220)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1567, N'Mandi', 220)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1568, N'Mendhar', 220)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1569, N'Surankote', 220)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1570, N'Pampore', 221)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1571, N'Awantipora', 221)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1572, N'Tral', 221)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1573, N'Pulwama', 221)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1574, N'Thanamandi', 222)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1575, N'Darhal', 222)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1576, N'Rajauri', 222)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1577, N'Budhal', 222)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1578, N'Kalakote', 222)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1579, N'Nowshehra', 222)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1580, N'Sunderbani', 222)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1581, N'Banihal', 223)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1582, N'Ramban', 223)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1583, N'Gool-Gulabgarh', 224)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1584, N'Reasi', 224)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1585, N'Samba', 225)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1586, N'Shopian', 226)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1587, N'Srinagar (North)', 227)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1588, N'Srinagar (South)', 227)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1589, N'Udhampur', 228)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1590, N'Chenani', 228)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1591, N'Ramnagar', 228)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1592, N'Majalta', 228)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1593, N'Nawadih', 229)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1594, N'Chandrapura', 229)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1595, N'Bermo', 229)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1596, N'Gumia', 229)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1597, N'Peterwar', 229)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1598, N'Kasmar', 229)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1599, N'Jaridih', 229)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1600, N'Chas', 229)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1601, N'Chandankiyari', 229)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1602, N'Shaligram Ram Narayanpur(Hunterganj)', 230)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1603, N'Pratappur', 230)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1604, N'Kunda', 230)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1605, N'Lawalaung', 230)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1606, N'Chatra', 230)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1607, N'Kanha Chatti', 230)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1608, N'Itkhori', 230)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1609, N'Mayur Hand', 230)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1610, N'Gidhaur', 230)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1611, N'Pathalgora', 230)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1612, N'Simaria', 230)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1613, N'Tandwa', 230)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1614, N'Sona Rai Tharhi', 231)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1615, N'Devipur', 231)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1616, N'Madhupur', 231)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1617, N'Margo Munda', 231)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1618, N'Karon', 231)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1619, N'Sarath', 231)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1620, N'Palojori', 231)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1621, N'Deoghar', 231)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1622, N'Mohanpur', 231)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1623, N'Sarwan', 231)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1624, N'Tundi', 232)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1625, N'Purbi Tundi', 232)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1626, N'Topchanchi', 232)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1627, N'Baghmara-Cum-Katras', 232)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1628, N'Gobindpur', 232)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1629, N'Dhanbad-Cum-Kenduadih-Cum-Jagata', 232)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1630, N'Baliapur', 232)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1631, N'Nirsa-Cum-Chirkunda', 232)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1632, N'Saraiyahat', 233)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1633, N'Jarmundi', 233)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1634, N'Ramgarh', 233)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1635, N'Gopikandar', 233)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1636, N'Kathikund', 233)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1637, N'Shikaripara', 233)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1638, N'Ranishwar', 233)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1639, N'Dumka', 233)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1640, N'Jama', 233)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1641, N'Masalia', 233)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1642, N'Patamda', 234)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1643, N'Boram', 234)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1644, N'Golmuri-Cum-Jugsalai', 234)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1645, N'Ghatshila', 234)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1646, N'Potka', 234)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1647, N'Musabani', 234)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1648, N'Dumaria', 234)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1649, N'Dhalbhumgarh', 234)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1650, N'Gurbandha', 234)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1651, N'Chakulia', 234)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1652, N'Baharagora', 234)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1653, N'Kharaundhi', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1654, N'Bhawnathpur', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1655, N'Ketar', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1656, N'Kandi', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1657, N'Majhiaon', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1658, N'Bardiha', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1659, N'Ramna', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1660, N'Bishunpura', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1661, N'Nagaruntari', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1662, N'Dhurki', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1663, N'Sagma', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1664, N'Dandai', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1665, N'Chinia', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1666, N'Meral (Pipra Kalan)', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1667, N'Garhwa', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1668, N'Danda', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1669, N'Ranka', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1670, N'Ramkanda', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1671, N'Bhandaria', 235)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1672, N'Gawan', 236)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1673, N'Tisri', 236)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1674, N'Deori', 236)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1675, N'Dhanwar', 236)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1676, N'Jamua', 236)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1677, N'Bengabad', 236)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1678, N'Gande', 236)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1679, N'Giridih', 236)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1680, N'Birni', 236)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1681, N'Bagodar', 236)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1682, N'Sariya', 236)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1683, N'Dumri', 236)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1684, N'Pirtanr', 236)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1685, N'Meherma', 237)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1686, N'Thakurgangti', 237)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1687, N'Boarijor', 237)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1688, N'Mahagama', 237)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1689, N'Pathargama', 237)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1690, N'Bashant Rai', 237)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1691, N'Godda', 237)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1692, N'Poreyahat', 237)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1693, N'Sundarpahari', 237)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1694, N'Bishunpur', 238)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1695, N'Ghaghra', 238)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1696, N'Sisai', 238)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1697, N'Verno', 238)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1698, N'Kamdara', 238)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1699, N'Basia', 238)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1700, N'Gumla', 238)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1701, N'Chainpur', 238)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1702, N'Dumri', 238)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1703, N'Albert Ekka(Jari)', 238)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1704, N'Raidih', 238)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1705, N'Palkot', 238)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1706, N'Chauparan', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1707, N'Barhi', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1708, N'Padma', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1709, N'Ichak', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1710, N'Tati Jhariya', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1711, N'Daru', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1712, N'Barkatha', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1713, N'Chalkusa', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1714, N'Bishungarh', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1715, N'Hazaribag', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1716, N'Katkamsandi', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1717, N'Katamdag', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1718, N'Keredari', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1719, N'Barkagaon', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1720, N'Churchu', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1721, N'Dadi', 239)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1722, N'Narayanpur', 240)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1723, N'Karma Tanr Vidyasagar', 240)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1724, N'Jamtara', 240)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1725, N'Nala', 240)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1726, N'Fatehpur', 240)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1727, N'Kundhit', 240)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1728, N'Karra', 241)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1729, N'Torpa', 241)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1730, N'Rania', 241)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1731, N'Murhu', 241)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1732, N'Khunti', 241)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1733, N'Erki(Tamar II)', 241)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1734, N'Satgawan', 242)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1735, N'Kodarma', 242)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1736, N'Domchanch', 242)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1737, N'Jainagar', 242)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1738, N'Chandwara', 242)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1739, N'Markacho', 242)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1740, N'Manika', 243)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1741, N'Barwadih', 243)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1742, N'Mahuadanr', 243)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1743, N'Garu', 243)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1744, N'Latehar', 243)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1745, N'Balumath', 243)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1746, N'Bariyatu', 243)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1747, N'Herhanj', 243)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1748, N'Chandwa', 243)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1749, N'Kisko', 244)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1750, N'Peshrar', 244)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1751, N'Kuru', 244)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1752, N'Kairo', 244)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1753, N'Lohardaga', 244)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1754, N'Senha', 244)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1755, N'Bhandra', 244)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1756, N'Litipara', 245)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1757, N'Amrapara', 245)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1758, N'Hiranpur', 245)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1759, N'Pakaur', 245)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1760, N'Maheshpur', 245)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1761, N'Pakuria', 245)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1762, N'Hussainabad', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1763, N'Haidernagar', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1764, N'Mohammad Ganj', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1765, N'Hariharganj', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1766, N'Pipra', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1767, N'Chhatarpur', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1768, N'Nawadiha Bazar/Nawadiha', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1769, N'Pandu', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1770, N'Untari Road', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1771, N'Bishrampur', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1772, N'Nawa Bazar', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1773, N'Patan', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1774, N'Padwa', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1775, N'Manatu', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1776, N'Tarhasi', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1777, N'Panki', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1778, N'Satbarwa', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1779, N'Nilambar-Pitambarpur(Lesliganj)', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1780, N'Medininagar(Daltonganj)', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1781, N'Chainpur', 246)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1782, N'Patratu', 247)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1783, N'Mandu', 247)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1784, N'Ramgarh', 247)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1785, N'Dulmi', 247)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1786, N'Chitarpur', 247)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1787, N'Gola', 247)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1788, N'Tamar I', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1789, N'Burmu', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1790, N'Khelari', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1791, N'Kanke', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1792, N'Ormanjhi', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1793, N'Angara', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1794, N'Rahe', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1795, N'Silli', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1796, N'Sonahatu', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1797, N'Namkum', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1798, N'Ratu', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1799, N'Nagri', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1800, N'Mandar', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1801, N'Chanho', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1802, N'Bero', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1803, N'Itki', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1804, N'Lapung', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1805, N'Bundu', 248)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1806, N'Sahibganj', 249)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1807, N'Mandro', 249)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1808, N'Borio', 249)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1809, N'Barhait', 249)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1810, N'Taljhari', 249)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1811, N'Rajmahal', 249)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1812, N'Udhwa', 249)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1813, N'Pathna', 249)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1814, N'Barharwa', 249)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1815, N'Kuchai', 250)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1816, N'Kharsawan', 250)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1817, N'Chandil', 250)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1818, N'Ichagarh', 250)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1819, N'Kukru', 250)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1820, N'Nimdih', 250)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1821, N'Adityapur(Gamharia)', 250)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1822, N'Saraikela', 250)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1823, N'Gobindpur(Rajnagar)', 250)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1824, N'Sonua', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1825, N'Gudri', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1826, N'Bandgaon', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1827, N'Chakradharpur', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1828, N'Khuntpani', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1829, N'Goilkera', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1830, N'Anandpur', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1831, N'Manoharpur', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1832, N'Noamundi', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1833, N'Tonto', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1834, N'Hat Gamharia', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1835, N'Chaibasa', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1836, N'Tantnagar', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1837, N'Manjhari', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1838, N'Jhinkpani', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1839, N'Jagannathpur', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1840, N'Kumardungi', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1841, N'Majhgaon', 251)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1842, N'Jamkhandi', 253)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1843, N'Bilgi', 253)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1844, N'Mudhol', 253)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1845, N'Badami', 253)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1846, N'Bagalkot', 253)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1847, N'Hungund', 253)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1848, N'Nelamangala', 254)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1849, N'Dod Ballapur', 254)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1850, N'Devanahalli', 254)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1851, N'Hosakote', 254)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1852, N'Bangalore North', 255)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1853, N'Bangalore South', 255)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1854, N'Bangalore East', 255)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1855, N'Anekal', 255)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1856, N'Chikodi', 256)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1857, N'Athni', 256)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1858, N'Raybag', 256)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1859, N'Gokak', 256)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1860, N'Hukeri', 256)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1861, N'Belgaum', 256)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1862, N'Khanapur', 256)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1863, N'Sampgaon', 256)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1864, N'Parasgad', 256)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1865, N'Ramdurg', 256)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1866, N'Hadagalli', 257)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1867, N'Hagaribommanahalli', 257)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1868, N'Hospet', 257)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1869, N'Siruguppa', 257)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1870, N'Bellary', 257)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1871, N'Sandur', 257)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1872, N'Kudligi', 257)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1873, N'Basavakalyan', 258)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1874, N'Bhalki', 258)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1875, N'Aurad', 258)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1876, N'Bidar', 258)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1877, N'Homnabad', 258)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1878, N'Bijapur', 259)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1879, N'Indi', 259)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1880, N'Sindgi', 259)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1881, N'Basavana Bagevadi', 259)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1882, N'Muddebihal', 259)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1883, N'Gundlupet', 260)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1884, N'Chamarajanagar', 260)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1885, N'Yelandur', 260)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1886, N'Kollegal', 260)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1887, N'Sringeri', 261)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1888, N'Koppa', 261)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1889, N'Narasimharajapura', 261)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1890, N'Tarikere', 261)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1891, N'Kadur', 261)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1892, N'Chikmagalur', 261)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1893, N'Mudigere', 261)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1894, N'Gauribidanur', 262)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1895, N'Chikkaballapura', 262)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1896, N'Gudibanda', 262)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1897, N'Bagepalli', 262)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1898, N'Sidlaghatta', 262)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1899, N'Chintamani', 262)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1900, N'Molakalmuru', 263)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1901, N'Challakere', 263)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1902, N'Chitradurga', 263)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1903, N'Holalkere', 263)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1904, N'Hosdurga', 263)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1905, N'Hiriyur', 263)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1906, N'Mangalore', 264)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1907, N'Bantval', 264)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1908, N'Beltangadi', 264)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1909, N'Puttur', 264)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1910, N'Sulya', 264)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1911, N'Harihar', 265)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1912, N'Harapanahalli', 265)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1913, N'Jagalur', 265)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1914, N'Davanagere', 265)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1915, N'Honnali', 265)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1916, N'Channagiri', 265)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1917, N'Dharwad', 266)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1918, N'Navalgund', 266)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1919, N'Hubli', 266)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1920, N'Kalghatgi', 266)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1921, N'Kundgol', 266)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1922, N'Nargund', 267)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1923, N'Ron', 267)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1924, N'Gadag', 267)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1925, N'Shirhatti', 267)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1926, N'Mundargi', 267)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1927, N'Aland', 268)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1928, N'Afzalpur', 268)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1929, N'Gulbarga', 268)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1930, N'Chincholi', 268)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1931, N'Sedam', 268)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1932, N'Chitapur', 268)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1933, N'Jevargi', 268)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1934, N'Sakleshpur', 269)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1935, N'Belur', 269)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1936, N'Arsikere', 269)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1937, N'Hassan', 269)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1938, N'Alur', 269)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1939, N'Arkalgud', 269)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1940, N'Hole Narsipur', 269)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1941, N'Channarayapatna', 269)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1942, N'Shiggaon', 270)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1943, N'Savanur', 270)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1944, N'Hangal', 270)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1945, N'Haveri', 270)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1946, N'Byadgi', 270)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1947, N'Hirekerur', 270)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1948, N'Ranibennur', 270)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1949, N'Madikeri', 271)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1950, N'Somvarpet', 271)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1951, N'Virajpet', 271)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1952, N'Srinivaspur', 272)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1953, N'Kolar', 272)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1954, N'Malur', 272)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1955, N'Bangarapet', 272)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1956, N'Mulbagal', 272)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1957, N'Yelbarga', 273)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1958, N'Kushtagi', 273)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1959, N'Gangawati', 273)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1960, N'Koppal', 273)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1961, N'Krishnarajpet', 274)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1962, N'Nagamangala', 274)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1963, N'Pandavapura', 274)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1964, N'Shrirangapattana', 274)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1965, N'Mandya', 274)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1966, N'Maddur', 274)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1967, N'Malavalli', 274)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1968, N'Piriyapatna', 275)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1969, N'Hunsur', 275)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1970, N'Krishnarajanagara', 275)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1971, N'Mysore', 275)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1972, N'Heggadadevankote', 275)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1973, N'Nanjangud', 275)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1974, N'Tirumakudal - Narsipur', 275)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1975, N'Lingsugur', 276)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1976, N'Devadurga', 276)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1977, N'Raichur', 276)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1978, N'Manvi', 276)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1979, N'Sindhnur', 276)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1980, N'Magadi', 277)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1981, N'Ramanagara', 277)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1982, N'Channapatna', 277)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1983, N'Kanakapura', 277)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1984, N'Sagar', 278)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1985, N'Sorab', 278)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1986, N'Shikarpur', 278)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1987, N'Hosanagara', 278)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1988, N'Tirthahalli', 278)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1989, N'Shimoga', 278)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1990, N'Bhadravati', 278)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1991, N'Chiknayakanhalli', 279)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1992, N'Sira', 279)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1993, N'Pavagada', 279)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1994, N'Madhugiri', 279)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1995, N'Koratagere', 279)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1996, N'Tumkur', 279)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1997, N'Gubbi', 279)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1998, N'Tiptur', 279)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (1999, N'Turuvekere', 279)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2000, N'Kunigal', 279)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2001, N'Kundapura', 280)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2002, N'Udupi', 280)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2003, N'Karkal', 280)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2004, N'Karwar', 281)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2005, N'Supa', 281)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2006, N'Haliyal', 281)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2007, N'Yellapur', 281)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2008, N'Mundgod', 281)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2009, N'Sirsi', 281)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2010, N'Ankola', 281)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2011, N'Kumta', 281)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2012, N'Siddapur', 281)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2013, N'Honavar', 281)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2014, N'Bhatkal', 281)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2015, N'Yadgir', 282)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2016, N'Shorapur', 282)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2017, N'Shahpur', 282)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2018, N'Cherthala', 283)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2019, N'Ambalappuzha', 283)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2020, N'Kuttanad', 283)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2021, N'Karthikappally', 283)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2022, N'Chengannur', 283)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2023, N'Mavelikkara', 283)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2024, N'Kunnathunad', 284)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2025, N'Aluva', 284)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2026, N'Paravur', 284)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2027, N'Kochi', 284)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2028, N'Kanayannur', 284)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2029, N'Muvattupuzha', 284)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2030, N'Kothamangalam', 284)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2031, N'Devikulam', 285)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2032, N'Udumbanchola', 285)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2033, N'Thodupuzha', 285)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2034, N'Peerumade', 285)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2035, N'Taliparamba', 286)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2036, N'Kannur', 286)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2037, N'Thalassery', 286)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2038, N'Kasaragod', 287)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2039, N'Hosdurg', 287)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2040, N'Karunagappally', 288)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2041, N'Kunnathur', 288)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2042, N'Pathanapuram', 288)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2043, N'Kottarakkara', 288)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2044, N'Kollam', 288)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2045, N'Meenachil', 289)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2046, N'Vaikom', 289)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2047, N'Kottayam', 289)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2048, N'Changanassery', 289)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2049, N'Kanjirappally', 289)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2050, N'Vadakara', 290)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2051, N'Quilandy', 290)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2052, N'Kozhikode', 290)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2053, N'Ernad', 291)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2054, N'Nilambur', 291)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2055, N'Perinthalmanna', 291)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2056, N'Tirur', 291)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2057, N'Tirurangadi', 291)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2058, N'Ponnani', 291)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2059, N'Ottappalam', 292)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2060, N'Mannarkad', 292)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2061, N'Palakkad', 292)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2062, N'Chittur', 292)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2063, N'Alathur', 292)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2064, N'Thiruvalla', 293)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2065, N'Mallappally', 293)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2066, N'Ranni', 293)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2067, N'Kozhenchery', 293)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2068, N'Adoor', 293)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2069, N'Chirayinkeezhu', 294)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2070, N'Nedumangad', 294)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2071, N'Thiruvananthapuram', 294)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2072, N'Neyyattinkara', 294)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2073, N'Talappilly', 295)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2074, N'Chavakkad', 295)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2075, N'Thrissur', 295)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2076, N'Kodungallur', 295)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2077, N'Mukundapuram', 295)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2078, N'Mananthavady', 296)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2079, N'Sulthanbathery', 296)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2080, N'Vythiri', 296)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2081, N'Amini', 297)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2082, N'Bitra', 297)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2083, N'Chetlat', 297)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2084, N'Kiltan', 297)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2085, N'Kadmat', 297)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2086, N'Kavaratti', 297)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2087, N'Agatti', 297)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2088, N'Andrott', 297)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2089, N'Kalpeni', 297)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2090, N'Minicoy', 297)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2091, N'Bhavra', 298)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2092, N'Jobat', 298)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2093, N'Alirajpur', 298)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2094, N'Kotma', 299)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2095, N'Anuppur', 299)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2096, N'Jaithari', 299)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2097, N'Pushparajgarh', 299)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2098, N'Isagarh', 300)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2099, N'Chanderi', 300)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2100, N'Ashoknagar', 300)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2101, N'Shadhora', 300)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2102, N'Mungaoli', 300)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2103, N'Katangi', 301)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2104, N'Tirodi', 301)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2105, N'Waraseoni', 301)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2106, N'Khairlanji', 301)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2107, N'Lalbarra', 301)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2108, N'Balaghat', 301)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2109, N'Kirnapur', 301)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2110, N'Baihar', 301)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2111, N'Paraswada', 301)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2112, N'Lanji', 301)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2113, N'Barwani', 302)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2114, N'Pati', 302)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2115, N'Thikri', 302)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2116, N'Anjad', 302)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2117, N'Rajpur', 302)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2118, N'Pansemal', 302)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2119, N'Niwali', 302)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2120, N'Sendhwa', 302)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2121, N'Varla', 302)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2122, N'Bhainsdehi', 303)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2123, N'Athner', 303)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2124, N'Betul', 303)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2125, N'Chicholi', 303)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2126, N'Ghoda Dongri', 303)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2127, N'Shahpur', 303)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2128, N'Multai', 303)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2129, N'Amla', 303)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2130, N'Ater', 304)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2131, N'Bhind', 304)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2132, N'Mehgaon', 304)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2133, N'Gormi', 304)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2134, N'Gohad', 304)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2135, N'Ron', 304)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2136, N'Mihona', 304)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2137, N'Lahar', 304)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2138, N'Berasia', 305)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2139, N'Huzur', 305)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2140, N'Burhanpur', 306)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2141, N'Khaknar', 306)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2142, N'Nepanagar', 306)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2143, N'Gaurihar', 307)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2144, N'Laundi', 307)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2145, N'Chandla', 307)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2146, N'Nowgong', 307)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2147, N'Maharajpur', 307)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2148, N'Chhatarpur', 307)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2149, N'Rajnagar', 307)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2150, N'Bada Malhera', 307)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2151, N'Ghuwara', 307)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2152, N'Bijawar', 307)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2153, N'Buxwaha', 307)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2154, N'Tamia', 308)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2155, N'Amarwara', 308)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2156, N'Harrai', 308)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2157, N'Chaurai', 308)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2158, N'Jamai', 308)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2159, N'Parasia', 308)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2160, N'Umreth', 308)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2161, N'Chhindwara', 308)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2162, N'Mohkhed', 308)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2163, N'Sausar', 308)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2164, N'Bichhua', 308)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2165, N'Pandhurna', 308)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2166, N'Hatta', 309)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2167, N'Patera', 309)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2168, N'Batiyagarh', 309)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2169, N'Patharia', 309)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2170, N'Damoh', 309)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2171, N'Jabera', 309)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2172, N'Tendukheda', 309)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2173, N'Seondha', 310)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2174, N'Indergarh', 310)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2175, N'Datia', 310)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2176, N'Bhander', 310)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2177, N'Tonk Khurd', 311)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2178, N'Sonkatch', 311)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2179, N'Dewas', 311)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2180, N'Kannod', 311)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2181, N'Satwas', 311)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2182, N'Bagli', 311)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2183, N'Hatpiplya', 311)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2184, N'Khategaon', 311)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2185, N'Badnawar', 312)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2186, N'Sardarpur', 312)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2187, N'Dhar', 312)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2188, N'Gandhwani', 312)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2189, N'Kukshi', 312)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2190, N'Dahi', 312)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2191, N'Manawar', 312)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2192, N'Dharampuri', 312)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2193, N'Shahpura', 313)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2194, N'Dindori', 313)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2195, N'Guna', 314)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2196, N'Bamori', 314)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2197, N'Raghogarh', 314)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2198, N'Maksoodangarh', 314)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2199, N'Kumbhraj', 314)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2200, N'Aron', 314)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2201, N'Chachaura', 314)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2202, N'Gwalior (Gird)', 315)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2203, N'Dabra (Pichhore)', 315)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2204, N'Bhitarwar', 315)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2205, N'Chinour', 315)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2206, N'Khirkiya', 316)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2207, N'Sirali', 316)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2208, N'Harda', 316)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2209, N'Handiya', 316)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2210, N'Timarni', 316)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2211, N'Rehatgaon', 316)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2212, N'Seoni-Malwa', 317)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2213, N'Itarsi', 317)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2214, N'Hoshangabad', 317)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2215, N'Dolariya', 317)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2216, N'Babai', 317)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2217, N'Sohagpur', 317)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2218, N'Pipariya', 317)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2219, N'Bankhedi', 317)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2220, N'Depalpur', 318)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2221, N'Hatod', 318)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2222, N'Sawer', 318)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2223, N'Indore', 318)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2224, N'Mhow', 318)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2225, N'Sihora', 319)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2226, N'Majholi', 319)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2227, N'Patan', 319)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2228, N'Shahpura', 319)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2229, N'Jabalpur', 319)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2230, N'Panagar', 319)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2231, N'Kundam', 319)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2232, N'Thandla', 320)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2233, N'Petlawad', 320)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2234, N'Meghnagar', 320)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2235, N'Jhabua', 320)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2236, N'Ranapur', 320)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2237, N'Murwara', 321)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2238, N'Rithi', 321)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2239, N'Barhi', 321)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2240, N'Badwara', 321)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2241, N'Vijayraghavgarh', 321)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2242, N'Bahoriband', 321)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2243, N'Dhimarkheda', 321)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2244, N'Harsud', 322)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2245, N'Khalwa', 322)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2246, N'Khandwa', 322)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2247, N'Punasa', 322)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2248, N'Pandhana', 322)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2249, N'Barwaha', 323)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2250, N'Maheshwar', 323)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2251, N'Kasrawad', 323)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2252, N'Segaon', 323)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2253, N'Bhikangaon', 323)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2254, N'Khargone', 323)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2255, N'Gogaon', 323)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2256, N'Bhagwanpura', 323)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2257, N'Jhiranya', 323)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2258, N'Niwas', 324)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2259, N'Narayanganj', 324)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2260, N'Mandla', 324)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2261, N'Ghughari', 324)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2262, N'Bichhiya', 324)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2263, N'Nainpur', 324)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2264, N'Bhanpura', 325)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2265, N'Malhargarh', 325)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2266, N'Garoth', 325)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2267, N'Shamgarh', 325)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2268, N'Mandsaur', 325)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2269, N'Daloda', 325)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2270, N'Sitamau', 325)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2271, N'Suwasara', 325)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2272, N'Ambah', 326)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2273, N'Porsa', 326)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2274, N'Morena', 326)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2275, N'Joura', 326)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2276, N'Kailaras', 326)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2277, N'Sabalgarh', 326)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2278, N'Gotegaon', 327)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2279, N'Gadarwara', 327)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2280, N'Narsimhapur', 327)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2281, N'Kareli', 327)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2282, N'Tendukheda', 327)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2283, N'Jawad', 328)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2284, N'Singoli', 328)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2285, N'Neemuch', 328)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2286, N'Jiran', 328)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2287, N'Manasa', 328)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2288, N'Ajaigarh', 329)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2289, N'Panna', 329)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2290, N'Devendranagar', 329)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2291, N'Gunnor', 329)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2292, N'Amanganj', 329)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2293, N'Pawai', 329)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2294, N'Shahnagar', 329)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2295, N'Raipura', 329)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2296, N'Udaipura', 330)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2297, N'Raisen', 330)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2298, N'Gairatganj', 330)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2299, N'Begamganj', 330)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2300, N'Goharganj', 330)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2301, N'Baraily', 330)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2302, N'Badi', 330)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2303, N'Silwani', 330)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2304, N'Jirapur', 331)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2305, N'Khilchipur', 331)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2306, N'Rajgarh', 331)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2307, N'Biaora', 331)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2308, N'Sarangpur', 331)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2309, N'Narsinghgarh', 331)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2310, N'Pachore', 331)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2311, N'Piploda', 332)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2312, N'Jaora', 332)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2313, N'Alot', 332)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2314, N'Tal', 332)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2315, N'Sailana', 332)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2316, N'Bajna', 332)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2317, N'Rawti', 332)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2318, N'Ratlam', 332)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2319, N'Teonthar', 333)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2320, N'Jawa', 333)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2321, N'Sirmour', 333)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2322, N'Mangawan', 333)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2323, N'Semaria', 333)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2324, N'Hanumana', 333)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2325, N'Mauganj', 333)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2326, N'Naigarhi', 333)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2327, N'Huzur', 333)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2328, N'Raipur - Karchuliyan', 333)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2329, N'Gurh', 333)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2330, N'Kesli', 334)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2331, N'Deori', 334)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2332, N'Bina', 334)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2333, N'Khurai', 334)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2334, N'Malthon', 334)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2335, N'Banda', 334)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2336, N'Shahgarh', 334)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2337, N'Rahatgarh', 334)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2338, N'Sagar', 334)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2339, N'Garhakota', 334)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2340, N'Rehli', 334)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2341, N'Raghurajnagar', 335)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2342, N'Majhgawan', 335)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2343, N'Birsinghpur', 335)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2344, N'Nagod', 335)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2345, N'Unchahara', 335)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2346, N'Rampur Baghelan', 335)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2347, N'Kotar', 335)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2348, N'Amarpatan', 335)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2349, N'Ramnagar', 335)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2350, N'Maihar', 335)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2351, N'Sehore', 336)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2352, N'Shyampur', 336)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2353, N'Ashta', 336)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2354, N'Jawar', 336)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2355, N'Ichhawar', 336)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2356, N'Nasrullaganj', 336)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2357, N'Budni', 336)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2358, N'Rehti', 336)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2359, N'Lakhnadon', 337)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2360, N'Chhapara', 337)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2361, N'Ghansaur', 337)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2362, N'Dhanora', 337)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2363, N'Keolari', 337)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2364, N'Seoni', 337)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2365, N'Barghat', 337)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2366, N'Kurai', 337)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2367, N'Beohari', 338)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2368, N'Jaisinghnagar', 338)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2369, N'Sohagpur', 338)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2370, N'Jaitpur', 338)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2371, N'Susner', 339)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2372, N'Nalkheda', 339)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2373, N'Badod', 339)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2374, N'Agar', 339)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2375, N'Shajapur', 339)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2376, N'Gulana', 339)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2377, N'Moman Badodiya', 339)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2378, N'Shujalpur', 339)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2379, N'Kalapipal', 339)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2380, N'Vijaypur', 340)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2381, N'Beerpur', 340)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2382, N'Sheopur', 340)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2383, N'Badoda', 340)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2384, N'Karahal', 340)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2385, N'Pohri', 341)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2386, N'Shivpuri', 341)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2387, N'Narwar', 341)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2388, N'Karera', 341)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2389, N'Kolaras', 341)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2390, N'Badarwas', 341)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2391, N'Pichhore', 341)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2392, N'Khaniyadhana', 341)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2393, N'Rampur Naikin', 342)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2394, N'Churhat', 342)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2395, N'Gopadbanas', 342)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2396, N'Sihawal', 342)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2397, N'Majhauli', 342)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2398, N'Kusmi', 342)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2399, N'Chitrangi', 343)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2400, N'Deosar', 343)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2401, N'Singrauli', 343)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2402, N'Niwari', 344)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2403, N'Orchha', 344)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2404, N'Prithvipur', 344)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2405, N'Jatara', 344)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2406, N'Mohangarh', 344)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2407, N'Palera', 344)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2408, N'Baldeogarh', 344)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2409, N'Khargapur', 344)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2410, N'Tikamgarh', 344)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2411, N'Khacharod', 345)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2412, N'Nagda', 345)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2413, N'Mahidpur', 345)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2414, N'Ghatiya', 345)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2415, N'Tarana', 345)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2416, N'Ujjain', 345)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2417, N'Badnagar', 345)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2418, N'Bandhogarh', 346)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2419, N'Chandia', 346)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2420, N'Manpur', 346)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2421, N'Pali', 346)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2422, N'Nowrozabad', 346)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2423, N'Lateri', 347)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2424, N'Sironj', 347)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2425, N'Kurwai', 347)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2426, N'Basoda', 347)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2427, N'Tyonda', 347)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2428, N'Nateran', 347)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2429, N'Shamshabad', 347)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2430, N'Gyaraspur', 347)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2431, N'Gulabganj', 347)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2432, N'Vidisha', 347)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2433, N'Akola', 348)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2434, N'Sangamner', 348)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2435, N'Kopargaon', 348)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2436, N'Rahta', 348)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2437, N'Shrirampur', 348)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2438, N'Nevasa', 348)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2439, N'Shevgaon', 348)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2440, N'Pathardi', 348)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2441, N'Nagar', 348)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2442, N'Rahuri', 348)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2443, N'Parner', 348)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2444, N'Shrigonda', 348)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2445, N'Karjat', 348)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2446, N'Jamkhed', 348)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2447, N'Telhara', 349)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2448, N'Akot', 349)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2449, N'Balapur', 349)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2450, N'Akola', 349)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2451, N'Murtijapur', 349)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2452, N'Patur', 349)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2453, N'Barshitakli', 349)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2454, N'Dharni', 350)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2455, N'Chikhaldara', 350)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2456, N'Anjangaon Surji', 350)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2457, N'Achalpur', 350)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2458, N'Chandurbazar', 350)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2459, N'Morshi', 350)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2460, N'Warud', 350)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2461, N'Teosa', 350)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2462, N'Amravati', 350)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2463, N'Bhatkuli', 350)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2464, N'Daryapur', 350)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2465, N'Nandgaon-Khandeshwar', 350)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2466, N'Chandur Railway', 350)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2467, N'Dhamangaon Railway', 350)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2468, N'Kannad', 351)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2469, N'Soegaon', 351)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2470, N'Sillod', 351)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2471, N'Phulambri', 351)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2472, N'Aurangabad', 351)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2473, N'Khuldabad', 351)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2474, N'Vaijapur', 351)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2475, N'Gangapur', 351)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2476, N'Paithan', 351)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2477, N'Ashti', 352)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2478, N'Patoda', 352)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2479, N'Shirur (Kasar)', 352)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2480, N'Georai', 352)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2481, N'Manjlegaon', 352)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2482, N'Wadwani', 352)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2483, N'Bid', 352)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2484, N'Kaij', 352)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2485, N'Dharur', 352)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2486, N'Parli', 352)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2487, N'Ambejogai', 352)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2488, N'Jalgaon (Jamod)', 354)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2489, N'Sangrampur', 354)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2490, N'Shegaon', 354)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2491, N'Nandura', 354)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2492, N'Malkapur', 354)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2493, N'Motala', 354)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2494, N'Khamgaon', 354)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2495, N'Mehkar', 354)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2496, N'Chikhli', 354)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2497, N'Buldana', 354)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2498, N'Deolgaon Raja', 354)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2499, N'Sindkhed Raja', 354)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2500, N'Lonar', 354)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2501, N'Warora', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2502, N'Chimur', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2503, N'Nagbhir', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2504, N'Brahmapuri', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2505, N'Sawali', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2506, N'Sindewahi', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2507, N'Bhadravati', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2508, N'Chandrapur', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2509, N'Mul', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2510, N'Pombhurna', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2511, N'Ballarpur', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2512, N'Korpana', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2513, N'Jiwati', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2514, N'Rajura', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2515, N'Gondpipri', 355)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2516, N'Shirpur', 356)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2517, N'Sindkhede', 356)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2518, N'Sakri', 356)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2519, N'Dhule', 356)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2520, N'Desaiganj (Vadasa)', 357)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2521, N'Armori', 357)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2522, N'Kurkheda', 357)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2523, N'Korchi', 357)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2524, N'Dhanora', 357)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2525, N'Gadchiroli', 357)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2526, N'Chamorshi', 357)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2527, N'Mulchera', 357)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2528, N'Etapalli', 357)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2529, N'Bhamragad', 357)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2530, N'Aheri', 357)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2531, N'Sironcha', 357)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2532, N'Tirora', 358)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2533, N'Goregaon', 358)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2534, N'Gondiya', 358)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2535, N'Amgaon', 358)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2536, N'Salekasa', 358)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2537, N'Sadak-Arjuni', 358)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2538, N'Arjuni Morgaon', 358)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2539, N'Deori', 358)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2540, N'Sengaon', 359)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2541, N'Hingoli', 359)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2542, N'Aundha (Nagnath)', 359)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2543, N'Kalamnuri', 359)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2544, N'Basmath', 359)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2545, N'Chopda', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2546, N'Yawal', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2547, N'Raver', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2548, N'Muktainagar', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2549, N'Bodvad', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2550, N'Bhusawal', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2551, N'Jalgaon', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2552, N'Erandol', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2553, N'Dharangaon', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2554, N'Amalner', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2555, N'Parola', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2556, N'Bhadgaon', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2557, N'Chalisgaon', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2558, N'Pachora', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2559, N'Jamner', 360)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2560, N'Bhokardan', 361)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2561, N'Jafferabad', 361)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2562, N'Jalna', 361)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2563, N'Badnapur', 361)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2564, N'Ambad', 361)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2565, N'Ghansawangi', 361)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2566, N'Partur', 361)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2567, N'Mantha', 361)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2568, N'Shahuwadi', 362)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2569, N'Panhala', 362)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2570, N'Hatkanangle', 362)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2571, N'Shirol', 362)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2572, N'Karvir', 362)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2573, N'Bavda', 362)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2574, N'Radhanagari', 362)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2575, N'Kagal', 362)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2576, N'Bhudargad', 362)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2577, N'Ajra', 362)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2578, N'Gadhinglaj', 362)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2579, N'Chandgad', 362)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2580, N'Latur', 363)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2581, N'Renapur', 363)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2582, N'Ahmadpur', 363)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2583, N'Jalkot', 363)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2584, N'Chakur', 363)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2585, N'Shirur-Anantpal', 363)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2586, N'Ausa', 363)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2587, N'Nilanga', 363)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2588, N'Deoni', 363)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2589, N'Udgir', 363)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2590, N'Savner', 366)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2591, N'Parseoni', 366)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2592, N'Ramtek', 366)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2593, N'Mauda', 366)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2594, N'Kamptee', 366)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2595, N'Nagpur (Rural)', 366)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2596, N'Nagpur (Urban)', 366)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2597, N'Hingna', 366)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2598, N'Umred', 366)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2599, N'Kuhi', 366)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2600, N'Bhiwapur', 366)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2601, N'Narkhed', 366)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2602, N'Katol', 366)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2603, N'Kalameshwar', 366)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2604, N'Mahoor', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2605, N'Kinwat', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2606, N'Himayatnagar', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2607, N'Hadgaon', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2608, N'Ardhapur', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2609, N'Nanded', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2610, N'Mudkhed', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2611, N'Bhokar', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2612, N'Umri', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2613, N'Dharmabad', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2614, N'Biloli', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2615, N'Naigaon (Khairgaon)', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2616, N'Loha', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2617, N'Kandhar', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2618, N'Mukhed', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2619, N'Deglur', 367)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2620, N'Akkalkuwa', 368)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2621, N'Akrani', 368)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2622, N'Talode', 368)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2623, N'Shahade', 368)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2624, N'Nandurbar', 368)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2625, N'Nawapur', 368)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2626, N'Surgana', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2627, N'Kalwan', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2628, N'Deola', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2629, N'Baglan', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2630, N'Malegaon', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2631, N'Nandgaon', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2632, N'Chandvad', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2633, N'Dindori', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2634, N'Peint', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2635, N'Trimbakeshwar', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2636, N'Nashik', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2637, N'Igatpuri', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2638, N'Sinnar', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2639, N'Niphad', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2640, N'Yevla', 369)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2641, N'Paranda', 370)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2642, N'Bhum', 370)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2643, N'Washi', 370)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2644, N'Kalamb', 370)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2645, N'Osmanabad', 370)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2646, N'Tuljapur', 370)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2647, N'Lohara', 370)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2648, N'Umarga', 370)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2649, N'Sailu', 371)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2650, N'Jintur', 371)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2651, N'Parbhani', 371)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2652, N'Manwath', 371)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2653, N'Pathri', 371)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2654, N'Sonpeth', 371)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2655, N'Gangakhed', 371)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2656, N'Palam', 371)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2657, N'Purna', 371)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2658, N'Junnar', 372)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2659, N'Ambegaon', 372)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2660, N'Shirur', 372)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2661, N'Khed', 372)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2662, N'Mawal', 372)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2663, N'Mulshi', 372)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2664, N'Haveli', 372)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2665, N'Pune City', 372)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2666, N'Daund', 372)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2667, N'Purandhar', 372)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2668, N'Velhe', 372)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2669, N'Bhor', 372)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2670, N'Baramati', 372)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2671, N'Indapur', 372)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2672, N'Khalapur', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2673, N'Pen', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2674, N'Alibag', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2675, N'Murud', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2676, N'Roha', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2677, N'Sudhagad', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2678, N'Mangaon', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2679, N'Tala', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2680, N'Shrivardhan', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2681, N'Mhasla', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2682, N'Mahad', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2683, N'Poladpur', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2684, N'Uran', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2685, N'Panvel', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2686, N'Karjat', 373)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2687, N'Mandangad', 374)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2688, N'Dapoli', 374)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2689, N'Khed', 374)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2690, N'Chiplun', 374)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2691, N'Guhagar', 374)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2692, N'Ratnagiri', 374)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2693, N'Sangameshwar', 374)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2694, N'Lanja', 374)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2695, N'Rajapur', 374)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2696, N'Shirala', 375)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2697, N'Walwa', 375)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2698, N'Palus', 375)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2699, N'Kadegaon', 375)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2700, N'Khanapur', 375)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2701, N'Atpadi', 375)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2702, N'Tasgaon', 375)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2703, N'Miraj', 375)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2704, N'Kavathemahankal', 375)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2705, N'Jat', 375)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2706, N'Mahabaleshwar', 376)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2707, N'Wai', 376)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2708, N'Khandala', 376)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2709, N'Phaltan', 376)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2710, N'Man', 376)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2711, N'Khatav', 376)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2712, N'Koregaon', 376)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2713, N'Satara', 376)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2714, N'Jaoli', 376)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2715, N'Patan', 376)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2716, N'Karad', 376)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2717, N'Devgad', 377)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2718, N'Vaibhavvadi', 377)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2719, N'Kankavli', 377)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2720, N'Malwan', 377)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2721, N'Vengurla', 377)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2722, N'Kudal', 377)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2723, N'Sawantwadi', 377)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2724, N'Dodamarg', 377)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2725, N'Karmala', 378)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2726, N'Madha', 378)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2727, N'Barshi', 378)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2728, N'Solapur North', 378)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2729, N'Mohol', 378)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2730, N'Pandharpur', 378)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2731, N'Malshiras', 378)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2732, N'Sangole', 378)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2733, N'Mangalvedhe', 378)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2734, N'Solapur South', 378)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2735, N'Akkalkot', 378)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2736, N'Talasari', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2737, N'Dahanu', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2738, N'Vikramgad', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2739, N'Jawhar', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2740, N'Mokhada', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2741, N'Vada', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2742, N'Palghar', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2743, N'Vasai', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2744, N'Thane', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2745, N'Bhiwandi', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2746, N'Shahapur', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2747, N'Kalyan', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2748, N'Ulhasnagar', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2749, N'Ambarnath', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2750, N'Murbad', 379)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2751, N'Ashti', 380)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2752, N'Karanja', 380)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2753, N'Arvi', 380)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2754, N'Seloo', 380)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2755, N'Wardha', 380)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2756, N'Deoli', 380)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2757, N'Hinganghat', 380)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2758, N'Samudrapur', 380)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2759, N'Malegaon', 381)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2760, N'Mangrulpir', 381)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2761, N'Karanja', 381)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2762, N'Manora', 381)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2763, N'Washim', 381)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2764, N'Risod', 381)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2765, N'Ner', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2766, N'Babulgaon', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2767, N'Kalamb', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2768, N'Yavatmal', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2769, N'Darwha', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2770, N'Digras', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2771, N'Pusad', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2772, N'Umarkhed', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2773, N'Mahagaon', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2774, N'Arni', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2775, N'Ghatanji', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2776, N'Kelapur', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2777, N'Ralegaon', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2778, N'Maregaon', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2779, N'Zari-Jamani', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2780, N'Wani', 382)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2781, N'Nambol', 383)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2782, N'Bishnupur', 383)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2783, N'Moirang', 383)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2784, N'Machi', 384)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2785, N'Tengnoupal', 384)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2786, N'Chandel', 384)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2787, N'Chakpikarong', 384)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2788, N'Tipaimukh', 385)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2789, N'Thanlon', 385)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2790, N'Churachandpur North', 385)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2791, N'Churachandpur', 385)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2792, N'Singngat', 385)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2793, N'Jiribam', 386)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2794, N'Sawombung', 386)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2795, N'Porompat', 386)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2796, N'Keirao Bitra', 386)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2797, N'Lamshang', 387)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2798, N'Patsoi', 387)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2799, N'Lamphelpat', 387)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2800, N'Wangoi', 387)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2801, N'Mao-Maram', 388)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2802, N'Paomata', 388)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2803, N'Purul', 388)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2804, N'Sadar Hills West', 388)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2805, N'Saitu-Gamphazol', 388)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2806, N'Sadar Hills East', 388)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2807, N'Tamenglong West', 389)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2808, N'Tamenglong North', 389)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2809, N'Tamenglong', 389)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2810, N'Nungba', 389)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2811, N'Lilong', 390)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2812, N'Thoubal', 390)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2813, N'Kakching', 390)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2814, N'Ukhrul North', 391)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2815, N'Ukhurl Central', 391)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2816, N'Kamjong-Chassad', 391)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2817, N'Phungyar-Phaisat', 391)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2818, N'Ukhrul South', 391)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2819, N'Resubelpara', 392)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2820, N'Dambo Rongjeng', 392)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2821, N'Kharkutta', 392)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2822, N'Songsak', 392)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2823, N'Samanda', 392)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2824, N'Mawphlang', 394)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2825, N'Mylliem', 394)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2826, N'Mawryngkneng', 394)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2827, N'Mawkynrew', 394)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2828, N'Khatarshnong Laitkroh', 394)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2829, N'Mawsynram', 394)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2830, N'Shella Bholaganj', 394)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2831, N'Pynursla', 394)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2832, N'Umling', 396)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2833, N'Jirang', 396)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2834, N'Umsning', 396)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2835, N'Chokpot', 397)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2836, N'Gasuapara', 397)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2837, N'Baghmara', 397)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2838, N'Rongara', 397)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2839, N'Selsella', 400)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2840, N'Dadenggiri', 400)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2841, N'Tikrikilla', 400)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2842, N'Rongram', 400)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2843, N'Betasing', 400)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2844, N'Zikzak', 400)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2845, N'Gambegre', 400)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2846, N'Dalu', 400)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2847, N'Nongstoin', 402)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2848, N'Mawthadraishan', 402)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2849, N'Mairang', 402)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2850, N'Ranikor', 402)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2851, N'Mawkyrwat', 402)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2852, N'Mawshynrut', 402)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2853, N'Darlawn', 403)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2854, N'Phullen', 403)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2855, N'Aibawk', 403)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2856, N'Tlangnuam (Part)', 403)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2857, N'Thingsulthliah (Part)', 403)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2858, N'Ngopa', 404)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2859, N'Khawzawl', 404)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2860, N'Champhai', 404)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2861, N'Khawbung', 404)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2862, N'East Lungdar (Part)', 404)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2863, N'N Thingdawl', 405)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2864, N'Bilkhawthlir', 405)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2865, N'Tlangnuam (Part)', 405)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2866, N'Chawngte', 406)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2867, N'Lawngtlai', 406)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2868, N'S Bungtlang', 406)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2869, N'Sangau', 406)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2870, N'West Bunghmun', 407)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2871, N'Lungsen', 407)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2872, N'Lunglei', 407)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2873, N'Hnahthial', 407)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2874, N'Zawlnuam', 408)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2875, N'West Phaileng', 408)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2876, N'Reiek', 408)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2877, N'Tuipang', 409)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2878, N'Saiha', 409)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2879, N'Thingsulthliah (Part)', 410)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2880, N'Serchhip', 410)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2881, N'East Lungdar (Part)', 410)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2882, N'Niuland', 411)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2883, N'Aquqhnaqua', 411)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2884, N'Kuhoboto', 411)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2885, N'Nihokhu', 411)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2886, N'Dimapur Sadar', 411)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2887, N'Chumukedima', 411)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2888, N'Dhansiripar', 411)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2889, N'Medziphema', 411)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2890, N'Seyochung', 412)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2891, N'Amahator', 412)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2892, N'Kiphire Sadar', 412)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2893, N'Kiusam', 412)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2894, N'Sitimi', 412)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2895, N'Longmatra', 412)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2896, N'Pungro', 412)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2897, N'Khongsa', 412)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2898, N'Kohima Sadar', 413)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2899, N'Sechu-Zubza', 413)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2900, N'Tseminyu', 413)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2901, N'Tsogin', 413)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2902, N'Chiephobozou', 413)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2903, N'Botsa', 413)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2904, N'Kezocha', 413)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2905, N'Jakhama', 413)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2906, N'Tamlu', 414)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2907, N'Namsang', 414)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2908, N'Yongnyah', 414)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2909, N'Longleng', 414)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2910, N'Sakshi', 414)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2911, N'Longchem', 415)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2912, N'Alongkima', 415)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2913, N'Tuli', 415)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2914, N'Changtongya', 415)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2915, N'Chuchuyimlang', 415)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2916, N'Kubolong', 415)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2917, N'Mangkolemba', 415)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2918, N'Merangmen', 415)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2919, N'Ongpangkong', 415)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2920, N'Naginimora', 416)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2921, N'Tizit', 416)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2922, N'Hunta', 416)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2923, N'Shangnyu', 416)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2924, N'Mon Sadar', 416)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2925, N'Wakching', 416)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2926, N'Aboi', 416)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2927, N'Longshen', 416)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2928, N'Phomching', 416)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2929, N'Chen', 416)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2930, N'Angjangyang', 416)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2931, N'Mopong', 416)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2932, N'Tobu', 416)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2933, N'Monyakshu', 416)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2934, N'Pedi (Ngwalwa)', 417)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2935, N'Jalukie', 417)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2936, N'Athibung', 417)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2937, N'Kebai Khelma', 417)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2938, N'Nsong', 417)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2939, N'Tening', 417)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2940, N'Peren', 417)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2941, N'Sekruzu', 418)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2942, N'Phek Sadar', 418)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2943, N'Khuza', 418)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2944, N'Meluri', 418)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2945, N'Phor', 418)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2946, N'Phokhungri', 418)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2947, N'Chozuba', 418)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2948, N'Chetheba', 418)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2949, N'Sakraba', 418)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2950, N'Pfutsero', 418)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2951, N'Zuketsa', 418)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2952, N'Khezhakeno', 418)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2953, N'Chizami', 418)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2954, N'Razieba', 418)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2955, N'Noksen', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2956, N'Chare', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2957, N'Longkhim', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2958, N'Tuensang Sadar', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2959, N'Ngoungchung', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2960, N'Sangsangnyu', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2961, N'Sotokur', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2962, N'Noklak', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2963, N'Chingmei', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2964, N'Nokhu', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2965, N'Panso', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2966, N'Shamator', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2967, N'Tsurungto', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2968, N'Chessore', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2969, N'Mangko', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2970, N'Thonoknyu', 419)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2971, N'Changpang', 420)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2972, N'Aitepyong', 420)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2973, N'Bhandari', 420)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2974, N'Baghty', 420)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2975, N'Sungro', 420)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2976, N'Sanis', 420)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2977, N'Lotsu', 420)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2978, N'Ralan', 420)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2979, N'Wozhuro', 420)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2980, N'Wokha Sadar', 420)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2981, N'Englan', 420)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2982, N'Chukitong', 420)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2983, N'V.K.', 421)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2984, N'Akuluto', 421)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2985, N'Suruhuto', 421)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2986, N'Asuto', 421)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2987, N'Aghunato', 421)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2988, N'Zunheboto Sadar', 421)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2989, N'Atoizu', 421)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2990, N'Akuhaito', 421)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2991, N'Pughoboto', 421)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2992, N'Ghathashi', 421)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2993, N'Satakha', 421)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2994, N'Saptiqa', 421)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2995, N'Satoi', 421)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2996, N'Talcher Sadar', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2997, N'Colliery', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2998, N'Bikrampur', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (2999, N'Nalco', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3000, N'Banarpal', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3001, N'Bhusan Steel Limited', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3002, N'Anugul', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3003, N'Jarapada', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3004, N'Industrial', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3005, N'Chhendipada', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3006, N'Handapa', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3007, N'Kishorenagar', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3008, N'Athmallik', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3009, N'Kiakata', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3010, N'Thakurgarh', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3011, N'Purunakot', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3012, N'Bantala', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3013, N'Palalahada', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3014, N'Khamar', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3015, N'Rengali Damsite', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3016, N'Kaniha', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3017, N'N.T.P.C.', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3018, N'Samal Barrage', 422)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3019, N'Loisinga', 423)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3020, N'Balangir', 423)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3021, N'Tushura', 423)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3022, N'Patnagarh', 423)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3023, N'Khaprakhol', 423)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3024, N'Turekela', 423)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3025, N'Belpara', 423)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3026, N'Saintala', 423)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3027, N'Kantabanji', 423)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3028, N'Bangomunda', 423)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3029, N'Sindhekela', 423)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3030, N'Titlagarh', 423)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3031, N'Raibania', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3032, N'Jaleswar', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3033, N'Bhograi', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3034, N'Kamarda', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3035, N'Baliapal', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3036, N'Singla', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3037, N'Basta', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3038, N'Rupsa', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3039, N'Baleshwar Sadar', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3040, N'Sahadevkhunta', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3041, N'Chandipur', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3042, N'Balaramgadi Marine', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3043, N'Bampada', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3044, N'Remuna', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3045, N'Nilagiri', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3046, N'Berhampur', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3047, N'Oupada', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3048, N'Khaira', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3049, N'Soro', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3050, N'Similia', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3051, N'Baleshwar (M)', 424)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3052, N'Paikamal', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3053, N'Jharbandha', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3054, N'Padmapur', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3055, N'Burden', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3056, N'Gaisilet', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3057, N'Melchhamunda', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3058, N'Sohela', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3059, N'Bijepur', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3060, N'Barapali', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3061, N'Bheden', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3062, N'Bargarh', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3063, N'Bargarh Sadar', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3064, N'Bhatli', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3065, N'Ambabhona', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3066, N'Attabira', 425)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3067, N'Agarpada', 426)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3068, N'Bant', 426)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3069, N'Bhandari Pokhari', 426)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3070, N'Dhamanagar', 426)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3071, N'Bhadrak Rural', 426)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3072, N'Basudebpur', 426)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3073, N'Naikanidihi', 426)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3074, N'Tihidi', 426)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3075, N'Dhusuri', 426)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3076, N'Chandabali', 426)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3077, N'Bansada', 426)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3078, N'Dhamara Marine', 426)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3079, N'Kantamal', 427)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3080, N'Manamunda', 427)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3081, N'Baunsuni', 427)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3082, N'Baudh Sadar', 427)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3083, N'Puruna Katak', 427)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3084, N'Harbhanga', 427)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3085, N'Narasinghpur', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3086, N'Kanpur', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3087, N'Badamba', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3088, N'Baidyeswar', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3089, N'Banki', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3090, N'Tigiria', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3091, N'Athagad', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3092, N'Barang', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3093, N'Gurudijhatia', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3094, N'Khuntuni', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3095, N'Choudwar', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3096, N'Tangi', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3097, N'Mahanga', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3098, N'Salepur', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3099, N'Nischintakoili', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3100, N'Nemalo', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3101, N'Kishannagar', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3102, N'Jagatpur', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3103, N'Cuttack Sadar', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3104, N'Kandarpur', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3105, N'C.R.R.I.', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3106, N'Gobindpur', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3107, N'Olatapur', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3108, N'Niali', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3109, N'Cuttack (M Corp.)', 428)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3110, N'Debagarh', 429)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3111, N'Barkot', 429)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3112, N'Kundheigola', 429)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3113, N'Reamal', 429)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3114, N'Parajang', 430)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3115, N'Kamakshyanagar', 430)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3116, N'Kankadahad', 430)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3117, N'Bhuban', 430)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3118, N'Gandia', 430)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3119, N'Nihalprasad', 430)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3120, N'Tumusingha', 430)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3121, N'Motunga', 430)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3122, N'Bhusan Steel Limited', 430)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3123, N'Balimi', 430)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3124, N'Hindol', 430)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3125, N'Rasol', 430)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3126, N'Dhenkanal Sadar', 430)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3127, N'Adva', 431)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3128, N'Mohana', 431)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3129, N'R.Udaygiri', 431)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3130, N'Serango', 431)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3131, N'Kashinagara', 431)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3132, N'Parlakhemundi', 431)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3133, N'Gurandi', 431)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3134, N'Rayagada', 431)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3135, N'Garabandha', 431)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3136, N'Ramagiri', 431)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3137, N'Tarasingi', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3138, N'Buguda', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3139, N'Jagannath Prasad', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3140, N'Bhanjanagar', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3141, N'Gangapur', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3142, N'Surada', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3143, N'Badagada', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3144, N'Asika', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3145, N'Dharakote', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3146, N'Kabisuryanagar', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3147, N'Polasara', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3148, N'Kodala', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3149, N'Khalikote', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3150, N'Rambha', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3151, N'Chhatrapur', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3152, N'Ganjam', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3153, N'Chamakhandi', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3154, N'Arjyapalli Marine', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3155, N'Purusottampur', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3156, N'Hinjili', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3157, N'Patapur', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3158, N'Seragad', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3159, N'Brahmapur Sadar', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3160, N'Gopalpur', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3161, N'Golanthara', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3162, N'Digapahandi', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3163, N'Nuagaon', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3164, N'Jarada', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3165, N'Ramagiri', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3166, N'Brahmapur (M.Corp.)', 432)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3167, N'Paradip', 433)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3168, N'Paradeep Lock', 433)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3169, N'Kujang', 433)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3170, N'Abhyachandpur', 433)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3171, N'Ersama', 433)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3172, N'Tirtol', 433)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3173, N'Jagatsinghapur', 433)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3174, N'Biridi', 433)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3175, N'Naugaon', 433)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3176, N'Balikuda', 433)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3177, N'Sukinda', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3178, N'Tomka', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3179, N'Kaliapani', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3180, N'Kalinganagar', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3181, N'Jakhapura', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3182, N'Jajapur Road', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3183, N'Korai', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3184, N'Panikoili', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3185, N'Jajapur', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3186, N'Jajpur Sadar', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3187, N'Dharmasala', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3188, N'Jenapur', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3189, N'Kuakhia', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3190, N'Badachana', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3191, N'Balichandrapur', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3192, N'Binjharpur', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3193, N'Bari - Ramachandrapur', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3194, N'Mangalpur', 434)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3195, N'Rengali', 435)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3196, N'Lakhanpur', 435)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3197, N'Belpahar', 435)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3198, N'Banaharapali', 435)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3199, N'Orient', 435)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3200, N'Brajarajnagar', 435)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3201, N'Jharsuguda', 435)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3202, N'Badmal', 435)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3203, N'Laikera', 435)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3204, N'Kolabira', 435)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3205, N'Kesinga', 436)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3206, N'Madanpur Rampur', 436)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3207, N'Narala', 436)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3208, N'Lanjigarh', 436)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3209, N'Biswanathpur', 436)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3210, N'Sadar', 436)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3211, N'Kegaon', 436)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3212, N'Junagarh', 436)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3213, N'Golamunda', 436)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3214, N'Dharamgarh', 436)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3215, N'Kokasara', 436)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3216, N'Jayapatna', 436)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3217, N'Thuamul Rampur', 436)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3218, N'Gochhapada', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3219, N'Phulabani', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3220, N'Phulabani Town', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3221, N'Khajuripada', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3222, N'G.Udayagiri', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3223, N'Tikabali', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3224, N'Chakapada', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3225, N'Sarangagarh', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3226, N'Phiringia', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3227, N'Baliguda', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3228, N'Nuagaon', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3229, N'Tumudibandha', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3230, N'Belaghar', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3231, N'Kotagarh', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3232, N'Brahmanigaon', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3233, N'Daringbadi', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3234, N'Raikia', 437)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3235, N'Rajkanika', 438)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3236, N'Rajnagar', 438)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3237, N'Jamboo Marine', 438)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3238, N'Aali', 438)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3239, N'Pattamundai', 438)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3240, N'Kendrapara', 438)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3241, N'Kendrapara Sadar', 438)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3242, N'Nikirai', 438)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3243, N'Derabish', 438)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3244, N'Patkura', 438)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3245, N'Marsaghai', 438)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3246, N'Mahakalapada', 438)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3247, N'Harichandanpur', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3248, N'Daitari', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3249, N'Ghasipura', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3250, N'Anandapur', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3251, N'Soso', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3252, N'Nandipada', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3253, N'Sainkul', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3254, N'Barbil', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3255, N'Bolani', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3256, N'Rugudi', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3257, N'Joda', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3258, N'Bamebari', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3259, N'Champua', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3260, N'Jhumpura', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3261, N'Baria', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3262, N'Turumunga', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3263, N'Patana', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3264, N'Kendujhar Sadar', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3265, N'Kendujhar Town', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3266, N'Nayakote', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3267, N'Kanjipani', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3268, N'Telkoi', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3269, N'Pandapara', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3270, N'Ghatgaon', 439)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3271, N'Bolagad', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3272, N'Begunia', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3273, N'Khordha', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3274, N'Khordha Sadar', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3275, N'Chandaka', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3276, N'Nandankanan', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3277, N'Mancheswar', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3278, N'Balianta', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3279, N'Balipatna', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3280, N'Lingaraj', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3281, N'Airfield (Kapila Prasad)', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3282, N'Uttara', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3283, N'Khandagiri', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3284, N'Tamando', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3285, N'Jatani', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3286, N'Jankia', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3287, N'Nirakarpur', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3288, N'Tangi', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3289, N'Balugaon', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3290, N'Banapur', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3291, N'Bhubaneswar (M.Corp.)', 440)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3292, N'Kotpad', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3293, N'Boriguma', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3294, N'Bhairabsingipur', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3295, N'Dasamantapur', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3296, N'Lakshmipur', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3297, N'Narayanpatana', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3298, N'Bandhugaon', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3299, N'Kakiriguma', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3300, N'Koraput', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3301, N'Koraput Town', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3302, N'Jeypore', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3303, N'Kundura', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3304, N'Boipariguda', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3305, N'Machh kund', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3306, N'Padua', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3307, N'Nandapur', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3308, N'Similiguda', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3309, N'Sunabeda', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3310, N'Damonjodi', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3311, N'Pottangi', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3312, N'Kotiya', 441)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3313, N'Malkangiri', 442)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3314, N'Mathili', 442)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3315, N'Mudulipada', 442)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3316, N'Chitrakonda', 442)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3317, N'Paparmetla', 442)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3318, N'Jodamba', 442)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3319, N'Orkel', 442)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3320, N'Kalimela', 442)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3321, N'Podia', 442)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3322, N'M.V. 79', 442)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3323, N'Motu', 442)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3324, N'Tiring', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3325, N'Bahalda', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3326, N'Jamda', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3327, N'Rairangpur Town', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3328, N'Gorumahisani', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3329, N'Jharpokharia', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3330, N'Bisoi', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3331, N'Rairangpur', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3332, N'Badampahar', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3333, N'Jashipur', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3334, N'Raruan', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3335, N'Ghagarbeda', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3336, N'Karanjia', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3337, N'Thakurmunda', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3338, N'Baripada Sadar', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3339, N'Baripada Town', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3340, N'Koliana', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3341, N'Bangiriposi', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3342, N'Chandua', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3343, N'Suliapada', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3344, N'Muruda', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3345, N'Rasagobindapur', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3346, N'Baisinga', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3347, N'Betanati', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3348, N'Barsahi', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3349, N'Khunta', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3350, N'Udala', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3351, N'Kaptipada', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3352, N'Sharata', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3353, N'Mahuldiha', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3354, N'Baripada (M)', 443)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3355, N'Raighar', 444)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3356, N'Kundei', 444)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3357, N'Umarkote', 444)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3358, N'Chandahandi', 444)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3359, N'Jharigan', 444)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3360, N'Dabugan', 444)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3361, N'Paparahandi', 444)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3362, N'Kodinga', 444)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3363, N'Kosagumuda', 444)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3364, N'Nabarangapur', 444)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3365, N'Tentulikhunti', 444)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3366, N'Khatiguda', 444)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3367, N'Gania', 445)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3368, N'Dasapalla', 445)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3369, N'Banigochha', 445)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3370, N'Nuagaon', 445)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3371, N'Khandapada', 445)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3372, N'Fategarh', 445)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3373, N'Nayagarh', 445)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3374, N'Itamati', 445)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3375, N'Nayagarh Sadar', 445)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3376, N'Odagaon', 445)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3377, N'Sarankul', 445)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3378, N'Ranapur', 445)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3379, N'Jonk', 446)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3380, N'Nuapada', 446)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3381, N'Komna', 446)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3382, N'Khariar', 446)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3383, N'Boden', 446)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3384, N'Sinapali', 446)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3385, N'Delanga', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3386, N'Pipili', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3387, N'Nimapada', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3388, N'Kakatpur', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3389, N'Astaranga', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3390, N'Konark', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3391, N'Gop', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3392, N'Ramachandi', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3393, N'Satyabadi', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3394, N'Chandanpur', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3395, N'Sadar', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3396, N'Brahmagiri', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3397, N'Gadisagada', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3398, N'Krushna Prasad', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3399, N'Puri (M)', 447)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3400, N'Ambadala', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3401, N'Muniguda', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3402, N'Chandrapur', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3403, N'Bishamakatak', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3404, N'Kalyanasingpur', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3405, N'Kashipur', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3406, N'Andirakanch', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3407, N'Tikiri', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3408, N'Doraguda', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3409, N'Rayagada', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3410, N'Seskhal', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3411, N'Gunupur', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3412, N'Gudari', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3413, N'Padmapur', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3414, N'Puttasing', 448)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3415, N'Govindpur', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3416, N'Mahulpalli', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3417, N'Kochinda', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3418, N'Katarbaga', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3419, N'Thelkoloi', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3420, N'Rengali', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3421, N'Sasan', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3422, N'Hirakud', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3423, N'Burla', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3424, N'Dhanupali', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3425, N'Ainthapali', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3426, N'Sadar', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3427, N'Jamankira', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3428, N'Kisinda', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3429, N'Jujomura', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3430, N'Dhama', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3431, N'Charamal', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3432, N'Rairakhol', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3433, N'Naktideul', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3434, N'Sambalpur (M)', 449)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3435, N'Dunguripali', 450)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3436, N'Rampur', 450)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3437, N'Binika', 450)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3438, N'Ulunda', 450)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3439, N'Biramaharajpur', 450)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3440, N'Subalaya', 450)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3441, N'Sonapur', 450)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3442, N'Tarbha', 450)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3443, N'Hemgir', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3444, N'Lephripara', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3445, N'Bhasma', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3446, N'Dharuadihi', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3447, N'Sundargarh Town', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3448, N'Sundargarh', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3449, N'Kinjirkela', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3450, N'Talasara', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3451, N'Baragaon', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3452, N'Kutra', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3453, N'Rajagangapur', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3454, N'Raiboga', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3455, N'Biramitrapur', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3456, N'Hatibari', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3457, N'Bisra', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3458, N'Bondamunda', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3459, N'Brahmani Tarang', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3460, N'Raghunathapali', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3461, N'Tangarapali', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3462, N'Lathikata', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3463, N'Chandiposh', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3464, N'Kamarposh Balang', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3465, N'Koida', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3466, N'Lahunipara', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3467, N'Gurundia', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3468, N'Tikaetpali', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3469, N'Banei', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3470, N'Mahulapada', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3471, N'Raurkela (M)', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3472, N'Raurkela (ITS)', 451)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3473, N'Karaikal Taluk', 452)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3474, N'Thirunallar Taluk', 452)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3475, N'Mahe Taluk', 453)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3476, N'Puducherry Taluk', 454)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3477, N'Ozhukarai Taluk', 454)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3478, N'Villianur Taluk', 454)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3479, N'Bahour Taluk', 454)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3480, N'Yanam Taluk', 455)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3481, N'Ajnala', 456)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3482, N'Amritsar -I', 456)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3483, N'Amritsar- II', 456)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3484, N'Baba Bakala', 456)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3485, N'Barnala', 457)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3486, N'Tapa', 457)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3487, N'Rampura Phul', 458)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3488, N'Bathinda', 458)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3489, N'Talwandi Sabo', 458)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3490, N'Faridkot', 459)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3491, N'Jaitu', 459)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3492, N'Bassi Pathana', 460)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3493, N'Fatehgarh Sahib', 460)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3494, N'Amloh', 460)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3495, N'Khamanon', 460)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3496, N'Zira', 462)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3497, N'Firozpur', 462)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3498, N'Jalalabad', 462)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3499, N'Fazilka', 462)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3500, N'Abohar', 462)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3501, N'Dhar Kalan', 463)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3502, N'Pathankot', 463)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3503, N'Gurdaspur', 463)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3504, N'Batala', 463)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3505, N'Dera Baba Nanak', 463)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3506, N'Dasua', 464)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3507, N'Mukerian', 464)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3508, N'Hoshiarpur', 464)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3509, N'Garhshankar', 464)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3510, N'Shahkot', 465)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3511, N'Nakodar', 465)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3512, N'Phillaur', 465)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3513, N'Jalandhar - I', 465)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3514, N'Jalandhar - II', 465)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3515, N'Bhulath', 466)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3516, N'Kapurthala', 466)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3517, N'Sultanpur Lodhi', 466)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3518, N'Phagwara', 466)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3519, N'Samrala', 467)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3520, N'Khanna', 467)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3521, N'Payal', 467)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3522, N'Ludhiana (East)', 467)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3523, N'Ludhiana (West)', 467)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3524, N'Raikot', 467)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3525, N'Jagraon', 467)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3526, N'Sardulgarh', 468)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3527, N'Budhlada', 468)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3528, N'Mansa', 468)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3529, N'Nihal Singhwala', 469)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3530, N'Bagha Purana', 469)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3531, N'Moga', 469)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3532, N'Malout', 470)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3533, N'Gidderbaha', 470)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3534, N'Muktsar', 470)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3535, N'Samana', 473)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3536, N'Patran', 473)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3537, N'Nabha', 473)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3538, N'Patiala', 473)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3539, N'Rajpura', 473)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3540, N'Anandpur Sahib', 474)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3541, N'Nangal', 474)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3542, N'Rup Nagar', 474)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3543, N'Chamkaur Sahib', 474)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3544, N'Sunam', 475)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3545, N'Lehra', 475)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3546, N'Moonak', 475)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3547, N'Malerkotla', 475)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3548, N'Dhuri', 475)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3549, N'Sangrur', 475)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3550, N'Nawanshahr', 476)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3551, N'Balachaur', 476)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3552, N'Tarn Taran', 477)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3553, N'Patti', 477)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3554, N'Khadur Sahib', 477)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3555, N'Kishangarh', 478)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3556, N'Ajmer', 478)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3557, N'Peesangan', 478)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3558, N'Beawar', 478)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3559, N'Masuda', 478)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3560, N'Nasirabad', 478)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3561, N'Bhinay', 478)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3562, N'Sarwar', 478)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3563, N'Kekri', 478)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3564, N'Behror', 479)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3565, N'Mandawar', 479)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3566, N'Kotkasim', 479)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3567, N'Tijara', 479)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3568, N'Kishangarh Bas', 479)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3569, N'Ramgarh', 479)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3570, N'Alwar', 479)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3571, N'Bansur', 479)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3572, N'Thanagazi', 479)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3573, N'Rajgarh', 479)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3574, N'Lachhmangarh', 479)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3575, N'Kathumar', 479)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3576, N'Ghatol', 48)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3577, N'Garhi', 48)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3578, N'Banswara', 48)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3579, N'Bagidora', 48)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3580, N'Kushalgarh', 48)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3581, N'Mangrol', 481)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3582, N'Antah', 481)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3583, N'Baran', 481)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3584, N'Atru', 481)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3585, N'Kishanganj', 481)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3586, N'Shahbad', 481)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3587, N'Chhabra', 481)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3588, N'Chhipabarod', 481)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3589, N'Sheo', 482)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3590, N'Baytoo', 482)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3591, N'Pachpadra', 482)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3592, N'Siwana', 482)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3593, N'Gudha Malani', 482)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3594, N'Barmer', 482)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3595, N'Ramsar', 482)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3596, N'Chohtan', 482)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3597, N'Pahari', 483)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3598, N'Kaman', 483)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3599, N'Nagar', 483)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3600, N'Deeg', 483)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3601, N'Nadbai', 483)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3602, N'Kumher', 483)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3603, N'Bharatpur', 483)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3604, N'Weir', 483)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3605, N'Bayana', 483)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3606, N'Rupbas', 483)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3607, N'Asind', 484)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3608, N'Hurda', 484)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3609, N'Shahpura', 484)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3610, N'Banera', 484)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3611, N'Mandal', 484)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3612, N'Raipur', 484)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3613, N'Sahara', 484)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3614, N'Bhilwara', 484)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3615, N'Kotri', 484)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3616, N'Jahazpur', 484)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3617, N'Mandalgarh', 484)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3618, N'Beejoliya', 484)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3619, N'Bikaner', 485)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3620, N'Poogal', 485)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3621, N'Lunkaransar', 485)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3622, N'Kolayat', 485)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3623, N'Nokha', 485)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3624, N'Khajuwala', 485)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3625, N'Chhatargarh', 485)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3626, N'Sridungargarh', 485)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3627, N'Hindoli', 486)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3628, N'Nainwa', 486)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3629, N'Indragarh', 486)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3630, N'Keshoraipatan', 486)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3631, N'Bundi', 486)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3632, N'Rashmi', 487)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3633, N'Gangrar', 487)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3634, N'Begun', 487)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3635, N'Rawatbhata', 487)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3636, N'Chittaurgarh', 487)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3637, N'Kapasan', 487)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3638, N'Dungla', 487)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3639, N'Bhadesar', 487)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3640, N'Nimbahera', 487)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3641, N'Bari Sadri', 487)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3642, N'Taranagar', 488)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3643, N'Rajgarh', 488)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3644, N'Sardarshahar', 488)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3645, N'Churu', 488)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3646, N'Ratangarh', 488)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3647, N'Sujangarh', 488)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3648, N'Baswa', 489)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3649, N'Mahwa', 489)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3650, N'Sikrai', 489)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3651, N'Dausa', 489)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3652, N'Lalsot', 489)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3653, N'Baseri', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3654, N'Bari', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3655, N'Sepau', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3656, N'Dhaulpur', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3657, N'Rajakhera', 49)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3658, N'Dungarpur', 491)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3659, N'Aspur', 491)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3660, N'Sagwara', 491)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3661, N'Simalwara', 491)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3662, N'Sangaria', 492)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3663, N'Tibi', 492)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3664, N'Hanumangarh', 492)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3665, N'Pilibanga', 492)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3666, N'Rawatsar', 492)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3667, N'Nohar', 492)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3668, N'Bhadra', 492)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3669, N'Kotputli', 493)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3670, N'Viratnagar', 493)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3671, N'Shahpura', 493)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3672, N'Chomu', 493)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3673, N'Phulera (Hq.Sambhar)', 493)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3674, N'Mauzamabad', 493)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3675, N'Phagi', 493)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3676, N'Sanganer', 493)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3677, N'Jaipur', 493)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3678, N'Amber', 493)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3679, N'Jamwa Ramgarh', 493)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3680, N'Bassi', 493)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3681, N'Chaksu', 493)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3682, N'Jaisalmer', 494)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3683, N'Pokaran', 494)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3684, N'Fatehgarh', 494)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3685, N'Sayla', 495)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3686, N'Ahore', 495)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3687, N'Jalor', 495)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3688, N'Bhinmal', 495)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3689, N'Bagora', 495)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3690, N'Sanchore', 495)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3691, N'Raniwara', 495)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3692, N'Pirawa', 496)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3693, N'Gangdhar', 496)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3694, N'Khanpur', 496)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3695, N'Jhalrapatan', 496)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3696, N'Aklera', 496)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3697, N'Manohar Thana', 496)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3698, N'Pachpahar', 496)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3699, N'Jhunjhunun', 497)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3700, N'Chirawa', 497)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3701, N'Buhana', 497)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3702, N'Khetri', 497)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3703, N'Nawalgarh', 497)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3704, N'Udaipurwati', 497)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3705, N'Phalodi', 498)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3706, N'Osian', 498)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3707, N'Bhopalgarh', 498)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3708, N'Jodhpur', 498)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3709, N'Shergarh', 498)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3710, N'Luni', 498)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3711, N'Bilara', 498)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3712, N'Todabhim', 499)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3713, N'Nadoti', 499)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3714, N'Hindaun', 499)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3715, N'Karauli', 499)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3716, N'Mandrail', 499)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3717, N'Sapotra', 499)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3718, N'Pipalda', 50)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3719, N'Digod', 50)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3720, N'Ladpura', 50)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3721, N'Ramganj Mandi', 50)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3722, N'Sangod', 50)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3723, N'Ladnu', 501)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3724, N'Didwana', 501)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3725, N'Jayal', 501)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3726, N'Nagaur', 501)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3727, N'Kheenvsar', 501)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3728, N'Merta', 501)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3729, N'Degana', 501)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3730, N'Parbatsar', 501)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3731, N'Makrana', 501)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3732, N'Nawa', 501)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3733, N'Jaitaran', 502)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3734, N'Raipur', 502)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3735, N'Sojat', 502)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3736, N'Rohat', 502)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3737, N'Pali', 502)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3738, N'Marwar Junction', 502)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3739, N'Desuri', 502)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3740, N'Sumerpur', 502)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3741, N'Bali', 502)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3742, N'Dhariawad', 503)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3743, N'Peepalkhoont', 503)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3744, N'Chhoti Sadri', 503)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3745, N'Pratapgarh', 503)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3746, N'Arnod', 503)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3747, N'Bhim', 504)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3748, N'Deogarh', 504)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3749, N'Amet', 504)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3750, N'Kumbhalgarh', 504)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3751, N'Rajsamand', 504)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3752, N'Railmagra', 504)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3753, N'Nathdwara', 504)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3754, N'Gangapur', 505)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3755, N'Bamanwas', 505)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3756, N'Malarna Doongar', 505)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3757, N'Bonli', 505)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3758, N'Chauth Ka Barwara', 505)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3759, N'Sawai Madhopur', 505)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3760, N'Khandar', 505)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3761, N'Fatehpur', 506)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3762, N'Lachhmangarh', 506)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3763, N'Sikar', 506)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3764, N'Danta Ramgarh', 506)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3765, N'Sri Madhopur', 506)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3766, N'Neem-Ka-Thana', 506)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3767, N'Sheoganj', 507)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3768, N'Sirohi', 507)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3769, N'Pindwara', 507)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3770, N'Abu Road', 507)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3771, N'Reodar', 507)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3772, N'Karanpur', 508)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3773, N'Ganganagar', 508)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3774, N'Sadulshahar', 508)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3775, N'Padampur', 508)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3776, N'Raisinghnagar', 508)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3777, N'Anupgarh', 508)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3778, N'Gharsana', 508)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3779, N'Vijainagar', 508)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3780, N'Suratgarh', 508)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3781, N'Malpura', 509)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3782, N'Peeplu', 509)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3783, N'Niwai', 509)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3784, N'Tonk', 509)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3785, N'Todaraisingh', 509)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3786, N'Deoli', 509)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3787, N'Uniara', 509)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3788, N'Mavli', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3789, N'Gogunda', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3790, N'Kotra', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3791, N'Jhadol', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3792, N'Girwa', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3793, N'Vallabhnagar', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3794, N'Lasadiya', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3795, N'Salumbar', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3796, N'Sarada', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3797, N'Rishabhdeo', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3798, N'Kherwara', 51)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3799, N'Gangtok', 511)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3800, N'Pakyong', 511)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3801, N'Rongli', 511)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3802, N'Tshungthang', 512)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3803, N'Mangan', 512)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3804, N'Namchi', 513)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3805, N'Ravong', 513)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3806, N'Gyalshing', 514)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3807, N'Soreng', 514)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3808, N'Kannad', 616)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3809, N'Soegaon', 616)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3810, N'Sillod', 616)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3811, N'Phulambri', 616)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3812, N'Aurangabad', 616)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3813, N'Khuldabad', 616)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3814, N'Vaijapur', 616)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3815, N'Gangapur', 616)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3816, N'Paithan', 616)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3817, N'Surgana', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3818, N'Kalwan', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3819, N'Deola', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3820, N'Baglan', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3821, N'Malegaon', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3822, N'Nandgaon', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3823, N'Chandvad', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3824, N'Dindori', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3825, N'Peint', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3826, N'Trimbakeshwar', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3827, N'Nashik', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3828, N'Igatpuri', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3829, N'Sinnar', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3830, N'Niphad', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3831, N'Yevla', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3832, N'Talasari', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3833, N'Dahanu', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3834, N'Vikramgad', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3835, N'Jawhar', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3836, N'Mokhada', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3837, N'Vada', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3838, N'Palghar', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3839, N'Vasai', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3840, N'Thane', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3841, N'Bhiwandi', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3842, N'Shahapur', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3843, N'Kalyan', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3844, N'Ulhasnagar', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3845, N'Ambarnath', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3846, N'Murbad', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3847, N'Khalapur', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3848, N'Pen', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3849, N'Alibag', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3850, N'Murud', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3851, N'Roha', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3852, N'Sudhagad', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3853, N'Mangaon', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3854, N'Tala', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3855, N'Shrivardhan', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3856, N'Mhasla', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3857, N'Mahad', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3858, N'Poladpur', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3859, N'Uran', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3860, N'Panvel', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3861, N'Karjat', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3862, N'Junnar', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3863, N'Ambegaon', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3864, N'Shirur', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3865, N'Khed', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3866, N'Mawal', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3867, N'Mulshi', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3868, N'Haveli', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3869, N'Pune City', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3870, N'Daund', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3871, N'Purandhar', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3872, N'Velhe', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3873, N'Bhor', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3874, N'Baramati', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3875, N'Indapur', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3876, N'Akola', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3877, N'Sangamner', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3878, N'Kopargaon', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3879, N'Rahta', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3880, N'Shrirampur', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3881, N'Nevasa', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3882, N'Shevgaon', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3883, N'Pathardi', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3884, N'Nagar', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3885, N'Rahuri', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3886, N'Parner', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3887, N'Shrigonda', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3888, N'Karjat', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3889, N'Jamkhed', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3890, N'Ashti', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3891, N'Patoda', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3892, N'Shirur (Kasar)', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3893, N'Georai', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3894, N'Manjlegaon', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3895, N'Wadwani', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3896, N'Bid', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3897, N'Kaij', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3898, N'Dharur', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3899, N'Parli', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3900, N'Ambejogai', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3901, N'Latur', 613)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3902, N'Renapur', 613)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3903, N'Ahmadpur', 613)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3904, N'Jalkot', 613)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3905, N'Chakur', 613)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3906, N'Shirur-Anantpal', 613)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3907, N'Ausa', 613)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3908, N'Nilanga', 613)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3909, N'Deoni', 613)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3910, N'Udgir', 613)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3911, N'Paranda', 631)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3912, N'Bhum', 631)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3913, N'Washi', 631)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3914, N'Kalamb', 631)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3915, N'Osmanabad', 631)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3916, N'Tuljapur', 631)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3917, N'Lohara', 631)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3918, N'Umarga', 631)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3919, N'Karmala', 623)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3920, N'Madha', 623)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3921, N'Barshi', 623)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3922, N'Solapur North', 623)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3923, N'Mohol', 623)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3924, N'Pandharpur', 623)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3925, N'Malshiras', 623)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3926, N'Sangole', 623)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3927, N'Mangalvedhe', 623)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3928, N'Solapur South', 623)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3929, N'Akkalkot', 623)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3930, N'Mahabaleshwar', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3931, N'Wai', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3932, N'Khandala', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3933, N'Phaltan', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3934, N'Man', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3935, N'Khatav', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3936, N'Koregaon', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3937, N'Satara', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3938, N'Jaoli', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3939, N'Patan', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3940, N'Karad', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3941, N'Mandangad', 609)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3942, N'Dapoli', 609)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3943, N'Khed', 609)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3944, N'Chiplun', 609)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3945, N'Guhagar', 609)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3946, N'Ratnagiri', 609)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3947, N'Sangameshwar', 609)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3948, N'Lanja', 609)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3949, N'Rajapur', 609)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3950, N'Shahuwadi', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3951, N'Panhala', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3952, N'Hatkanangle', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3953, N'Shirol', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3954, N'Karvir', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3955, N'Bavda', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3956, N'Radhanagari', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3957, N'Kagal', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3958, N'Bhudargad', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3959, N'Ajra', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3960, N'Gadhinglaj', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3961, N'Chandgad', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3962, N'Shirala', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3963, N'Walwa', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3964, N'Palus', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3965, N'Kadegaon', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3966, N'Khanapur', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3967, N'Atpadi', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3968, N'Tasgaon', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3969, N'Miraj', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3970, N'Kavathemahankal', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3971, N'Jat', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3972, N'Sirpur', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3973, N'Rebbana', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3974, N'Bhimini', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3975, N'Dahegaon', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3976, N'Vemanpalle', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3977, N'Nennal', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3978, N'Tandur', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3979, N'Tiryani', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3980, N'Jannaram', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3981, N'Kaddam (Peddur)', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3982, N'Sarangapur', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3983, N'Kuntala', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3984, N'Kubeer', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3985, N'Bhainsa', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3986, N'Tanoor', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3987, N'Mudhole', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3988, N'Lokeswaram', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3989, N'Dilawarpur', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3990, N'Nirmal', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3991, N'Laxmanchanda', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3992, N'Mamda', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3993, N'Khanapur', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3994, N'Dandepalle', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3995, N'Kasipet', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3996, N'Bellampalle', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3997, N'Kotapalle', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3998, N'Mandamarri', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (3999, N'Luxettipet', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4000, N'Mancherial', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4001, N'Jaipur', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4002, N'Chennur', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4003, N'Tamsi', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4004, N'Adilabad', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4005, N'Jainad', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4006, N'Bela', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4007, N'Talamadugu', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4008, N'Gudihathnoor', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4009, N'Inderavelly', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4010, N'Narnoor', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4011, N'Kerameri', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4012, N'Wankdi', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4013, N'Sirpur (T)', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4014, N'Kouthala', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4015, N'Bejjur', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4016, N'Kagaznagar', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4017, N'Asifabad', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4018, N'Jainoor', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4019, N'Utnoor', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4020, N'Ichoda', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4021, N'Bazarhathnoor', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4022, N'Boath', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4023, N'Neradigonda', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4024, N'Ranjal', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4025, N'Navipet', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4026, N'Nandipet', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4027, N'Armur', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4028, N'Balkonda', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4029, N'Mortad', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4030, N'Kammarpalle', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4031, N'Bheemgal', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4032, N'Velpur', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4033, N'Jakranpalle', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4034, N'Makloor', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4035, N'Nizamabad', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4036, N'Yedpalle', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4037, N'Bodhan', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4038, N'Kotgiri', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4039, N'Madnoor', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4040, N'Jukkal', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4041, N'Bichkunda', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4042, N'Birkoor', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4043, N'Varni', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4044, N'Dichpalle', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4045, N'Dharpalle', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4046, N'Sirkonda', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4047, N'Machareddy', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4048, N'Sadasivanagar', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4049, N'Gandhari', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4050, N'Banswada', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4051, N'Pitlam', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4052, N'Nizamsagar', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4053, N'Yellareddy', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4054, N'Nagareddipet', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4055, N'Lingampet', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4056, N'Tadwai', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4057, N'Kamareddy', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4058, N'Bhiknoor', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4059, N'Domakonda', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4060, N'Ibrahimpatnam', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4061, N'Mallapur', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4062, N'Raikal', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4063, N'Sarangapur', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4064, N'Dharmapuri', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4065, N'Velgatoor', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4066, N'Ramagundam', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4067, N'Kamanpur', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4068, N'Manthani', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4069, N'Kataram', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4070, N'Mahadevpur', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4071, N'Mutharam (Mahadevpur)', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4072, N'Malharrao', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4073, N'Mutharam (Manthani)', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4074, N'Srirampur', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4075, N'Peddapalle', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4076, N'Julapalle', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4077, N'Elgaid', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4078, N'Dharmaram', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4079, N'Gollapalle', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4080, N'Mallial', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4081, N'Jagtial', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4082, N'Medipalle', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4083, N'Koratla', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4084, N'Metpalle', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4085, N'Kathlapur', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4086, N'Chandurthi', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4087, N'Kodimial', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4088, N'Pegadapalle', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4089, N'Gangadhara', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4090, N'Ramadugu', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4091, N'Choppadandi', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4092, N'Sultanabad', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4093, N'Odela', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4094, N'Manakondur', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4095, N'Karimnagar', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4096, N'Boinpalle', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4097, N'Vemulawada', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4098, N'Konaraopeta', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4099, N'Yellareddipet', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4100, N'Gambhiraopet', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4101, N'Mustabad', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4102, N'Sircilla', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4103, N'Ellanthakunta', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4104, N'Bejjanki', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4105, N'Timmapur (LMD Colony)', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4106, N'Veenavanka', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4107, N'Jammikunta', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4108, N'Shankarapatnam', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4109, N'Chigurumamidi', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4110, N'Koheda', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4111, N'Husnabad', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4112, N'Saidapur', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4113, N'Huzurabad', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4114, N'Kamalapur', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4115, N'Bheemadevarpalle', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4116, N'Elkathurthi', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4117, N'Shivampet', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4118, N'Narsapur', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4119, N'Hathnoora', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4120, N'Sadasivpet', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4121, N'Kondapur', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4122, N'Sangareddy', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4123, N'Jinnaram', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4124, N'Patancheru', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4125, N'Ramachandrapuram', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4126, N'Kangti', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4127, N'Manoor', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4128, N'Narayankhed', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4129, N'Kalher', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4130, N'Shankarampet (A)', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4131, N'Papannapet', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4132, N'Medak', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4133, N'Ramayampet', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4134, N'Dubbak', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4135, N'Siddipet', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4136, N'Chinnakodur', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4137, N'Nangnoor', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4138, N'Kondapak', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4139, N'Thoguta', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4140, N'Mirdoddi', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4141, N'Doultabad', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4142, N'Chegunta', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4143, N'Shankarampet (R)', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4144, N'Kulcharam', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4145, N'Tekmal', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4146, N'Alladurg', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4147, N'Regode', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4148, N'Raikode', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4149, N'Nyalkal', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4150, N'Zahirabad', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4151, N'Kohir', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4152, N'Jharasangam', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4153, N'Munpalle', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4154, N'Pulkal', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4155, N'Andole', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4156, N'Kowdipalle', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4157, N'Yeldurthy', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4158, N'Tupran', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4159, N'Gajwel', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4160, N'Jagdevpur', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4161, N'Wargal', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4162, N'Mulug', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4163, N'Devgad', 611)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4164, N'Vaibhavvadi', 611)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4165, N'Kankavli', 611)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4166, N'Malwan', 611)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4167, N'Vengurla', 611)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4168, N'Kudal', 611)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4169, N'Sawantwadi', 611)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4170, N'Dodamarg', 611)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4171, N'Shaikpet', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4172, N'Ameerpet', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4173, N'Secunderabad', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4174, N'Tirumalagiri', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4175, N'Maredpalle', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4176, N'Musheerabad', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4177, N'Amberpet', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4178, N'Himayathnagar', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4179, N'Nampally', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4180, N'Khairatabad', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4181, N'Asifnagar', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4182, N'Golconda', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4183, N'Bahadurpura', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4184, N'Bandlaguda', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4185, N'Charminar', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4186, N'Saidabad', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4187, N'Wazeed', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4188, N'Venkatapuram', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4189, N'Pinapaka', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4190, N'Cherla', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4191, N'Manuguru', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4192, N'Aswapuram', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4193, N'Dummugudem', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4194, N'Bhadrachalam', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4195, N'Kunavaram', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4196, N'Chintur', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4197, N'Vararamachandrapuram', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4198, N'Velairpadu', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4199, N'Kukunoor', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4200, N'Burgampahad', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4201, N'Palwancha', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4202, N'Kothagudem', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4203, N'Tekulapalle', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4204, N'Yellandu', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4205, N'Gundala', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4206, N'Bayyaram', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4207, N'Garla', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4208, N'Singareni', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4209, N'Kamepalle', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4210, N'Julurpad', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4211, N'Chandrugonda', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4212, N'Mulkalapalle', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4213, N'Aswaraopeta', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4214, N'Dammapeta', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4215, N'Sathupalle', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4216, N'Penuballi', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4217, N'Enkuru', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4218, N'Thirumalayapalem', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4219, N'Kusumanchi', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4220, N'Khammam (Rural)', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4221, N'Khammam (Urban)', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4222, N'Mudigonda', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4223, N'Nelakondapalle', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4224, N'Chinthakani', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4225, N'Konijerla', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4226, N'Tallada', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4227, N'Kallur', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4228, N'Wyra', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4229, N'Bonakal', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4230, N'Madhira', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4231, N'Yerrupalem', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4232, N'Vemsoor', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4233, N'Komarada', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4234, N'Gummalakshmipuram', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4235, N'Kurupam', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4236, N'Jiyyammavalasa', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4237, N'Garugubilli', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4238, N'Parvathipuram', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4239, N'Makkuva', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4240, N'Seethanagaram', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4241, N'Balijipeta', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4242, N'Bobbili', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4243, N'Salur', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4244, N'Pachipenta', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4245, N'Ramabhadrapuram', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4246, N'Badangi', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4247, N'Therlam', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4248, N'Merakamudidam', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4249, N'Dattirajeru', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4250, N'Mentada', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4251, N'Gajapathinagaram', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4252, N'Garividi', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4253, N'Cheepurupalle', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4254, N'Gurla', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4255, N'Bondapalle', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4256, N'Gantyada', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4257, N'Srungavarapukota', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4258, N'Vepada', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4259, N'Lakkavarapukota', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4260, N'Kothavalasa', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4261, N'Jami', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4262, N'Vizianagaram', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4263, N'Nellimarla', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4264, N'Pusapatirega', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4265, N'Denkada', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4266, N'Bhogapuram', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4267, N'Marpalle', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4268, N'Mominpet', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4269, N'Nawabpet', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4270, N'Shankarpalle', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4271, N'Serilingampally', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4272, N'Balanagar', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4273, N'Qutubullapur', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4274, N'Medchal', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4275, N'Shamirpet', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4276, N'Malkajgiri', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4277, N'Keesara', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4278, N'Ghatkesar', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4279, N'Uppal', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4280, N'Hayathnagar', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4281, N'Saroornagar', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4282, N'Rajendranagar', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4283, N'Moinabad', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4284, N'Chevella', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4285, N'Vicarabad', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4286, N'Dharur', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4287, N'Bantwaram', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4288, N'Peddemul', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4289, N'Tandur', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4290, N'Basheerabad', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4291, N'Yelal', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4292, N'Doma', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4293, N'Gandeed', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4294, N'Kulkacharla', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4295, N'Pargi', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4296, N'Pudur', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4297, N'Shabad', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4298, N'Shamshabad', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4299, N'Maheswaram', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4300, N'Kandukur', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4301, N'Ibrahimpatnam', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4302, N'Manchal', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4303, N'Yacharam', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4304, N'Kodangal', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4305, N'Bomraspet', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4306, N'Kosgi', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4307, N'Doulathabad', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4308, N'Damaragidda', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4309, N'Maddur', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4310, N'Hanwada', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4311, N'Nawabpet', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4312, N'Balanagar', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4313, N'Kondurg', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4314, N'Farooqnagar', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4315, N'Kothur', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4316, N'Keshampet', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4317, N'Talakondapalle', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4318, N'Amangal', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4319, N'Madgul', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4320, N'Veldanda', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4321, N'Midjil', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4322, N'Jadcherla', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4323, N'Mahbubnagar', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4324, N'Koilkonda', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4325, N'Narayanpet', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4326, N'Utkoor', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4327, N'Dhanwada', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4328, N'Devarkadra', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4329, N'Bhoothpur', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4330, N'Thimmajipet', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4331, N'Kalwakurthy', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4332, N'Vangoor', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4333, N'Amrabad', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4334, N'Achampet', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4335, N'Uppununthala', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4336, N'Telkapalle', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4337, N'Tadoor', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4338, N'Nagarkurnool', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4339, N'Bijinapalle', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4340, N'Ghanpur', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4341, N'Addakal', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4342, N'Chinnachintakunta', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4343, N'Narva', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4344, N'Makthal', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4345, N'Maganoor', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4346, N'Dharur', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4347, N'Atmakur', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4348, N'Kothakota', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4349, N'Peddamandadi', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4350, N'Wanaparthy', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4351, N'Gopalpeta', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4352, N'Balmoor', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4353, N'Lingal', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4354, N'Peddakothapalle', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4355, N'Kodair', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4356, N'Pangal', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4357, N'Pebbair', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4358, N'Gadwal', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4359, N'Maldakal', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4360, N'Ghattu', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4361, N'Ieej', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4362, N'Itikyal', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4363, N'Veepangandla', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4364, N'Kollapur', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4365, N'Waddepalle', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4366, N'Manopad', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4367, N'Alampur', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4368, N'Bommalaramaram', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4369, N'M.Turkapalle', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4370, N'Rajapet', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4371, N'Yadagirigutta', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4372, N'Alair', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4373, N'Gundala', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4374, N'Thirumalgiri', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4375, N'Thungathurthi', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4376, N'Nuthankal', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4377, N'Atmakur (S)', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4378, N'Jaji Reddi Gudem', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4379, N'Sali Gouraram', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4380, N'Mothkur', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4381, N'Atmakur (M)', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4382, N'Valigonda', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4383, N'Bhongir', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4384, N'Bibinagar', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4385, N'Pochampalle', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4386, N'Choutuppal', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4387, N'Ramannapeta', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4388, N'Chityala', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4389, N'Narketpalle', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4390, N'Kattangoor', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4391, N'Nakrekal', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4392, N'Kethe Palle', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4393, N'Suryapet', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4394, N'Chivvemla', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4395, N'Mothey', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4396, N'Nadigudem', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4397, N'Munagala', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4398, N'Penpahad', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4399, N'Vemulapalle', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4400, N'Thipparthi', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4401, N'Nalgonda', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4402, N'Munugode', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4403, N'Narayanapur', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4404, N'Marriguda', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4405, N'Chintha Palle', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4406, N'Gundla Palle', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4407, N'Chandam Pet', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4408, N'Devarakonda', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4409, N'Nampalle', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4410, N'Chandur', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4411, N'Kangal', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4412, N'Gurrampode', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4413, N'Pedda Adiserla Palle', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4414, N'Peddavoora', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4415, N'Anumula', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4416, N'Nidamanur', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4417, N'Thripuraram', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4418, N'Dameracherla', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4419, N'Miryalaguda', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4420, N'Neredcherla', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4421, N'Garide Palle', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4422, N'Chilkur', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4423, N'Kodad', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4424, N'Huzurnagar', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4425, N'Mattam Palle', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4426, N'Mella Cheruvu', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4427, N'Cherial', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4428, N'Maddur', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4429, N'Bachannapet', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4430, N'Narmetta', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4431, N'Ghanpur (Station)', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4432, N'Dharmasagar', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4433, N'Hasanparthy', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4434, N'Parkal', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4435, N'Mogullapalle', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4436, N'Chityal', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4437, N'Bhupalpalle', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4438, N'Ghanpur (Mulug)', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4439, N'Venkatapur', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4440, N'Eturnagaram', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4441, N'Mangapet', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4442, N'Tadvai', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4443, N'Govindaraopet', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4444, N'Mulug', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4445, N'Regonda', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4446, N'Shayampet', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4447, N'Nallabelly', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4448, N'Duggondi', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4449, N'Atmakur', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4450, N'Hanamkonda', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4451, N'Zaffergadh', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4452, N'Palakurthi', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4453, N'Raghunathpalle', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4454, N'Jangaon', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4455, N'Lingalaghanpur', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4456, N'Devaruppula', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4457, N'Kodakandla', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4458, N'Raiparthy', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4459, N'Wardhannapet', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4460, N'Sangam', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4461, N'Warangal', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4462, N'Geesugonda', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4463, N'Narsampet', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4464, N'Khanapur', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4465, N'Kothagudem', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4466, N'Gudur', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4467, N'Chennaraopet', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4468, N'Nekkonda', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4469, N'Parvathagiri', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4470, N'Thorrur', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4471, N'Nellikudur', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4472, N'Kesamudram', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4473, N'Mahabubabad', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4474, N'Narsimhulapet', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4475, N'Maripeda', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4476, N'Kuravi', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4477, N'Dornakal', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4478, N'Veeraghattam', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4479, N'Seethampeta', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4480, N'Bhamini', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4481, N'Kothuru', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4482, N'Pathapatnam', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4483, N'Meliaputti', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4484, N'Palasa', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4485, N'Mandasa', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4486, N'Kanchili', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4487, N'Ichchapuram', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4488, N'Kaviti', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4489, N'Sompeta', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4490, N'Vajrapukothuru', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4491, N'Nandigam', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4492, N'Hiramandalam', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4493, N'Palakonda', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4494, N'Vangara', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4495, N'Regidi Amadalavalasa', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4496, N'Lakshminarsupeta', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4497, N'Saravakota', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4498, N'Tekkali', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4499, N'Santhabommali', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4500, N'Kotabommali', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4501, N'Jalumuru', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4502, N'Sarubujjili', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4503, N'Burja', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4504, N'Santhakaviti', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4505, N'Rajam', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4506, N'Ganguvarisigadam', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4507, N'Amadalavalasa', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4508, N'Narasannapeta', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4509, N'Polaki', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4510, N'Gara', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4511, N'Srikakulam', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4512, N'Ponduru', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4513, N'Laveru', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4514, N'Ranastalam', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4515, N'Etcherla', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4516, N'Munchingi Puttu', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4517, N'Peda Bayalu', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4518, N'Dumbriguda', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4519, N'Araku Valley', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4520, N'Ananthagiri', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4521, N'Hukumpeta', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4522, N'Paderu', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4523, N'G.Madugula', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4524, N'Chintapalle', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4525, N'Gudem Kotha Veedhi', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4526, N'Koyyuru', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4527, N'Nathavaram', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4528, N'Golugonda', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4529, N'Narsipatnam', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4530, N'Rolugunta', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4531, N'Ravikamatham', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4532, N'Madugula', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4533, N'Cheedikada', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4534, N'Devarapalle', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4535, N'K.Kotapadu', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4536, N'Sabbavaram', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4537, N'Pendurthi', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4538, N'Anandapuram', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4539, N'Padmanabham', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4540, N'Bheemunipatnam', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4541, N'Visakhapatnam (Rural)', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4542, N'Visakhapatnam (Urban)', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4543, N'Pedagantyada', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4544, N'Gajuwaka', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4545, N'Paravada', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4546, N'Anakapalle', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4547, N'Chodavaram', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4548, N'Butchayyapeta', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4549, N'Kotauratla', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4550, N'Makavarapalem', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4551, N'Kasimkota', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4552, N'Munagapaka', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4553, N'Atchutapuram', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4554, N'Yelamanchili', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4555, N'Nakkapalle', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4556, N'Payakaraopeta', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4557, N'S.Rayavaram', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4558, N'Rambilli', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4559, N'Maredumilli', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4560, N'Devipatnam', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4561, N'Y. Ramavaram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4562, N'Addateegala', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4563, N'Rajavommangi', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4564, N'Kotananduru', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4565, N'Tuni', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4566, N'Rowthulapudi', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4567, N'Sankhavaram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4568, N'Yeleswaram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4569, N'Gangavaram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4570, N'Rampachodavaram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4571, N'Seethanagaram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4572, N'Gokavaram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4573, N'Jaggampeta', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4574, N'Kirlampudi', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4575, N'Prathipadu', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4576, N'Thondangi', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4577, N'Gollaprolu', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4578, N'Peddapuram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4579, N'Gandepalle', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4580, N'Korukonda', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4581, N'Rajahmundry (Urban)', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4582, N'Rajahmundry Rural', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4583, N'Rajanagaram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4584, N'Rangampeta', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4585, N'Samalkota', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4586, N'Pithapuram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4587, N'Kothapalle', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4588, N'Kakinada (Rural)', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4589, N'Kakinada (Urban)', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4590, N'Pedapudi', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4591, N'Biccavolu', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4592, N'Anaparthy', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4593, N'Kadiam', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4594, N'Atreyapuram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4595, N'Mandapeta', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4596, N'Rayavaram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4597, N'Karapa', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4598, N'Kajuluru', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4599, N'Ramachandrapuram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4600, N'Alamuru', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4601, N'Ravulapalem', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4602, N'Kothapeta', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4603, N'Kapileswarapuram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4604, N'Pamarru', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4605, N'Thallarevu', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4606, N'I. Polavaram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4607, N'Mummidivaram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4608, N'Ainavilli', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4609, N'P.Gannavaram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4610, N'Ambajipeta', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4611, N'Mamidikuduru', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4612, N'Razole', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4613, N'Malikipuram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4614, N'Sakhinetipalle', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4615, N'Allavaram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4616, N'Amalapuram', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4617, N'Uppalaguptam', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4618, N'Katrenikona', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4619, N'Nidamarru', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4620, N'Pentapadu', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4621, N'Undrajavaram', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4622, N'Peravali', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4623, N'Tanuku', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4624, N'Attili', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4625, N'Ganapavaram', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4626, N'Akividu', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4627, N'Undi', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4628, N'Palacoderu', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4629, N'Penumantra', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4630, N'Iragavaram', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4631, N'Penugonda', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4632, N'Achanta', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4633, N'Poduru', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4634, N'Veeravasaram', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4635, N'Bhimavaram', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4636, N'Kalla', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4637, N'Mogalthur', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4638, N'Narasapuram', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4639, N'Palacole', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4640, N'Yelamanchili', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4641, N'Chintalapudi', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4642, N'Lingapalem', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4643, N'T.Narasapuram', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4644, N'Jeelugu Milli', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4645, N'Buttayagudem', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4646, N'Polavaram', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4647, N'Tallapudi', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4648, N'Gopalapuram', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4649, N'Koyyalagudem', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4650, N'Jangareddigudem', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4651, N'Kamavarapukota', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4652, N'Dwarakatirumala', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4653, N'Nallajerla', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4654, N'Devarapalle', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4655, N'Kovvur', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4656, N'Chagallu', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4657, N'Nidadavole', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4658, N'Tadepalligudem', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4659, N'Unguturu', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4660, N'Bhimadole', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4661, N'Pedavegi', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4662, N'Pedapadu', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4663, N'Eluru', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4664, N'Denduluru', 625)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4665, N'Salema', 557)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4666, N'Manu', 557)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4667, N'Ambassa', 557)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4668, N'Chhamanu', 557)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4669, N'Dumburnagar', 557)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4670, N'Gournagar', 560)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4671, N'Kadamtala', 560)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4672, N'Panisagar', 560)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4673, N'Damchhara', 560)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4674, N'Pencharthal', 560)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4675, N'Kumarghat', 560)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4676, N'Dasda', 560)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4677, N'Jampuii hills', 560)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4678, N'Killa', 562)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4679, N'Amarpur', 562)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4680, N'Ompi', 562)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4681, N'Matarbari', 562)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4682, N'Kakraban', 562)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4683, N'Rajnagar', 562)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4684, N'Hrishyamukh', 562)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4685, N'Bokafa', 562)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4686, N'Karbuk', 562)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4687, N'Rupaichhari', 562)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4688, N'Satchand', 562)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4689, N'Mohanpur', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4690, N'Hezamara', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4691, N'Padmabil', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4692, N'Khowai', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4693, N'Tulashikhar', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4694, N'Kalyanpur', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4695, N'Teliamura', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4696, N'Mungiakumi', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4697, N'Mandai', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4698, N'Jirania', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4699, N'Dukli', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4700, N'Jampuijala', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4701, N'Bishalgarh', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4702, N'Boxanagar', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4703, N'Melaghar', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4704, N'Kathalia', 564)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4705, N'Etmadpur', 565)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4706, N'Agra', 565)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4707, N'Kiraoli', 565)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4708, N'Kheragarh', 565)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4709, N'Fatehabad', 565)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4710, N'Bah', 565)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4711, N'Khair', 566)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4712, N'Gabhana', 566)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4713, N'Atrauli', 566)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4714, N'Koil', 566)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4715, N'Iglas', 566)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4716, N'Soraon', 567)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4717, N'Phulpur', 567)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4718, N'Allahabad', 567)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4719, N'Bara', 567)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4720, N'Karchhana', 567)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4721, N'Handia', 567)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4722, N'Meja', 567)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4723, N'Koraon', 567)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4724, N'Tanda', 568)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4725, N'Allapur', 568)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4726, N'Jalalpur', 568)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4727, N'Akbarpur', 568)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4728, N'Bhiti', 568)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4729, N'Bidhuna', 569)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4730, N'Auraiya', 569)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4731, N'Burhanpur', 570)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4732, N'Sagri', 570)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4733, N'Azamgarh', 570)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4734, N'Nizamabad', 570)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4735, N'Phulpur', 570)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4736, N'Lalganj', 570)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4737, N'Mehnagar', 570)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4738, N'Baraut', 571)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4739, N'Baghpat', 571)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4740, N'Khekada', 571)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4741, N'Nanpara', 572)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4742, N'Mahasi', 572)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4743, N'Bahraich', 572)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4744, N'Kaiserganj', 572)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4745, N'Belthara Road', 573)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4746, N'Sikanderpur', 573)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4747, N'Rasra', 573)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4748, N'Ballia', 573)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4749, N'Bansdih', 573)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4750, N'Bairia', 573)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4751, N'Balrampur', 574)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4752, N'Tulsipur', 574)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4753, N'Utraula', 574)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4754, N'Banda', 575)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4755, N'Baberu', 575)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4756, N'Atarra', 575)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4757, N'Naraini', 575)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4758, N'Fatehpur', 576)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4759, N'Ramnagar', 576)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4760, N'Nawabganj', 576)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4761, N'Sirauli Gauspur', 576)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4762, N'Ramsanehighat', 576)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4763, N'Haidergarh', 576)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4764, N'Baheri', 577)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4765, N'Meerganj', 577)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4766, N'Aonla', 577)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4767, N'Bareilly', 577)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4768, N'Nawabganj', 577)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4769, N'Faridpur', 577)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4770, N'Bhanpur', 578)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4771, N'Harraiya', 578)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4772, N'Basti', 578)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4773, N'Rudhauli', 578)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4774, N'Najibabad', 580)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4775, N'Bijnor', 580)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4776, N'Nagina', 580)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4777, N'Dhampur', 580)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4778, N'Chandpur', 580)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4779, N'Gunnaur', 581)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4780, N'Bisauli', 581)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4781, N'Bilsi', 581)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4782, N'Sahaswan', 581)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4783, N'Budaun', 581)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4784, N'Dataganj', 581)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4785, N'Sikandrabad', 582)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4786, N'Bulandshahr', 582)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4787, N'Siana', 582)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4788, N'Anupshahr', 582)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4789, N'Debai', 582)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4790, N'Shikarpur', 582)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4791, N'Khurja', 582)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4792, N'Sakaldiha', 583)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4793, N'Chandauli', 583)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4794, N'Chakia', 583)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4795, N'Karwi', 585)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4796, N'Mau', 585)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4797, N'Deoria', 586)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4798, N'Rudrapur', 586)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4799, N'Barhaj', 586)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4800, N'Salempur', 586)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4801, N'Bhatpar Rani', 586)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4802, N'Aliganj', 587)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4803, N'Etah', 587)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4804, N'Jalesar', 587)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4805, N'Jaswantnagar', 588)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4806, N'Saifai', 588)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4807, N'Etawah', 588)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4808, N'Bharthana', 588)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4809, N'Chakarnagar', 588)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4810, N'Rudauli', 589)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4811, N'Milkipur', 589)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4812, N'Sohawal', 589)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4813, N'Faizabad', 589)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4814, N'Bikapur', 589)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4815, N'Kaimganj', 590)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4816, N'Amritpur', 590)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4817, N'Farrukhabad', 590)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4818, N'Bindki', 591)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4819, N'Fatehpur', 591)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4820, N'Khaga', 591)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4821, N'Tundla', 592)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4822, N'Firozabad', 592)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4823, N'Jasrana', 592)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4824, N'Shikohabad', 592)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4825, N'Dadri', 593)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4826, N'Gautam Buddha Nagar', 593)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4827, N'Jewar', 593)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4828, N'Modinagar', 594)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4829, N'Ghaziabad', 594)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4830, N'Hapur', 594)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4831, N'Garhmukteshwar', 594)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4832, N'Jakhania', 595)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4833, N'Saidpur', 595)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4834, N'Ghazipur', 595)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4835, N'Mohammadabad', 595)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4836, N'Zamania', 595)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4837, N'Gonda', 596)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4838, N'Colonelganj', 596)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4839, N'Tarabganj', 596)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4840, N'Mankapur', 596)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4841, N'Campierganj', 597)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4842, N'Sahjanwa', 597)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4843, N'Gorakhpur', 597)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4844, N'Chauri Chaura', 597)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4845, N'Bansgaon', 597)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4846, N'Khajni', 597)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4847, N'Gola', 597)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4848, N'Hamirpur', 598)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4849, N'Rath', 598)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4850, N'Sarila', 598)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4851, N'Maudaha', 598)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4852, N'Shahabad', 599)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4853, N'Sawayajpur', 599)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4854, N'Hardoi', 599)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4855, N'Bilgram', 599)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4856, N'Sandila', 599)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4857, N'Madhogarh', 601)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4858, N'Jalaun', 601)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4859, N'Kalpi', 601)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4860, N'Orai', 601)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4861, N'Konch', 601)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4862, N'Shahganj', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4863, N'Badlapur', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4864, N'Machhlishahr', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4865, N'Jaunpur', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4866, N'Mariahu', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4867, N'Kerakat', 602)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4868, N'Moth', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4869, N'Garautha', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4870, N'Tahrauli', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4871, N'Mauranipur', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4872, N'Jhansi', 603)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4873, N'Dhanaura', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4874, N'Amroha', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4875, N'Hasanpur', 604)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4876, N'Chhibramau', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4877, N'Kannauj', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4878, N'Tirwa', 605)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4879, N'Rasulabad', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4880, N'Derapur', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4881, N'Akbarpur', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4882, N'Bhognipur', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4883, N'Sikandra', 606)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4884, N'Bilhaur', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4885, N'Kanpur', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4886, N'Ghatampur', 607)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4887, N'Kasganj', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4888, N'Sahawar', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4889, N'Patiyali', 608)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4890, N'Sirathu', 609)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4891, N'Manjhanpur', 609)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4892, N'Chail', 609)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4893, N'Padrauna', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4894, N'Hata', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4895, N'Kasya', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4896, N'Tamkuhi Raj', 610)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4897, N'Nighasan', 611)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4898, N'Palia', 611)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4899, N'Gola Gokaran Nath', 611)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4900, N'Mohammdi', 611)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4901, N'Lakhimpur', 611)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4902, N'Dhaurahara', 611)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4903, N'Talbehat', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4904, N'Lalitpur', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4905, N'Mahroni', 612)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4906, N'Malihabad', 613)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4907, N'Bakshi Ka Talab', 613)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4908, N'Lucknow', 613)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4909, N'Mohanlalganj', 613)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4910, N'Nautanwa', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4911, N'Nichlaul', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4912, N'Pharenda', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4913, N'Maharajganj', 614)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4914, N'Kulpahar', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4915, N'Charkhari', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4916, N'Mahoba', 615)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4917, N'Mainpuri', 616)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4918, N'Karhal', 616)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4919, N'Bhogaon', 616)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4920, N'Chhata', 617)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4921, N'Mat', 617)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4922, N'Mahavan', 617)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4923, N'Mathura', 617)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4924, N'Ghosi', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4925, N'Madhuban', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4926, N'Maunath Bhanjan', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4927, N'Muhammadabad Gohna', 618)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4928, N'Sardhana', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4929, N'Mawana', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4930, N'Meerut', 619)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4931, N'Mirzapur', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4932, N'Lalganj', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4933, N'Marihan', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4934, N'Chunar', 620)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4935, N'Thakurdwara', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4936, N'Kanth', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4937, N'Moradabad', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4938, N'Bilari', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4939, N'Sambhal', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4940, N'Chandausi', 621)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4941, N'Kairana', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4942, N'Shamli', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4943, N'Muzaffarnagar', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4944, N'Budhana', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4945, N'Khatauli', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4946, N'Jansath', 622)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4947, N'Pilibhit', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4948, N'Bisalpur', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4949, N'Puranpur', 624)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4950, N'Lalganj', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4951, N'Kunda', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4952, N'Pratapgarh', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4953, N'Patti', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4954, N'Raniganj', 626)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4955, N'Maharajganj', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4956, N'Tiloi', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4957, N'Rae Bareli', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4958, N'Lalganj', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4959, N'Dalmau', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4960, N'Unchahar', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4961, N'Salon', 627)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4962, N'Suar', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4963, N'Tanda', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4964, N'Bilaspur', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4965, N'Rampur', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4966, N'Shahabad', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4967, N'Milak', 628)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4968, N'Behat', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4969, N'Saharanpur', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4970, N'Nakur', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4971, N'Deoband', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4972, N'Rampur Maniharan', 629)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4973, N'Mehdawal', 630)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4974, N'Khalilabad', 630)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4975, N'Ghanghata', 630)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4976, N'Bhadohi', 631)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4977, N'Gyanpur', 631)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4978, N'Aurai', 631)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4979, N'Powayan', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4980, N'Tilhar', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4981, N'Shahjahanpur', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4982, N'Jalalabad', 632)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4983, N'Bhinga', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4984, N'Ikauna', 633)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4985, N'Shohratgarh', 634)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4986, N'Naugarh', 634)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4987, N'Bansi', 634)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4988, N'Itwa', 634)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4989, N'Domariyaganj', 634)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4990, N'Misrikh', 635)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4991, N'Sitapur', 635)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4992, N'Laharpur', 635)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4993, N'Biswan', 635)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4994, N'Mahmudabad', 635)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4995, N'Sidhauli', 635)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4996, N'Ghorawal', 636)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4997, N'Robertsganj', 636)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4998, N'Dudhi', 636)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (4999, N'Musafirkhana', 637)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5000, N'Gauriganj', 637)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5001, N'Amethi', 637)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5002, N'Sultanpur', 637)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5003, N'Jaisinghpur', 637)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5004, N'Lambhua', 637)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5005, N'Kadipur', 637)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5006, N'Safipur', 638)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5007, N'Hasanganj', 638)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5008, N'Unnao', 638)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5009, N'Purwa', 638)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5010, N'Bighapur', 638)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5011, N'Pindra', 639)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5012, N'Varanasi', 639)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5013, N'Bhikiasain', 640)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5014, N'Chaukhutiya', 640)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5015, N'Sult', 640)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5016, N'Ranikhet', 640)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5017, N'Dwarahat', 640)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5018, N'Almora', 640)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5019, N'Someshwar', 640)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5020, N'Jainti', 640)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5021, N'Bhanoli', 640)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5022, N'Kapkot', 641)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5023, N'Kanda', 641)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5024, N'Bageshwar', 641)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5025, N'Garud', 641)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5026, N'Joshimath', 642)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5027, N'Chamoli', 642)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5028, N'Pokhari', 642)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5029, N'Karnaprayag', 642)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5030, N'Tharali', 642)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5031, N'Gairsain', 642)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5032, N'Champawat', 643)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5033, N'Pati', 643)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5034, N'Lohaghat', 643)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5035, N'Poornagiri', 643)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5036, N'Chakrata', 644)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5037, N'Tyuni', 644)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5038, N'Kalsi', 644)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5039, N'Vikas Nagar', 644)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5040, N'Dehradun ', 644)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5041, N'Rishikesh', 644)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5042, N'Srinagar', 645)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5043, N'Pauri', 645)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5044, N'Thailisain', 645)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5045, N'Dhoomakot', 645)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5046, N'Lansdowne', 645)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5047, N'Satpuli', 645)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5048, N'Chaubatta Khal', 645)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5049, N'Kotdwara', 645)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5050, N'Yamkeshwar', 645)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5051, N'Roorkee', 646)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5052, N'Hardwar', 646)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5053, N'Laksar', 646)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5054, N'Kosya Kutauli', 647)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5055, N'Betalghat', 647)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5056, N'Nainital', 647)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5057, N'Dhari', 647)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5058, N'Haldwani', 647)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5059, N'Ramnagar', 647)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5060, N'Kaladhungi', 647)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5061, N'Lalkuan', 647)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5062, N'Munsiari', 648)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5063, N'Dharchula', 648)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5064, N'Didihat', 648)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5065, N'Berinag', 648)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5066, N'Gangolihat', 648)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5067, N'Pithoragarh', 648)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5068, N'Ukhimath', 649)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5069, N'Rudraprayag', 649)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5070, N'Jakholi', 649)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5071, N'Ghansali', 650)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5072, N'Devprayag', 650)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5073, N'Pratapnagar', 650)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5074, N'Jakhani Dhar', 650)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5075, N'Tehri', 650)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5076, N'Dhanaulti', 650)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5077, N'Narendra Nagar', 650)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5078, N'Kashipur', 651)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5079, N'Jaspur', 651)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5080, N'Bajpur', 651)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5081, N'Kichha', 651)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5082, N'Gadarpur', 651)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5083, N'Sitarganj', 651)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5084, N'Khatima
', 651)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5085, N'Puraula', 652)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5086, N'Mori', 652)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5087, N'Rajgarhi', 652)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5088, N'Dunda', 652)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5089, N'Chinyali Saur', 652)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5090, N'Bhatwari', 652)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5091, N'Saltora', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5092, N'Mejhia', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5093, N'Gangajalghati', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5094, N'Chhatna', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5095, N'Indpur', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5096, N'Bankura - I', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5097, N'Bankura - II', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5098, N'Barjora', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5099, N'Sonamukhi', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5100, N'Patrasayer', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5101, N'Indus', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5102, N'Kotulpur', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5103, N'Jaypur', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5104, N'Vishnupur', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5105, N'Onda', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5106, N'Taldangra', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5107, N'Simlapal', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5108, N'Khatra', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5109, N'Hirbandh', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5110, N'Ranibundh', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5111, N'Raipur', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5112, N'Sarenga', 653)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5113, N'Salanpur', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5114, N'Barabani', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5115, N'Jamuria', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5116, N'Raniganj', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5117, N'Ondal', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5118, N'Pandabeswar', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5119, N'Faridpur Durgapur', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5120, N'Kanksa', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5121, N'Ausgram - II', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5122, N'Ausgram - I', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5123, N'Mangolkote', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5124, N'Ketugram - I', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5125, N'Ketugram - II', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5126, N'Katwa - I', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5127, N'Katwa - II', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5128, N'Purbasthali - I', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5129, N'Purbasthali - II', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5130, N'Manteswar', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5131, N'Bhatar', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5132, N'Galsi - I', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5133, N'Galsi - II', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5134, N'Burdwan - I', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5135, N'Burdwan - II', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5136, N'Memari - I', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5137, N'Memari - II', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5138, N'Kalna - I', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5139, N'Kalna - II', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5140, N'Jamalpur', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5141, N'Raina - I', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5142, N'Khandaghosh', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5143, N'Raina - II', 654)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5144, N'Murarai - I', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5145, N'Murarai - II', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5146, N'Nalhati - I', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5147, N'Nalhati - II', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5148, N'Rampurhat - I', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5149, N'Rampurhat - II', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5150, N'Mayureswar - I', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5151, N'Mayureswar - II', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5152, N'Mohammad Bazar', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5153, N'Rajnagar', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5154, N'Suri - I', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5155, N'Suri - II', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5156, N'Sainthia', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5157, N'Labpur', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5158, N'Nanoor', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5159, N'Bolpur Sriniketan', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5160, N'Illambazar', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5161, N'Dubrajpur', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5162, N'Khoyrasol', 655)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5163, N'Kushmundi', 656)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5164, N'Gangarampur', 656)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5165, N'Kumarganj', 656)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5166, N'Hilli', 656)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5167, N'Balurghat', 656)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5168, N'Tapan', 656)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5169, N'Bansihari', 656)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5170, N'Harirampur', 656)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5171, N'Darjeeling Pulbazar', 657)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5172, N'Rangli Rangliot', 657)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5173, N'Kalimpong -I', 657)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5174, N'Kalimpong - II', 657)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5175, N'Gorubathan', 657)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5176, N'Jorebunglow Sukiapokhri', 657)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5177, N'Mirik', 657)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5178, N'Kurseong', 657)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5179, N'Matigara', 657)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5180, N'Naxalbari', 657)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5181, N'Phansidewa', 657)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5182, N'Kharibari', 657)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5183, N'Udaynarayanpur', 658)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5184, N'Amta - II', 658)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5185, N'Amta - I', 658)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5186, N'Jagatballavpur', 658)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5187, N'Domjur', 658)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5188, N'Bally Jagachha', 658)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5189, N'Sankrail', 658)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5190, N'Panchla', 658)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5191, N'Uluberia - II', 658)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5192, N'Uluberia - I', 658)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5193, N'Bagnan - I', 658)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5194, N'Bagnan - II', 658)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5195, N'Shyampur - I', 658)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5196, N'Shyampur - II', 658)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5197, N'Goghat - I', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5198, N'Goghat - II', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5199, N'Arambag', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5200, N'Pursura', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5201, N'Tarakeswar', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5202, N'Dhaniakhali', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5203, N'Pandua', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5204, N'Balagarh', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5205, N'Chinsurah - Magra', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5206, N'Polba - Dadpur', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5207, N'Haripal', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5208, N'Singur', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5209, N'Serampur Uttarpara', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5210, N'Chanditala - I', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5211, N'Chanditala - II', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5212, N'Jangipara', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5213, N'Khanakul - I', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5214, N'Khanakul - II', 659)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5215, N'Rajganj', 660)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5216, N'Mal', 660)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5217, N'Matiali', 660)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5218, N'Nagrakata', 660)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5219, N'Madarihat', 660)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5220, N'Kalchini', 660)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5221, N'Kumargram', 660)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5222, N'Alipurduar - I', 660)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5223, N'Alipurduar - II', 660)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5224, N'Falakata', 660)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5225, N'Dhupguri', 660)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5226, N'Maynaguri', 660)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5227, N'Jalpaiguri', 660)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5228, N'Haldibari', 661)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5229, N'Mekliganj', 661)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5230, N'Mathabhanga - I', 661)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5231, N'Mathabhanga - II', 661)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5232, N'Cooch Behar - I', 661)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5233, N'Cooch Behar - II', 661)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5234, N'Tufanganj - I', 661)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5235, N'Tufanganj - II', 661)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5236, N'Dinhata - I', 661)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5237, N'Dinhata - II', 661)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5238, N'Sitai', 661)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5239, N'Sitalkuchi', 661)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5240, N'Harischandrapur - I', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5241, N'Harischandrapur - II', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5242, N'Chanchal - I', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5243, N'Chanchal - II', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5244, N'Ratua - I', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5245, N'Ratua - II', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5246, N'Gazole', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5247, N'Bamangola', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5248, N'Habibpur', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5249, N'Maldah (Old)', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5250, N'English Bazar', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5251, N'Manikchak', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5252, N'Kaliachak - I', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5253, N'Kaliachak - II', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5254, N'Kaliachak - III', 663)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5255, N'Farakka', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5256, N'Samserganj', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5257, N'Suti - I', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5258, N'Suti - II', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5259, N'Raghunathganj - I', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5260, N'Raghunathganj - II', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5261, N'Lalgola', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5262, N'Sagardighi', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5263, N'Bhagawangola - I', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5264, N'Bhagawangola - II', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5265, N'Raninagar - II', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5266, N'Jalangi', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5267, N'Domkal', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5268, N'Raninagar - I', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5269, N'Murshidabad Jiaganj', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5270, N'Nabagram', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5271, N'Khargram', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5272, N'Kandi', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5273, N'Berhampore', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5274, N'Hariharpara', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5275, N'Nawda', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5276, N'Beldanga - I', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5277, N'Beldanga - II', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5278, N'Bharatpur - II', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5279, N'Bharatpur - I', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5280, N'Burwan', 664)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5281, N'Karimpur - I', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5282, N'Karimpur - II', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5283, N'Tehatta - I', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5284, N'Tehatta - II', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5285, N'Kaliganj', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5286, N'Nakashipara', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5287, N'Chapra', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5288, N'Krishnagar - II', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5289, N'Nabadwip', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5290, N'Krishnagar - I', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5291, N'Krishnaganj', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5292, N'Hanskhali', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5293, N'Santipur', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5294, N'Ranaghat - I', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5295, N'Ranaghat - II', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5296, N'Chakdah', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5297, N'Haringhata', 665)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5298, N'Bagda', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5299, N'Bongaon', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5300, N'Gaighata', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5301, N'Swarupnagar', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5302, N'Habra - I', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5303, N'Habra - II', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5304, N'Amdanga', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5305, N'Barrackpur - I', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5306, N'Barrackpur - II', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5307, N'Barasat - I', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5308, N'Barasat - II', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5309, N'Deganga', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5310, N'Baduria', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5311, N'Basirhat - I', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5312, N'Basirhat - II', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5313, N'Haroa', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5314, N'Rajarhat', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5315, N'Minakhan', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5316, N'Sandeshkhali - I', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5317, N'Sandeshkhali - II', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5318, N'Hasnabad', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5319, N'Hingalganj', 666)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5320, N'Binpur - II', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5321, N'Binpur - I', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5322, N'Garbeta - II', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5323, N'Garbeta - I', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5324, N'Garbeta - III', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5325, N'Chandrakona - I', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5326, N'Chandrakona - II', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5327, N'Ghatal', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5328, N'Daspur - I', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5329, N'Daspur - II', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5330, N'Keshpur', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5331, N'Salbani', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5332, N'Midnapore', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5333, N'Jhargram', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5334, N'Jamboni', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5335, N'Gopiballavpur - II', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5336, N'Gopiballavpur - I', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5337, N'Nayagram', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5338, N'Sankrail', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5339, N'Kharagpur - I', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5340, N'Kharagpur - II', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5341, N'Debra', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5342, N'Pingla', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5343, N'Sabang', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5344, N'Narayangarh', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5345, N'Keshiary', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5346, N'Dantan - I', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5347, N'Dantan - II', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5348, N'Mohanpur', 667)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5349, N'Panskura', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5350, N'Kolaghat', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5351, N'Tamluk', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5352, N'Sahid Matangini', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5353, N'Nanda Kumar', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5354, N'Mahisadal', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5355, N'Moyna', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5356, N'Potashpur - I', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5357, N'Potashpur - II', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5358, N'Bhagawanpur - II', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5359, N'Bhagawanpur - I', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5360, N'Chandipur', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5361, N'Sutahata', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5362, N'Haldia', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5363, N'Nandigram - I', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5364, N'Nandigram - II', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5365, N'Khejuri - I', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5366, N'Khejuri - II', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5367, N'Contai - I', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5368, N'Deshopran', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5369, N'Contai - III', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5370, N'Egra - I', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5371, N'Egra - II', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5372, N'Ramnagar - I', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5373, N'Ramnagar - II', 668)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5374, N'Jaipur', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5375, N'Purulia - II', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5376, N'Para', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5377, N'Raghunathpur - II', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5378, N'Raghunathpur - I', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5379, N'Neturia', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5380, N'Santuri', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5381, N'Kashipur', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5382, N'Hura', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5383, N'Purulia - I', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5384, N'Puncha', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5385, N'Arsha', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5386, N'Jhalda - I', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5387, N'Jhalda - II', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5388, N'Bagmundi', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5389, N'Balarampur', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5390, N'Barabazar', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5391, N'Manbazar - I', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5392, N'Manbazar - II', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5393, N'Bundwan', 669)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5394, N'Thakurpukur Mahestola', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5395, N'Budge Budge - I', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5396, N'Budge Budge - II', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5397, N'Bishnupur - I', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5398, N'Bishnupur - II', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5399, N'Sonarpur', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5400, N'Bhangar - I', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5401, N'Bhangar - II', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5402, N'Canning - I', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5403, N'Canning - II', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5404, N'Baruipur', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5405, N'Magrahat - II', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5406, N'Magrahat - I', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5407, N'Falta', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5408, N'Diamond Harbour - I', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5409, N'Diamond Harbour - II', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5410, N'Kulpi', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5411, N'Mandirbazar', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5412, N'Mathurapur - I', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5413, N'Jaynagar - I', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5414, N'Jaynagar - II', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5415, N'Kultali', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5416, N'Basanti', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5417, N'Gosaba', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5418, N'Mathurapur - II', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5419, N'Kakdwip', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5420, N'Sagar', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5421, N'Namkhana', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5422, N'Patharpratima', 670)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5423, N'Chopra', 671)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5424, N'Islampur', 671)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5425, N'Goalpokhar - I', 671)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5426, N'Goalpokhar - II', 671)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5427, N'Karandighi', 671)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5428, N'Raiganj', 671)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5429, N'Hemtabad', 671)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5430, N'Kaliaganj', 671)
GO
INSERT [dbo].[SubRegions] ([SubRegionId], [SubRegionName], [DistrictId]) VALUES (5431, N'Itahar', 671)
GO
SET IDENTITY_INSERT [dbo].[SubRegions] OFF
GO

Alter table DoctorAppointmentSchedule add SlotFromDateTime dateTime

Alter table DoctorAppointmentSchedule add SlotToDateTime dateTime
Alter table DoctorAppointmentSchedule add AppointmentSlots dateTime

Alter table DoctorAppointmentSchedule add AppointmentSlots dateTime