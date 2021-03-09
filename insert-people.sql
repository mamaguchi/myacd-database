begin;  
          
          
insert into acd.people(ident, name, dob, tel, address, locality, district, 
		state, comorbid)
  values  ('880601105150', 'Person A', '1988-06-01', '0163184120', 
           'Jengka 17, Maran, Pahang', 'Jengka 17', 'Maran', 'Pahang', 
           'DM'),
          ('880601105151', 'Person B', '1988-06-01', '0163184120', 
           'Jengka 11, Maran, Pahang', 'Jengka 11', 'Maran','Pahang',
           'HPT'),
          ('880601105152', 'Person C', '1988-06-01', '0163184120', 
           'Jengka 11, Maran, Pahang', 'Jengka 11', 'Maran','Pahang',
           'CVD');                   
         

commit;






























