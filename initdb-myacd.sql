begin;


create schema if not exists acd;


drop type if exists state_t cascade;
create type state_t as enum(
	'Perlis',
        'Kedah',
        'Pulau Pinang',
        'Perak',
        'Selangor',
        'Kuala Lumpur',
        'Negeri Sembilan',
        'Melaka',
        'Johor',
        'Kelantan',
        'Terengganu',
        'Pahang',
        'Sabah',
        'Sarawak',
        'Pulau Labuan');
        
        
drop type if exists role_t cascade;
create type role_t as enum('doctor', 'recruiter', 'provider', 'receiver');        

  
drop table if exists acd.acddistrict cascade;
create table acd.acddistrict 
  (
    state state_t,
    district text, 
    
    unique(state, district) 
  );   
  
  
drop table if exists acd.acdlocality cascade;
create table acd.acdlocality 
  (
    state state_t,
    district text, 
    locality text,    
    
    unique(state, district, locality) 
  ); 


drop table if exists acd.people cascade;
create table acd.people
  (    
    ident text not null,
    name text not null,    
    dob date,
    tel text,
    address text,    
    comorbid text,                      

    unique(ident)
  );
  
  
drop table if exists acd.profile cascade;
create table acd.profile
  (
    name text not null,
    locality text,
    district text,
    state state_t,        
    
    unique(name)    
  );  
  
  
drop table if exists acd.house cascade;
create table acd.house
  (
    acd text references acd.profile(name),
    tarikhacd date,
    bilrumahk integer default 0,
    bilrumahp integer default 0,    
    
    unique(acd, tarikhacd)  
  );
  
  
drop table if exists acd.activity cascade;
create table acd.activity
  (
    acd text references acd.profile(name),
    peopleident text references acd.people(ident),   
    tarikhacd date,  
    kategorikes text,
    gejala text,
    
    unique(acd, peopleident, tarikhacd)            
  );
  
drop table if exists acd.hso cascade;
create table acd.hso
  (
    acd text references acd.profile(name),
    peopleident text references acd.people(ident),    
    gelanghso boolean default false,
    annex14 boolean default false,    
    pelepasan boolean default false, 
  
    unique(acd, peopleident)
  );
  
  
drop table if exists acd.sampel cascade;
create table acd.sampel
  (
    id serial primary key,
    acd text references acd.profile(name),
    peopleident text references acd.people(ident),
    jenissampel text,    
    sampeltca timestamp,
    bildipanggil integer default 0,
    sampeldiambil boolean default false,    
    sampelres text,
    
    unique(acd, peopleident)        
  );
  

commit;
