/*Terraforming mars board hexagon script
Creating hexagon tiles for terraforming
mars board */

//To do list:
//Add hinges to some for storage
//Finetune size of tileholder
//*Add text to bottom of tiles large size* (*If possible)

use <TOUL.scad>;


side_list = [1,1,1,1,1,1]; //Sides to add connectors
text_cont = "Phobos space haven"; //For special and named areas
font1 = "monospace"; //Font used in text (Ideal: monospace for easy measurements)
top = false; //Top of player board
img = true; //Add city tile image

clearance = 0.1; //Should be as low as possible

module add_text(text_cont_var, font2, img_bol) {
    /*Module for adding text to the tile_holder,
    first part checks whether to add a city tile
    image to the tileholder, the last part disregards
    the image*/
    
    if(img_bol) {
        for(i=[0:len(split(text_cont_var))]) {
            translate([0, -3-3*i, 1.5]) {
                linear_extrude(height=1) {
                    text(split(text_cont_var, " ")[i], font=font2, size=2.4, halign="center");
                }
            }
        }
            translate([-8.7,0,1.5]) linear_extrude(height = 1) {
             scale(0.06)
             import("/home/mogens/3d/Projects/boardgame/img/city.svg");
             }
    }
     else {
         for(i=[0:len(split(text_cont_var))]) {
            translate([0, 1-4.5*i, 1.5]) {
                linear_extrude(height=1) {
                    text(split(text_cont_var, " ")[i], font=font2, size=4, halign="center");
                }
            }
        }
    }
}


module create_hex(side, top_bol, clear) {
difference() {
        cylinder($fn=6, h=6, r2=23+((4*sin(4))/sin(86)), r1 = 23);
        translate([0,0,3]) cylinder($fn=6, h=5, r=20);
        translate([0,0,2]) cylinder(h=5, r=12);

            
        for(deg1 = [120, 360, 600]) {
            if (side[deg1 / 120] == 1 ) {
                translate([sin(deg1-27)*24 ,cos(deg1-27)*24 , 2.25]) rotate([4,0,deg1/2+60]) cube([25.5,1,1.5+clear]);
            } else {
                echo("skipped ", deg1);
            }
        }
}
        if(top_bol == true) translate([-4,-4,-7.8]) cube(8);     
        for(deg2 = [0, 240, 480]) {
            if (side[deg2 / 120] == 1 ) {
            translate([sin(deg2-26.6)*22,cos(deg2-27)*22.3, 2.4]) rotate([-4,0,deg2/2]) cube([20,1.1,1.5-clear]);
                } else {
                echo("skipped ", deg2);
            }
        }


}

create_hex(side_list, top, clearance);
add_text(text_cont, font1, img);

