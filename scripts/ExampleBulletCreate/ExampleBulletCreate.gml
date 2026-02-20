function ExampleBulletCreate(_x,_y,addspeed){
    var inst = instance_create_depth(_x,_y,DEPTH.BULLET,obj_example_bullet);
    inst.addspeed = addspeed;
    return inst;
}