SELECT g.name, g.phone_number,r.room_number 
from current_guest_room cgr inner join guest g on cgr.guest_id = g.id inner join room r on cgr.room_id = r.id ;

SELECT r.room_number , g.name,g.phone_number, hgr.check_out_date  
from historical_guest_room hgr inner join guest g on hgr.guest_id = g.id inner join room r on hgr.room_id = r.id where hgr.check_out_date < '2022-01-01' ; 

SELECT r.id, r.room_number 
from room r inner join current_guest_room cgr on cgr.room_id = r.id;