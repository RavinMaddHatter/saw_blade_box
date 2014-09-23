single_wall=2;
magnet_d=20.5;
box_i_l=110;
box_i_w=60;
magnet_t=3;
box_t=15;
gap=.1;
bottom_t=magnet_t+single_wall;
words="Saw Blades";
text_height=10;

//box();
lid();
module lid(){
	difference(){
		union(){
			cube([4*single_wall+box_i_l,4*single_wall+box_i_w,single_wall],center=true);
			translate([0,0,single_wall])cube([box_i_l-gap*2,box_i_w-gap*2,3*single_wall],center=true);
		}
		translate([0,0,single_wall])rotate([0,180,0])linear_extrude(single_wall*2)text(words,halign ="center",valign ="center",size=text_height,font="Stencil:style=Regular");
	}
}
module box(){
	union(){
		difference(){
			cube([4*single_wall+box_i_l,4*single_wall+box_i_w,bottom_t+box_t],center=true);
			translate([0,0,bottom_t])cube([box_i_l,box_i_w,bottom_t+box_t],center=true);
			translate([box_i_l/2-magnet_d/2,0,magnet_t-(bottom_t+box_t)/2])cylinder(r=magnet_d/2,h=magnet_t*2);
			translate([box_i_l/2-magnet_d/2,-box_i_w/2+magnet_d/2,magnet_t-(bottom_t+box_t)/2])cylinder(r=magnet_d/2,h=magnet_t*2);
			translate([box_i_l/2-magnet_d/2,box_i_w/2-magnet_d/2,magnet_t-(bottom_t+box_t)/2])cylinder(r=magnet_d/2,h=magnet_t*2);
			
			translate([-box_i_l/2+magnet_d/2,0,magnet_t-(bottom_t+box_t)/2])cylinder(r=magnet_d/2,h=magnet_t*2);
			translate([-box_i_l/2+magnet_d/2,-box_i_w/2+magnet_d/2,magnet_t-(bottom_t+box_t)/2])cylinder(r=magnet_d/2,h=magnet_t*2);
			translate([-box_i_l/2+magnet_d/2,box_i_w/2-magnet_d/2,magnet_t-(bottom_t+box_t)/2])cylinder(r=magnet_d/2,h=magnet_t*2);
		}
	}
}