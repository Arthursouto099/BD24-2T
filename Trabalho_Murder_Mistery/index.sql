----  ​murder​ that occurred sometime on ​Jan.15, 2018​ and that it took place in ​SQL City​. 
-- 20180115, murder, SQL City

--codigo 1 
select * from crime_scene_report where date = 20180115 and type = 'murder'
--resposta
--Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

--codigo 2

select id, name, address_number from person where address_street_name = 'Northwestern Dr'order by address_number DESC

-- return id: 14887 name: Morty Schapiro


select id, name, address_number, address_street_name  from person where address_street_name = 'Franklin Ave' 

-- return id: 16371 name: Annabel Miller



--Intrevist --- Morty Schapiro 

select name, transcript from interview join person on interview.person_id = person.id where person_id = 14887


--I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".


-- important information

--Number bag starter "48Z"

-- just gold members have those bags.

-- plate car: H42W


--Intrevist --- Annabel Miller

select name, transcript from interview join person on interview.person_id = person.id where person_id = 16371

-- I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

-- a vitima reconheceu o assasino de sua academia

--- 9 de janeiro

-- important information



-- descobrir quais pessoas na academia tem a bolsa que comçam com 48Z


select id, person_id, name, membership_status from get_fit_now_member where membership_status = 'gold' and id like '48Z%'

-- return

--id: 48Z7A	person_id: 28819 name: Joe Germuska  membership_status:	gold
--id: 48Z55	person_id: 67318 name:  Jeremy Bowers  membership_status: gold


-- license_id:  Jeremy Bowers
select license_id from person where id = 67318
--return 423327

select id, plate_number from drivers_license where id = 423327
--return id: 423327 plate_number: 0H42W2


-- Murder = Jeremy Bowers = Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer.


--Intrevist: transcript
--I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.


-- Verdadeiro Vilão

select name, license_id as ld, car_model, event_name, date from drivers_license join person on drivers_license.id = person.license_id join facebook_event_checkin on person.id = facebook_event_checkin.person_idwhere car_model = 'Model S' andhair_color = 'red' and height > 64 and  height < 68
               

--return  
--name	ld	car_model	event_name	date
--Miranda Priestly	202298	Model S	SQL Symphony Concert	20171206
--Miranda Priestly	202298	Model S	SQL Symphony Concert	20171212
--Miranda Priestly	202298	Model S	SQL Symphony Concert	20171229

-- result = Congrats, you found the brains behind the murder! Everyone in SQL City hails you as the greatest SQL detective of all time. Time to break out the champagne!
              
	
