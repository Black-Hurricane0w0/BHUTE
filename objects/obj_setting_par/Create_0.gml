part_system = part_system_create_layer("Instances_1",false);
part_type = part_type_create();
time = 0;

part_type_shape(part_type,pt_shape_star);
part_type_size(part_type,0.3,0.3,0,0);
part_type_color1(part_type,c_white);
part_type_alpha1(part_type,1);
part_type_speed(part_type,0,0,0,0);
part_type_direction(part_type,45,135,0,0)
part_type_blend(part_type,false);
part_type_life(part_type,900,1200);
part_type_gravity(part_type,0.01,90);
