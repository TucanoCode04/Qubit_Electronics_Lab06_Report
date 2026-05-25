// -----------------------------------------------------------------------------
//
//  Gmsh geometry of DQD structure SiGe/Si/SiGe with reservoirs
//
//
// -----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
//	GMSH options
//
//-----------------------------------------------------------------------------

	Geometry.OldNewReg=0; // to get a "natural" ordering of volumes and surfaces created with translations, duplications, and so on



//-----------------------------------------------------------------------------
//
//	Heterostructure geometry primary parameters:
//
//-----------------------------------------------------------------------------
	extension 						= 7;// nm
	bulk_x 							= 339 + 2*extension; //nm
	bulk_y 							= 273; //nm
	
	
	bulk_strained_z 				= 0; //nm height of the strained Si(1-x)Ge(x) layer, with x = 0, 0.3
	bulk_bottom_z 					= 35; //nm height of the bottom Si(0.7)Ge(0.3) layer
	bulk_top_z 						= 5; //nm height of the layer among quantum and cap
	pre_quantum_z 					= 5; //nm height of the pre-quantum region
	post_quantum_z 					= 5; //nm height of the post-quantum region
			
	quantum_layer_z 				= 10; //nm
			
	cap_layer_z 					= 0;//2; //nm
			
	oxide_bottom_layer_z			= 7; //nm height of the oxide layer between cap and Y-gates
	oxide_top_layer_z 				= 7; //nm height of the oxide layer between Y-gates and X-gates
			
	x_doping						= (33 + extension); //nm end of doping region along x
	x_quantum 						= 33*2.5 + oxide_top_layer_z + extension;// begininning of quantum region from the two ends on x
	y_quantum						= 60; // begininning of quantum region from the two ends on y
	
	
	x_gate_x 						= 33; //nm extension of the X-gates along x axis
	x_gate_tot_y_res 				=  bulk_y - 2*y_quantum; //nm total length along y of X-gates
	x_gate_top_y_res 				= ( x_gate_tot_y_res -  x_gate_x)/2; //nm length along y of the upper part of the X-gates
	x_gate_tot_y 					= (bulk_y - 2*y_quantum)/1; //nm total length along y of X-gates
	x_gate_top_y 					= ( x_gate_tot_y -  x_gate_x)/2; //nm length along y of the upper part of the X-gates
	x_gate_z 						= 10; // nm extension of the X-gates along z axis
	x_gate_space_x 					=  oxide_top_layer_z; //nm space between two X-gates along x-direction
			
	y_gate_space_y 					= 2* oxide_top_layer_z +  x_gate_x; //nm space between two Y-gates along y-direction
	y_gate_x 						=  bulk_x - 2*extension; //nm extension of the Y-gates along x axis
	y_gate_y 						= ( bulk_y -  y_gate_space_y - 2*extension)/2; //nm extension of the Y-gates along y axis
	y_gate_z 						= 20; // nm extension of the Y-gates along z axis 
		
	x_begin 						= 0; //nm
	x_end 							=  x_begin +  bulk_x; //nm
	y_begin 						= 0; //nm
	y_end 							=  y_begin +  bulk_y; //nm
	z_begin 						= 0; //nm
	z_end 							=  z_begin +  bulk_strained_z +  bulk_bottom_z +  quantum_layer_z +  bulk_top_z +  cap_layer_z +  oxide_bottom_layer_z + 2* oxide_top_layer_z +  y_gate_z +  x_gate_z + pre_quantum_z + post_quantum_z +extension;//nm
	
	
	barrier_x_begin					=  x_begin +  2*x_gate_x +  x_gate_space_x + extension;

//-----------------------------------------------------------------------------
//
//	Heterostructure geometry deriverd parameters:
//
//-----------------------------------------------------------------------------	

	region_bulk_strained_x_min				= x_begin;
	region_bulk_strained_x_max				= x_end;
	region_bulk_strained_y_min				= y_begin;
	region_bulk_strained_y_max				= y_end;
	region_bulk_strained_z_min				= z_begin;
	region_bulk_strained_z_max				= region_bulk_strained_z_min +  bulk_strained_z;
				
	region_bulk_bottom_x_min				= x_begin;
	region_bulk_bottom_x_max				= x_end;
	region_bulk_bottom_y_min				= y_begin;
	region_bulk_bottom_y_max				= y_end;
	region_bulk_bottom_z_min				= region_bulk_strained_z_max;
	region_bulk_bottom_z_max				= region_bulk_bottom_z_min +  bulk_bottom_z;
	
	
	region_pre_quantum_A_dop_left_x_min		= x_begin;
	region_pre_quantum_A_dop_left_x_max		= region_pre_quantum_A_dop_left_x_min + x_doping;
	region_pre_quantum_A_dop_left_y_min		= y_begin;
	region_pre_quantum_A_dop_left_y_max		= region_pre_quantum_A_dop_left_y_min + y_quantum;
	region_pre_quantum_A_dop_left_z_min		= region_bulk_bottom_z_max;
	region_pre_quantum_A_dop_left_z_max		= region_pre_quantum_A_dop_left_z_min +  pre_quantum_z;
	
	region_pre_quantum_A_left_x_min			= region_pre_quantum_A_dop_left_x_max;
	region_pre_quantum_A_left_x_max			= x_quantum;
	region_pre_quantum_A_left_y_min			= y_begin;
	region_pre_quantum_A_left_y_max			= region_pre_quantum_A_left_y_min + y_quantum;
	region_pre_quantum_A_left_z_min			= region_bulk_bottom_z_max;
	region_pre_quantum_A_left_z_max			= region_pre_quantum_A_left_z_min +  pre_quantum_z;
	
	region_pre_quantum_A_mid_x_min			= x_quantum;
	region_pre_quantum_A_mid_x_max			= x_end - x_quantum;
	region_pre_quantum_A_mid_y_min			= y_begin;
	region_pre_quantum_A_mid_y_max			= region_pre_quantum_A_mid_y_min + y_quantum;
	region_pre_quantum_A_mid_z_min			= region_bulk_bottom_z_max;
	region_pre_quantum_A_mid_z_max			= region_pre_quantum_A_mid_z_min +  pre_quantum_z;
	
	region_pre_quantum_A_right_x_min		= x_end - x_quantum;
	region_pre_quantum_A_right_x_max		= x_end - x_doping;
	region_pre_quantum_A_right_y_min		= y_begin;
	region_pre_quantum_A_right_y_max		= region_pre_quantum_A_right_y_min + y_quantum;
	region_pre_quantum_A_right_z_min		= region_bulk_bottom_z_max;
	region_pre_quantum_A_right_z_max		= region_pre_quantum_A_right_z_min +  pre_quantum_z;
	
	region_pre_quantum_A_dop_right_x_min	= x_end - x_doping;
	region_pre_quantum_A_dop_right_x_max	= x_end;
	region_pre_quantum_A_dop_right_y_min	= y_begin;
	region_pre_quantum_A_dop_right_y_max	= region_pre_quantum_A_dop_right_y_min + y_quantum;
	region_pre_quantum_A_dop_right_z_min	= region_bulk_bottom_z_max;
	region_pre_quantum_A_dop_right_z_max	= region_pre_quantum_A_dop_right_z_min +  pre_quantum_z;
	
	region_pre_quantum_B_dop_left_x_min		= x_begin;
	region_pre_quantum_B_dop_left_x_max		= region_pre_quantum_B_dop_left_x_min + x_doping;
	region_pre_quantum_B_dop_left_y_min		= region_pre_quantum_A_dop_right_y_max;
	region_pre_quantum_B_dop_left_y_max		= y_end - y_quantum;
	region_pre_quantum_B_dop_left_z_min		= region_bulk_bottom_z_max;
	region_pre_quantum_B_dop_left_z_max		= region_pre_quantum_B_dop_left_z_min +  pre_quantum_z;
	
	region_pre_quantum_B_left_x_min			= region_pre_quantum_B_dop_left_x_max;
	region_pre_quantum_B_left_x_max			= x_quantum;
	region_pre_quantum_B_left_y_min			= region_pre_quantum_A_dop_right_y_max;
	region_pre_quantum_B_left_y_max			= y_end - y_quantum;
	region_pre_quantum_B_left_z_min			= region_bulk_bottom_z_max;
	region_pre_quantum_B_left_z_max			= region_pre_quantum_B_left_z_min +  pre_quantum_z;
	
	region_pre_quantum_B_mid_x_min			= x_quantum;
	region_pre_quantum_B_mid_x_max			= x_end - x_quantum;
	region_pre_quantum_B_mid_y_min			= region_pre_quantum_A_dop_right_y_max;
	region_pre_quantum_B_mid_y_max			= y_end - y_quantum;
	region_pre_quantum_B_mid_z_min			= region_bulk_bottom_z_max;
	region_pre_quantum_B_mid_z_max			= region_pre_quantum_B_mid_z_min +  pre_quantum_z;
	
	region_pre_quantum_B_right_x_min		= x_end - x_quantum;
	region_pre_quantum_B_right_x_max		= x_end - x_doping;
	region_pre_quantum_B_right_y_min		= region_pre_quantum_A_dop_right_y_max;
	region_pre_quantum_B_right_y_max		= y_end - y_quantum;
	region_pre_quantum_B_right_z_min		= region_bulk_bottom_z_max;
	region_pre_quantum_B_right_z_max		= region_pre_quantum_B_right_z_min +  pre_quantum_z;
	
	region_pre_quantum_B_dop_right_x_min	= x_end - x_doping;
	region_pre_quantum_B_dop_right_x_max	= x_end;
	region_pre_quantum_B_dop_right_y_min	= region_pre_quantum_A_dop_right_y_max;
	region_pre_quantum_B_dop_right_y_max	= y_end - y_quantum;
	region_pre_quantum_B_dop_right_z_min	= region_bulk_bottom_z_max;
	region_pre_quantum_B_dop_right_z_max	= region_pre_quantum_B_dop_right_z_min +  pre_quantum_z;
	
	region_pre_quantum_C_dop_left_x_min		= x_begin;
	region_pre_quantum_C_dop_left_x_max		= region_pre_quantum_C_dop_left_x_min + x_doping;
	region_pre_quantum_C_dop_left_y_min		= region_pre_quantum_B_dop_right_y_max;
	region_pre_quantum_C_dop_left_y_max		= y_end;
	region_pre_quantum_C_dop_left_z_min		= region_bulk_bottom_z_max;
	region_pre_quantum_C_dop_left_z_max		= region_pre_quantum_C_dop_left_z_min +  pre_quantum_z;
	
	region_pre_quantum_C_left_x_min			= region_pre_quantum_C_dop_left_x_max;
	region_pre_quantum_C_left_x_max			= x_quantum;
	region_pre_quantum_C_left_y_min			= region_pre_quantum_B_dop_right_y_max;
	region_pre_quantum_C_left_y_max			= y_end;
	region_pre_quantum_C_left_z_min			= region_bulk_bottom_z_max;
	region_pre_quantum_C_left_z_max			= region_pre_quantum_C_left_z_min +  pre_quantum_z;
	
	region_pre_quantum_C_mid_x_min			= x_quantum;
	region_pre_quantum_C_mid_x_max			= x_end - x_quantum;
	region_pre_quantum_C_mid_y_min			= region_pre_quantum_B_dop_right_y_max;
	region_pre_quantum_C_mid_y_max			= y_end;
	region_pre_quantum_C_mid_z_min			= region_bulk_bottom_z_max;
	region_pre_quantum_C_mid_z_max			= region_pre_quantum_C_mid_z_min +  pre_quantum_z;
	
	region_pre_quantum_C_right_x_min		= x_end - x_quantum;
	region_pre_quantum_C_right_x_max		= x_end - x_doping;
	region_pre_quantum_C_right_y_min		= region_pre_quantum_B_dop_right_y_max;
	region_pre_quantum_C_right_y_max		= y_end;
	region_pre_quantum_C_right_z_min		= region_bulk_bottom_z_max;
	region_pre_quantum_C_right_z_max		= region_pre_quantum_C_right_z_min +  pre_quantum_z;
	
	region_pre_quantum_C_dop_right_x_min	= x_end - x_doping;
	region_pre_quantum_C_dop_right_x_max	= x_end;
	region_pre_quantum_C_dop_right_y_min	= region_pre_quantum_B_dop_right_y_max;
	region_pre_quantum_C_dop_right_y_max	= y_end;
	region_pre_quantum_C_dop_right_z_min	= region_bulk_bottom_z_max;
	region_pre_quantum_C_dop_right_z_max	= region_pre_quantum_C_dop_right_z_min +  pre_quantum_z;
	
	region_quantum_layer_z_max = region_pre_quantum_C_dop_right_z_max + quantum_layer_z + post_quantum_z;
		
	region_bulk_top_x_min			= x_begin;
	region_bulk_top_x_max			= x_end;
	region_bulk_top_y_min			= y_begin;
	region_bulk_top_y_max			= y_end;
	region_bulk_top_z_min			= region_quantum_layer_z_max;
	region_bulk_top_z_max			= region_bulk_top_z_min +  bulk_top_z;
		
	region_cap_layer_x_min			= x_begin;
	region_cap_layer_x_max			= x_end;
	region_cap_layer_y_min			= y_begin;
	region_cap_layer_y_max			= y_end;
	region_cap_layer_z_min			= region_bulk_top_z_max;
	region_cap_layer_z_max			= region_cap_layer_z_min +  cap_layer_z;
	
	region_top_oxide_layer_x_min	= x_begin;
	region_top_oxide_layer_x_max	= x_end;
	region_top_oxide_layer_y_min	= y_begin;
	region_top_oxide_layer_y_max	= y_end;
	region_top_oxide_layer_z_min	= region_cap_layer_z_max;
	region_top_oxide_layer_z_max	= z_end;
	
	region_Y_gate_x_min				= x_doping;
	region_Y_gate_x_max				= x_end-x_doping;
	region_Y_gate_y_min				= y_begin+extension;
	region_Y_gate_y_max				= region_Y_gate_y_min +  y_gate_y;
	region_Y_gate_z_min				= region_top_oxide_layer_z_min +  oxide_bottom_layer_z;
	region_Y_gate_z_max				= region_Y_gate_z_min +  y_gate_z;

	region_Barrier_gate_h1_x_min	= barrier_x_begin;
	region_Barrier_gate_h1_x_max	= region_Barrier_gate_h1_x_min +  x_gate_x;
	region_Barrier_gate_h1_y_min	= (bulk_y - x_gate_x)/2 -x_gate_top_y;
	region_Barrier_gate_h1_y_max	= region_Barrier_gate_h1_y_min +  x_gate_top_y;
	region_Barrier_gate_h1_z_min	= region_Y_gate_z_max + 2* oxide_top_layer_z;
	region_Barrier_gate_h1_z_max	= region_Barrier_gate_h1_z_min +  x_gate_z;
			
	region_Barrier_gate_l1_x_min	= region_Barrier_gate_h1_x_min;
	region_Barrier_gate_l1_x_max	= region_Barrier_gate_h1_x_max;
	region_Barrier_gate_l1_y_min	= region_Barrier_gate_h1_y_max;
	region_Barrier_gate_l1_y_max	= region_Barrier_gate_l1_y_min +  x_gate_x;
	region_Barrier_gate_l1_z_min	= region_cap_layer_z_max + 3* oxide_top_layer_z;
	region_Barrier_gate_l1_z_max	= region_Barrier_gate_l1_z_min +  x_gate_z;
			
	region_Barrier_gate_h2_x_min	= region_Barrier_gate_h1_x_min;
	region_Barrier_gate_h2_x_max	= region_Barrier_gate_h1_x_max;
	region_Barrier_gate_h2_y_min	= region_Barrier_gate_l1_y_max;
	region_Barrier_gate_h2_y_max	= region_Barrier_gate_h2_y_min +  x_gate_top_y;
	region_Barrier_gate_h2_z_min	= region_Y_gate_z_max + 2* oxide_top_layer_z;
	region_Barrier_gate_h2_z_max	= region_Barrier_gate_h2_z_min +  x_gate_z;
	
	region_Plunger_gate_h1_x_min	= region_Barrier_gate_h1_x_max +  x_gate_space_x;
	region_Plunger_gate_h1_x_max	= region_Plunger_gate_h1_x_min +  x_gate_x;
	region_Plunger_gate_h1_y_min	= (bulk_y - x_gate_x)/2 -x_gate_top_y;
	region_Plunger_gate_h1_y_max	= region_Plunger_gate_h1_y_min +  x_gate_top_y;
	region_Plunger_gate_h1_z_min	= region_Y_gate_z_max +  oxide_top_layer_z;
	region_Plunger_gate_h1_z_max	= region_Plunger_gate_h1_z_min +  x_gate_z;
	
	region_Plunger_gate_l1_x_min	= region_Plunger_gate_h1_x_min;
	region_Plunger_gate_l1_x_max	= region_Plunger_gate_h1_x_max;
	region_Plunger_gate_l1_y_min	= region_Plunger_gate_h1_y_max;
	region_Plunger_gate_l1_y_max	= region_Plunger_gate_l1_y_min +  x_gate_x;
	region_Plunger_gate_l1_z_min	= region_cap_layer_z_max +  2*oxide_top_layer_z;
	region_Plunger_gate_l1_z_max	= region_Plunger_gate_l1_z_min +  x_gate_z;
	
	region_Plunger_gate_h2_x_min	= region_Plunger_gate_h1_x_min;
	region_Plunger_gate_h2_x_max	= region_Plunger_gate_h1_x_max;
	region_Plunger_gate_h2_y_min	= region_Plunger_gate_l1_y_max;
	region_Plunger_gate_h2_y_max	= region_Plunger_gate_h2_y_min +  x_gate_top_y;
	region_Plunger_gate_h2_z_min	= region_Y_gate_z_max +  oxide_top_layer_z;
	region_Plunger_gate_h2_z_max	= region_Plunger_gate_h2_z_min +  x_gate_z;
	
	
	region_Reservoir_gate_h1_x_min	= x_begin +extension;
	region_Reservoir_gate_h1_x_max	= region_Reservoir_gate_h1_x_min +  2*x_gate_x;
	region_Reservoir_gate_h1_y_min	= region_pre_quantum_B_mid_y_min;
	region_Reservoir_gate_h1_y_max	= region_Reservoir_gate_h1_y_min +  x_gate_top_y_res;
	region_Reservoir_gate_h1_z_min	= region_Y_gate_z_max +  oxide_top_layer_z;
	region_Reservoir_gate_h1_z_max	= region_Reservoir_gate_h1_z_min +  x_gate_z;
			
	region_Reservoir_gate_l1_x_min	= region_Reservoir_gate_h1_x_min;
	region_Reservoir_gate_l1_x_max	= region_Reservoir_gate_h1_x_max;
	region_Reservoir_gate_l1_y_min	= region_Reservoir_gate_h1_y_max;
	region_Reservoir_gate_l1_y_max	= region_Reservoir_gate_l1_y_min +  x_gate_x;
	region_Reservoir_gate_l1_z_min	= region_cap_layer_z_max +  2*oxide_top_layer_z;
	region_Reservoir_gate_l1_z_max	= region_Reservoir_gate_l1_z_min +  x_gate_z;
		
	region_Reservoir_gate_h2_x_min	= region_Reservoir_gate_h1_x_min;
	region_Reservoir_gate_h2_x_max	= region_Reservoir_gate_h1_x_max;
	region_Reservoir_gate_h2_y_min	= region_Reservoir_gate_l1_y_max;
	region_Reservoir_gate_h2_y_max	= region_pre_quantum_B_dop_right_y_max;
	region_Reservoir_gate_h2_z_min	= region_Y_gate_z_max +  oxide_top_layer_z;
	region_Reservoir_gate_h2_z_max	= region_Reservoir_gate_h2_z_min +  x_gate_z;
	


//-----------------------------------------------------------------------------
//
//	Mesh size:
//
//-----------------------------------------------------------------------------	

	grid_spacing_01				= 1; //nm
	grid_spacing_02				= grid_spacing_01*2; //
	grid_spacing_03				= grid_spacing_02*2; //
	grid_spacing_04				= grid_spacing_03; //
	grid_spacing_05				= grid_spacing_03*2; //


//-----------------------------------------------------------------------------
//
//	Internal variables:
//
//-----------------------------------------------------------------------------	
	np = 0;
	nl = 0;
	nv = 0;
	ncl = 0;
	nps = 0;
	nsl = 0;
	nphys = 2000;
	
//-----------------------------------------------------------------------------
//
//	Definition of the heterostructure geometry:
//
//-----------------------------------------------------------------------------	

// Bottom strained Si(1-x)Ge(x) layer

//	Point(np+1) 	= {region_bulk_strained_x_min, region_bulk_strained_y_min, region_bulk_strained_z_min, grid_spacing_05};
//	Point(np+2) 	= {region_bulk_strained_x_max, region_bulk_strained_y_min, region_bulk_strained_z_min, grid_spacing_05};
//	Point(np+3) 	= {region_bulk_strained_x_max, region_bulk_strained_y_max, region_bulk_strained_z_min, grid_spacing_05};
//	Point(np+4) 	= {region_bulk_strained_x_min, region_bulk_strained_y_max, region_bulk_strained_z_min, grid_spacing_05};
	Point(np+5) 	= {region_bulk_strained_x_min, region_bulk_strained_y_min, region_bulk_strained_z_max, grid_spacing_05};
	Point(np+6) 	= {region_bulk_strained_x_max, region_bulk_strained_y_min, region_bulk_strained_z_max, grid_spacing_05};
	Point(np+7) 	= {region_bulk_strained_x_max, region_bulk_strained_y_max, region_bulk_strained_z_max, grid_spacing_05};
	Point(np+8) 	= {region_bulk_strained_x_min, region_bulk_strained_y_max, region_bulk_strained_z_max, grid_spacing_05};
	
//	Line(nl+1)		= {np+1 , np+2};
//	Line(nl+2)		= {np+2 , np+3};
//	Line(nl+3)		= {np+3 , np+4};
//	Line(nl+4)		= {np+4 , np+1};
//	Line(nl+5)		= {np+1 , np+5};
//	Line(nl+6)		= {np+2 , np+6};
//	Line(nl+7)		= {np+3 , np+7};
//	Line(nl+8)		= {np+4 , np+8};
	Line(nl+9)		= {np+5 , np+6};
	Line(nl+10)		= {np+6 , np+7};
	Line(nl+11)		= {np+7 , np+8};
	Line(nl+12)		= {np+8 , np+5};
//	
//						
//	Curve Loop(ncl+1)	= {nl+1,nl+2,nl+3,nl+4};
//	Curve Loop(ncl+2)	= {nl+1,nl+6,-(nl+9), -(nl+5)};
//	Curve Loop(ncl+3)	= {nl+2,nl+7,-(nl+10), -(nl+6)};
//	Curve Loop(ncl+4)	= {nl+3,nl+8,-(nl+11), -(nl+7)};
//	Curve Loop(ncl+5)	= {nl+4,nl+5,-(nl+12), -(nl+8)};
	Curve Loop(ncl+6)	= {nl+9,nl+10,nl+11,nl+12};
//	
//	Plane Surface(nps+1) = {ncl+1};
//	Plane Surface(nps+2) = {ncl+2};
//	Plane Surface(nps+3) = {ncl+3};
//	Plane Surface(nps+4) = {ncl+4};
//	Plane Surface(nps+5) = {ncl+5};
	Plane Surface(nps+6) = {ncl+6};
//	
//	Surface Loop(nsl +1) = {nps+1, nps+2, nps+3, nps+4, nps+5, nps+6};
//	
//	Volume(nv+1) = {nsl +1};
//	
//	Physical Volume("region_bulk_strained", nv+1) = {nv +1};
//	Physical Surface("surface_bottom", (nphys+1)) = {(1)};
//	
	nv = nv +1;
	np = np +8;
	nsl = nsl +1;
	nps = nps +6;
	ncl = ncl +6;
	nl = nl+12;
	nphys = nphys+1;
	

//-------------------------------------------------------------------------------------------------------------------	
// Pre-Quantum layer A

	Point(np+1) 	= {region_pre_quantum_A_dop_left_x_min, 	region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_min,	grid_spacing_02};
	Point(np+2) 	= {region_pre_quantum_A_dop_left_x_max, 	region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_min,	grid_spacing_02};
//	Point(np+3) 	= {region_pre_quantum_A_left_x_max, 		region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_min,	grid_spacing_02};
//	Point(np+4) 	= {region_pre_quantum_A_mid_x_max, 			region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_min,	grid_spacing_02};
	Point(np+5) 	= {region_pre_quantum_A_right_x_max, 		region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_min,	grid_spacing_02};
	Point(np+6) 	= {region_pre_quantum_A_dop_right_x_max, 	region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_min,	grid_spacing_02};
	Point(np+7) 	= {region_pre_quantum_A_dop_right_x_max, 	region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_min,	grid_spacing_02};
	Point(np+8) 	= {region_pre_quantum_A_dop_right_x_min, 	region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_min,	grid_spacing_02};
	Point(np+9) 	= {region_pre_quantum_A_right_x_min, 		region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_min,	grid_spacing_02};
	Point(np+10) 	= {region_pre_quantum_A_mid_x_min, 			region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_min,	grid_spacing_02};
	Point(np+11) 	= {region_pre_quantum_A_left_x_min, 		region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_min,	grid_spacing_02};
	Point(np+12) 	= {region_pre_quantum_A_dop_left_x_min, 	region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_min,	grid_spacing_02};
	Point(np+13) 	= {region_pre_quantum_A_dop_left_x_min, 	region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max,	grid_spacing_01};
	Point(np+14) 	= {region_pre_quantum_A_dop_left_x_max, 	region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max,	grid_spacing_01};
//	Point(np+15) 	= {region_pre_quantum_A_left_x_max, 		region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max,	grid_spacing_01};
//	Point(np+16) 	= {region_pre_quantum_A_mid_x_max, 			region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max,	grid_spacing_01};
	Point(np+17) 	= {region_pre_quantum_A_right_x_max, 		region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max,	grid_spacing_01};
	Point(np+18) 	= {region_pre_quantum_A_dop_right_x_max, 	region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max,	grid_spacing_01};
	Point(np+19) 	= {region_pre_quantum_A_dop_right_x_max, 	region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max,	grid_spacing_01};
	Point(np+20) 	= {region_pre_quantum_A_dop_right_x_min, 	region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max,	grid_spacing_01};
	Point(np+21) 	= {region_pre_quantum_A_right_x_min, 		region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max,	grid_spacing_01};
	Point(np+22) 	= {region_pre_quantum_A_mid_x_min, 			region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max,	grid_spacing_01};
	Point(np+23) 	= {region_pre_quantum_A_left_x_min, 		region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max,	grid_spacing_01};
	Point(np+24) 	= {region_pre_quantum_A_dop_left_x_min, 	region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max,	grid_spacing_01};
	
	Line(nl+1) 	= {np+1, 	np+2};
	Line(nl+2) 	= {np+2, 	np+5};
//	Line(nl+3) 	= {np+3, 	np+4};
//	Line(nl+4) 	= {np+4, 	np+5};
	Line(nl+5) 	= {np+5, 	np+6};
	Line(nl+6) 	= {np+6, 	np+7};
	Line(nl+7) 	= {np+7, 	np+8};
	Line(nl+8) 	= {np+8, 	np+9};
	Line(nl+9) 	= {np+9, 	np+10};
	Line(nl+10) = {np+10, 	np+11};
	Line(nl+11) = {np+11, 	np+12};
	Line(nl+12) = {np+12, 	np+1};
	
	Line(nl+13) = {np+1,  	np+13};
	Line(nl+14) = {np+2,  	np+14};
//	Line(nl+15) = {np+3,  	np+15};
//	Line(nl+16) = {np+4,  	np+16};
	Line(nl+17) = {np+5,  	np+17};
	Line(nl+18) = {np+6,  	np+18};
	Line(nl+19) = {np+7,  	np+19};
	Line(nl+20) = {np+8,  	np+20};
	Line(nl+21) = {np+9,  	np+21};
	Line(nl+22) = {np+10, 	np+22};
	Line(nl+23) = {np+11, 	np+23};
	Line(nl+24) = {np+12, 	np+24};
	
	Line(nl+25) = {np+13,	np+14};
	Line(nl+26) = {np+14,	np+17};
//	Line(nl+27) = {np+15,	np+16};
//	Line(nl+28) = {np+16,	np+17};
	Line(nl+29) = {np+17,	np+18};
	Line(nl+30) = {np+18,	np+19};
	Line(nl+31) = {np+19,	np+20};
	Line(nl+32) = {np+20,	np+21};
	Line(nl+33) = {np+21,	np+22};
	Line(nl+34) = {np+22,	np+23};
	Line(nl+35) = {np+23,	np+24};
	Line(nl+36) = {np+24,	np+13};
	
	Line(nl+37) = {np+2,	np+11};
//	Line(nl+38) = {np+3,	np+10};
//	Line(nl+39) = {np+4,	np+9};
	Line(nl+40) = {np+5,	np+8};
	Line(nl+41) = {np+14,	np+23};
//	Line(nl+42) = {np+15,	np+22};
//	Line(nl+43) = {np+16,	np+21};
	Line(nl+44) = {np+17,	np+20};


	Curve Loop(ncl+1)	= {nl+1, nl+37, nl+11, nl+12};
	Curve Loop(ncl+2)	= {nl+2, nl+40, nl+8, nl+9, nl+10, -(nl+37)};
//	Curve Loop(ncl+3)	= {nl+3, nl+39, nl+9, -(nl+38)};
//	Curve Loop(ncl+4)	= {nl+4, nl+40, nl+8, -(nl+39)};
	Curve Loop(ncl+5)	= {nl+5, nl+6, nl+7, -(nl+40)};
	
	Curve Loop(ncl+6)	= {(nl+12), (nl+13), -(nl+36), -(nl+24)};
	Curve Loop(ncl+7)	= {-(nl+37), (nl+14), (nl+41), -(nl+23)};
//	Curve Loop(ncl+8)	= {-(nl+38), (nl+15), (nl+42), -(nl+22)};
//	Curve Loop(ncl+9)	= {-(nl+39), (nl+16), (nl+43), -(nl+21)};
    Curve Loop(ncl+10)	= {-(nl+40), (nl+17), (nl+44), -(nl+20)};
	Curve Loop(ncl+11)	= {-(nl+6 ), (nl+18), (nl+30), -(nl+19)};
	
	Curve Loop(ncl+12)	= {(nl+1),	(nl+14),	-(nl+25),  -(nl+13)};
	Curve Loop(ncl+13)	= {(nl+2),	(nl+17),	-(nl+26),  -(nl+14)};
//	Curve Loop(ncl+14)	= {(nl+3),	(nl+16),	-(nl+27),  -(nl+15)};
//	Curve Loop(ncl+15)	= {(nl+4),	(nl+17),	-(nl+28),  -(nl+16)};
	Curve Loop(ncl+16)	= {(nl+5),	(nl+18),	-(nl+29),  -(nl+17)};
	
	Curve Loop(ncl+17)	= {(nl+7),	(nl+20),	-(nl+31),  -(nl+19)};
	Curve Loop(ncl+18)	= {(nl+8),	(nl+21),	-(nl+32),  -(nl+20)};
	Curve Loop(ncl+19)	= {(nl+9),	(nl+22),	-(nl+33),  -(nl+21)};
	Curve Loop(ncl+20)	= {(nl+10),	(nl+23),	-(nl+34),  -(nl+22)};
	Curve Loop(ncl+21)	= {(nl+11),	(nl+24),	-(nl+35),  -(nl+23)};
	
	Curve Loop(ncl+22)	= {(nl+25),	(nl+41),	(nl+35),   (nl+36)};
	Curve Loop(ncl+23)	= {(nl+26),	(nl+44),	(nl+32), nl+33, nl+34,  -(nl+41)};
//	Curve Loop(ncl+24)	= {(nl+27),	(nl+43),	(nl+33),  -(nl+42)};
//	Curve Loop(ncl+25)	= {(nl+28),	(nl+44),	(nl+32),  -(nl+43)};
	Curve Loop(ncl+26)	= {(nl+29),	(nl+30),	(nl+31),  -(nl+44)};
	
	Plane Surface(nps+1)	= {ncl+1};
	Plane Surface(nps+2)	= {ncl+2};
//	Plane Surface(nps+3)	= {ncl+3};
//	Plane Surface(nps+4)	= {ncl+4};
	Plane Surface(nps+5)	= {ncl+5};
				
	Plane Surface(nps+6)	= {ncl+6};
	Plane Surface(nps+7)	= {ncl+7};
//	Plane Surface(nps+8)	= {ncl+8};
//	Plane Surface(nps+9)	= {ncl+9};
	Plane Surface(nps+10)	= {ncl+10};
	Plane Surface(nps+11)	= {ncl+11};
				
	Plane Surface(nps+12)	= {ncl+12};
	Plane Surface(nps+13)	= {ncl+13};
//	Plane Surface(nps+14)	= {ncl+14};
//	Plane Surface(nps+15)	= {ncl+15};
	Plane Surface(nps+16)	= {ncl+16};
			
	Plane Surface(nps+17)	= {ncl+17};
	Plane Surface(nps+18)	= {ncl+18};
	Plane Surface(nps+19)	= {ncl+19};
	Plane Surface(nps+20)	= {ncl+20};
	Plane Surface(nps+21)	= {ncl+21};
			
    Plane Surface(nps+22)	= {ncl+22};
    Plane Surface(nps+23)	= {ncl+23};
//  Plane Surface(nps+24)	= {ncl+24};
//  Plane Surface(nps+25)	= {ncl+25};
    Plane Surface(nps+26)	= {ncl+26};


	Surface Loop(nsl +1) = {nps+1,	 nps+6,	 nps+7,	 nps+12, nps+21, nps+22};
	Surface Loop(nsl +2) = {nps+2,	 nps+7,	 nps+10, nps+13, nps+20, nps+19, nps+18, nps+23};
//	Surface Loop(nsl +3) = {nps+3,	 nps+8,	 nps+9,	 nps+14, nps+19, nps+24};
//	Surface Loop(nsl +4) = {nps+4,	 nps+9,	 nps+10, nps+15, nps+18, nps+25};
	Surface Loop(nsl +5) = {nps+5,	 nps+10, nps+11, nps+16, nps+17, nps+26};

	Volume(nv+1) = {nsl +1};
	Volume(nv+2) = {nsl +2};
//	Volume(nv+3) = {nsl +3};
//	Volume(nv+4) = {nsl +4};
	Volume(nv+5) = {nsl +5};
	
	Physical Volume("region_pre_quantum_A_dop_left", nv+1) = {nv +1};
//	Physical Volume("region_pre_quantum_A_left", nv+2) = {nv +2};
	Physical Volume("region_pre_quantum_A_mid", nv+3) = {nv +2};
//	Physical Volume("region_pre_quantum_A_right", nv+4) = {nv +4};
	Physical Volume("region_pre_quantum_A_dop_right", nv+5) = {nv +5};
	Color{169, 188, 208}{ Physical Volume{ nv+1:nv+5}; }

	np = np + 24;
	nl = nl + 44;
	ncl = ncl + 26;
	nps = nps + 26;
	nsl = nsl + 5;
	nv = nv +5;
	
//-------------------------------------------------------------------------------------------------------------------	
// Pre-Quantum layer B

//	Point(np+1) 	= {region_pre_quantum_B_dop_left_x_min, 	region_pre_quantum_B_dop_left_y_min, 	region_pre_quantum_B_dop_left_z_min,	grid_spacing_02};
//	Point(np+2) 	= {region_pre_quantum_B_dop_left_x_max, 	region_pre_quantum_B_dop_left_y_min, 	region_pre_quantum_B_dop_left_z_min,	grid_spacing_02};
//	Point(np+3) 	= {region_pre_quantum_B_left_x_max, 		region_pre_quantum_B_dop_left_y_min, 	region_pre_quantum_B_dop_left_z_min,	grid_spacing_02};
//	Point(np+4) 	= {region_pre_quantum_B_mid_x_max, 			region_pre_quantum_B_dop_left_y_min, 	region_pre_quantum_B_dop_left_z_min,	grid_spacing_02};
//	Point(np+5) 	= {region_pre_quantum_B_right_x_max, 		region_pre_quantum_B_dop_left_y_min, 	region_pre_quantum_B_dop_left_z_min,	grid_spacing_02};
//	Point(np+6) 	= {region_pre_quantum_B_dop_right_x_max, 	region_pre_quantum_B_dop_left_y_min, 	region_pre_quantum_B_dop_left_z_min,	grid_spacing_02};
	Point(np+7) 	= {region_pre_quantum_B_dop_right_x_max, 	region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_min,	grid_spacing_02};
	Point(np+8) 	= {region_pre_quantum_B_dop_right_x_min, 	region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_min,	grid_spacing_02};
	Point(np+9) 	= {region_pre_quantum_B_right_x_min, 		region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_min,	grid_spacing_02};
	Point(np+10) 	= {region_pre_quantum_B_mid_x_min, 			region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_min,	grid_spacing_02};
	Point(np+11) 	= {region_pre_quantum_B_left_x_min, 		region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_min,	grid_spacing_02};
	Point(np+12) 	= {region_pre_quantum_B_dop_left_x_min, 	region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_min,	grid_spacing_02};
//	Point(np+13) 	= {region_pre_quantum_B_dop_left_x_min, 	region_pre_quantum_B_dop_left_y_min, 	region_pre_quantum_B_dop_left_z_max,	grid_spacing_01};
//	Point(np+14) 	= {region_pre_quantum_B_dop_left_x_max, 	region_pre_quantum_B_dop_left_y_min, 	region_pre_quantum_B_dop_left_z_max,	grid_spacing_01};
//	Point(np+15) 	= {region_pre_quantum_B_left_x_max, 		region_pre_quantum_B_dop_left_y_min, 	region_pre_quantum_B_dop_left_z_max,	grid_spacing_01};
//	Point(np+16) 	= {region_pre_quantum_B_mid_x_max, 			region_pre_quantum_B_dop_left_y_min, 	region_pre_quantum_B_dop_left_z_max,	grid_spacing_01};
//	Point(np+17) 	= {region_pre_quantum_B_right_x_max, 		region_pre_quantum_B_dop_left_y_min, 	region_pre_quantum_B_dop_left_z_max,	grid_spacing_01};
	Point(np+18) 	= {region_pre_quantum_B_dop_right_x_max, 	region_pre_quantum_B_dop_left_y_min, 	region_pre_quantum_B_dop_left_z_max,	grid_spacing_01};
	Point(np+19) 	= {region_pre_quantum_B_dop_right_x_max, 	region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_max,	grid_spacing_01};
	Point(np+20) 	= {region_pre_quantum_B_dop_right_x_min, 	region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_max,	grid_spacing_01};
	Point(np+21) 	= {region_pre_quantum_B_right_x_min, 		region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_max,	grid_spacing_01};
	Point(np+22) 	= {region_pre_quantum_B_mid_x_min, 			region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_max,	grid_spacing_01};
	Point(np+23) 	= {region_pre_quantum_B_left_x_min, 		region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_max,	grid_spacing_01};
	Point(np+24) 	= {region_pre_quantum_B_dop_left_x_min, 	region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_max,	grid_spacing_01};

//	Line(nl+1) 	= {np+1, 	np+2};
//	Line(nl+2) 	= {np+2, 	np+3};
//	Line(nl+3) 	= {np+3, 	np+4};
//	Line(nl+4) 	= {np+4, 	np+5};
//	Line(nl+5) 	= {np+5, 	np+6};
	Line(nl+6) 	= {np-17, 	np+7};
	Line(nl+7) 	= {np+7, 	np+8};
	Line(nl+8) 	= {np+8, 	np+9};
	Line(nl+9) 	= {np+9, 	np+10};
	Line(nl+10) = {np+10, 	np+11};
	Line(nl+11) = {np+11, 	np+12};
	Line(nl+12) = {np+12, 	np-12};
	
//	Line(nl+13) = {np+1,  	np+13};
//	Line(nl+14) = {np+2,  	np+14};
//	Line(nl+15) = {np+3,  	np+15};
//	Line(nl+16) = {np+4,  	np+16};
//	Line(nl+17) = {np+5,  	np+17};
//	Line(nl+18) = {np+6,  	np+18};
	Line(nl+19) = {np+7,  	np+19};
	Line(nl+20) = {np+8,  	np+20};
	Line(nl+21) = {np+9,  	np+21};
	Line(nl+22) = {np+10, 	np+22};
	Line(nl+23) = {np+11, 	np+23};
	Line(nl+24) = {np+12, 	np+24};
	
//	Line(nl+25) = {np+13,	np+14};
//	Line(nl+26) = {np+14,	np+15};
//	Line(nl+27) = {np+15,	np+16};
//	Line(nl+28) = {np+16,	np+17};
//	Line(nl+29) = {np+17,	np+18};
	Line(nl+30) = {np-5,	np+19};
	Line(nl+31) = {np+19,	np+20};
	Line(nl+32) = {np+20,	np+21};
	Line(nl+33) = {np+21,	np+22};
	Line(nl+34) = {np+22,	np+23};
	Line(nl+35) = {np+23,	np+24};
	Line(nl+36) = {np+24,	np};
	
	Line(nl+37) = {np-13,	np+11};
	Line(nl+38) = {np-14,	np+10};
	Line(nl+39) = {np-15,	np+9};
	Line(nl+40) = {np-16,	np+8};
	Line(nl+41) = {np-1,	np+23};
	Line(nl+42) = {np-2,	np+22};
	Line(nl+43) = {np-3,	np+21};
	Line(nl+44) = {np-4,	np+20};

	Curve Loop(ncl+1)	= {-(nl-33), nl+37, nl+11, nl+12};
	Curve Loop(ncl+2)	= {-(nl-34), nl+38, nl+10, -(nl+37)};
	Curve Loop(ncl+3)	= {-(nl-35), nl+39, nl+9, -(nl+38)};
	Curve Loop(ncl+4)	= {-(nl-36), nl+40, nl+8, -(nl+39)};
	Curve Loop(ncl+5)	= {-(nl-37), nl+6, nl+7, -(nl+40)};
	
	Curve Loop(ncl+6)	= {(nl+12), 	(nl-20), -(nl+36), -(nl+24)};
	Curve Loop(ncl+7)	= {-(nl+37), 	(nl-21), (nl+41), -(nl+23)};
	Curve Loop(ncl+8)	= {-(nl+38), 	(nl-22), (nl+42), -(nl+22)};
	Curve Loop(ncl+9)	= {-(nl+39), 	(nl-23), (nl+43), -(nl+21)};
	Curve Loop(ncl+10)	= {-(nl+40), 	(nl-24), (nl+44), -(nl+20)};
	Curve Loop(ncl+11)	= {-(nl+6 ), 	(nl-25), (nl+30), -(nl+19)};
	
//	Curve Loop(ncl+12)	= {(nl+1),	(nl+14),	-(nl+25),  -(nl+13)};
//	Curve Loop(ncl+13)	= {(nl+2),	(nl+15),	-(nl+26),  -(nl+14)};
//	Curve Loop(ncl+14)	= {(nl+3),	(nl+16),	-(nl+27),  -(nl+15)};
//	Curve Loop(ncl+15)	= {(nl+4),	(nl+17),	-(nl+28),  -(nl+16)};
//	Curve Loop(ncl+16)	= {(nl+5),	(nl+18),	-(nl+29),  -(nl+17)};

	Curve Loop(ncl+17)	= {(nl+7),	(nl+20),	-(nl+31),  -(nl+19)};
	Curve Loop(ncl+18)	= {(nl+8),	(nl+21),	-(nl+32),  -(nl+20)};
	Curve Loop(ncl+19)	= {(nl+9),	(nl+22),	-(nl+33),  -(nl+21)};
	Curve Loop(ncl+20)	= {(nl+10),	(nl+23),	-(nl+34),  -(nl+22)};
	Curve Loop(ncl+21)	= {(nl+11),	(nl+24),	-(nl+35),  -(nl+23)};
	
	Curve Loop(ncl+22)	= {-(nl-9),	(nl+41),	(nl+35),   (nl+36)};
	Curve Loop(ncl+23)	= {-(nl-10),	(nl+42),	(nl+34),  -(nl+41)};
	Curve Loop(ncl+24)	= {-(nl-11),	(nl+43),	(nl+33),  -(nl+42)};
	Curve Loop(ncl+25)	= {-(nl-12),	(nl+44),	(nl+32),  -(nl+43)};
	Curve Loop(ncl+26)	= {-(nl-13),	(nl+30),	(nl+31),  -(nl+44)};
	
	Surface(nps+1)	= {ncl+1};
	Surface(nps+2)	= {ncl+2};
	Surface(nps+3)	= {ncl+3};
	Surface(nps+4)	= {ncl+4};
	Surface(nps+5)	= {ncl+5};
					
	Surface(nps+6)	= {ncl+6};
	Surface(nps+7)	= {ncl+7};
	Surface(nps+8)	= {ncl+8};
	Surface(nps+9)	= {ncl+9};
	Surface(nps+10)	= {ncl+10};
	Surface(nps+11)	= {ncl+11};
					
//	Surface(nps+12)	= {ncl+12};
//	Surface(nps+13)	= {ncl+13};
//	Surface(nps+14)	= {ncl+14};
//	Surface(nps+15)	= {ncl+15};
//	Surface(nps+16)	= {ncl+16};
					
	Surface(nps+17)	= {ncl+17};
	Surface(nps+18)	= {ncl+18};
	Surface(nps+19)	= {ncl+19};
	Surface(nps+20)	= {ncl+20};
	Surface(nps+21)	= {ncl+21};
				
	Surface(nps+22)	= {ncl+22};
	Surface(nps+23)	= {ncl+23};
	Surface(nps+24)	= {ncl+24};
	Surface(nps+25)	= {ncl+25};
	Surface(nps+26)	= {ncl+26};

	Surface Loop(nsl +1) = {nps+1,	 nps+6,	 nps+7,	 nps-5, nps+21, nps+22};
	Surface Loop(nsl +2) = {nps+2,	 nps+7,	 nps+8,	 nps-6, nps+20, nps+23};
	Surface Loop(nsl +3) = {nps+3,	 nps+8,	 nps+9,	 nps-7, nps+19, nps+24};
	Surface Loop(nsl +4) = {nps+4,	 nps+9,	 nps+10, nps-8, nps+18, nps+25};
	Surface Loop(nsl +5) = {nps+5,	 nps+10, nps+11, nps-9, nps+17, nps+26};

	Volume(nv+1) = {nsl +1};
	Volume(nv+2) = {nsl +2};
	Volume(nv+3) = {nsl +3};
	Volume(nv+4) = {nsl +4};
	Volume(nv+5) = {nsl +5};
	
	Physical Volume("region_pre_quantum_B_dop_left", nv+1) = {nv +1};
	Physical Volume("region_pre_quantum_B_left", nv+2) = {nv +2};
	Physical Volume("region_pre_quantum_B_mid", nv+3) = {nv +3};
	Physical Volume("region_pre_quantum_B_right", nv+4) = {nv +4};
	Physical Volume("region_pre_quantum_B_dop_right", nv+5) = {nv +5};
	Color{169, 188, 208}{ Physical Volume{ nv+1:nv+5}; }

	np = np + 24;
	nl = nl + 44;
	ncl = ncl + 26;
	nps = nps + 26;
	nsl = nsl + 5;
	nv = nv +5;

//-------------------------------------------------------------------------------------------------------------------	
// Pre-Quantum layer C

//	Point(np+1) 	= {region_pre_quantum_C_dop_left_x_min, 	region_pre_quantum_C_dop_left_y_min, 	region_pre_quantum_C_dop_left_z_min,	grid_spacing_02};
//	Point(np+2) 	= {region_pre_quantum_C_dop_left_x_max, 	region_pre_quantum_C_dop_left_y_min, 	region_pre_quantum_C_dop_left_z_min,	grid_spacing_02};
//	Point(np+3) 	= {region_pre_quantum_C_left_x_max, 		region_pre_quantum_C_dop_left_y_min, 	region_pre_quantum_C_dop_left_z_min,	grid_spacing_02};
//	Point(np+4) 	= {region_pre_quantum_C_mid_x_max, 			region_pre_quantum_C_dop_left_y_min, 	region_pre_quantum_C_dop_left_z_min,	grid_spacing_02};
//	Point(np+5) 	= {region_pre_quantum_C_right_x_max, 		region_pre_quantum_C_dop_left_y_min, 	region_pre_quantum_C_dop_left_z_min,	grid_spacing_02};
//	Point(np+6) 	= {region_pre_quantum_C_dop_right_x_max, 	region_pre_quantum_C_dop_left_y_min, 	region_pre_quantum_C_dop_left_z_min,	grid_spacing_02};
	Point(np+7) 	= {region_pre_quantum_C_dop_right_x_max, 	region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_min,	grid_spacing_02};
	Point(np+8) 	= {region_pre_quantum_C_dop_right_x_min, 	region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_min,	grid_spacing_02};
//	Point(np+9) 	= {region_pre_quantum_C_right_x_min, 		region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_min,	grid_spacing_02};
//	Point(np+10) 	= {region_pre_quantum_C_mid_x_min, 			region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_min,	grid_spacing_02};
	Point(np+11) 	= {region_pre_quantum_C_left_x_min, 		region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_min,	grid_spacing_02};
	Point(np+12) 	= {region_pre_quantum_C_dop_left_x_min, 	region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_min,	grid_spacing_02};
//	Point(np+13) 	= {region_pre_quantum_C_dop_left_x_min, 	region_pre_quantum_C_dop_left_y_min, 	region_pre_quantum_C_dop_left_z_max,	grid_spacing_01};
//	Point(np+14) 	= {region_pre_quantum_C_dop_left_x_max, 	region_pre_quantum_C_dop_left_y_min, 	region_pre_quantum_C_dop_left_z_max,	grid_spacing_01};
//	Point(np+15) 	= {region_pre_quantum_C_left_x_max, 		region_pre_quantum_C_dop_left_y_min, 	region_pre_quantum_C_dop_left_z_max,	grid_spacing_01};
//	Point(np+16) 	= {region_pre_quantum_C_mid_x_max, 			region_pre_quantum_C_dop_left_y_min, 	region_pre_quantum_C_dop_left_z_max,	grid_spacing_01};
//	Point(np+17) 	= {region_pre_quantum_C_right_x_max, 		region_pre_quantum_C_dop_left_y_min, 	region_pre_quantum_C_dop_left_z_max,	grid_spacing_01};
//	Point(np+18) 	= {region_pre_quantum_C_dop_right_x_max, 	region_pre_quantum_C_dop_left_y_min, 	region_pre_quantum_C_dop_left_z_max,	grid_spacing_01};
	Point(np+19) 	= {region_pre_quantum_C_dop_right_x_max, 	region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_max,	grid_spacing_01};
	Point(np+20) 	= {region_pre_quantum_C_dop_right_x_min, 	region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_max,	grid_spacing_01};
//	Point(np+21) 	= {region_pre_quantum_C_right_x_min, 		region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_max,	grid_spacing_01};
//	Point(np+22) 	= {region_pre_quantum_C_mid_x_min, 			region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_max,	grid_spacing_01};
	Point(np+23) 	= {region_pre_quantum_C_left_x_min, 		region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_max,	grid_spacing_01};
	Point(np+24) 	= {region_pre_quantum_C_dop_left_x_min, 	region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_max,	grid_spacing_01};

//	Line(nl+1) 	= {np+1, 	np+2};
//	Line(nl+2) 	= {np+2, 	np+3};
//	Line(nl+3) 	= {np+3, 	np+4};
//	Line(nl+4) 	= {np+4, 	np+5};
//	Line(nl+5) 	= {np+5, 	np+6};
	Line(nl+6) 	= {np-17, 	np+7};
	Line(nl+7) 	= {np+7, 	np+8};
	Line(nl+8) 	= {np+8, 	np+11};
//	Line(nl+9) 	= {np+9, 	np+10};
//	Line(nl+10) = {np+10, 	np+11};
	Line(nl+11) = {np+11, 	np+12};
	Line(nl+12) = {np+12, 	np-12};
	
//	Line(nl+13) = {np+1,  	np+13};
//	Line(nl+14) = {np+2,  	np+14};
//	Line(nl+15) = {np+3,  	np+15};
//	Line(nl+16) = {np+4,  	np+16};
//	Line(nl+17) = {np+5,  	np+17};
//	Line(nl+18) = {np+6,  	np+18};
	Line(nl+19) = {np+7,  	np+19};
	Line(nl+20) = {np+8,  	np+20};
//	Line(nl+21) = {np+9,  	np+21};
//	Line(nl+22) = {np+10, 	np+22};
	Line(nl+23) = {np+11, 	np+23};
	Line(nl+24) = {np+12, 	np+24};
	
//	Line(nl+25) = {np+13,	np+14};
//	Line(nl+26) = {np+14,	np+15};
//	Line(nl+27) = {np+15,	np+16};
//	Line(nl+28) = {np+16,	np+17};
//	Line(nl+29) = {np+17,	np+18};
	Line(nl+30) = {np-5,	np+19};
	Line(nl+31) = {np+19,	np+20};
	Line(nl+32) = {np+20,	np+23};
//	Line(nl+33) = {np+21,	np+22};
//	Line(nl+34) = {np+22,	np+23};
	Line(nl+35) = {np+23,	np+24};
	Line(nl+36) = {np+24,	np};
	
	Line(nl+37) = {np-13,	np+11};
//	Line(nl+38) = {np-14,	np+10};
//	Line(nl+39) = {np-15,	np+9};
	Line(nl+40) = {np-16,	np+8};
	Line(nl+41) = {np-1,	np+23};
//	Line(nl+42) = {np-2,	np+22};
//	Line(nl+43) = {np-3,	np+21};
	Line(nl+44) = {np-4,	np+20};

	Curve Loop(ncl+1)	= {-(nl-33), nl+37, nl+11, nl+12};
	Curve Loop(ncl+2)	= {-(nl-34), -(nl-35), -(nl-36), nl+40, nl+8, -(nl+37)};
//	Curve Loop(ncl+3)	= {-(nl-35), nl+39, nl+9, -(nl+38)};
//	Curve Loop(ncl+4)	= {-(nl-36), nl+40, nl+8, -(nl+39)};
	Curve Loop(ncl+5)	= {-(nl-37), nl+6, nl+7, -(nl+40)};
	
	Curve Loop(ncl+6)	= {(nl+12), 	(nl-20), -(nl+36), -(nl+24)};
	Curve Loop(ncl+7)	= {-(nl+37), 	(nl-21), (nl+41), -(nl+23)};
//	Curve Loop(ncl+8)	= {-(nl+38), 	(nl-22), (nl+42), -(nl+22)};
//	Curve Loop(ncl+9)	= {-(nl+39), 	(nl-23), (nl+43), -(nl+21)};
	Curve Loop(ncl+10)	= {-(nl+40), 	(nl-24), (nl+44), -(nl+20)};
	Curve Loop(ncl+11)	= {-(nl+6 ), 	(nl-25), (nl+30), -(nl+19)};
	
//	Curve Loop(ncl+12)	= {(nl+1),	(nl+14),	-(nl+25),  -(nl+13)};
//	Curve Loop(ncl+13)	= {(nl+2),	(nl+15),	-(nl+26),  -(nl+14)};
//	Curve Loop(ncl+14)	= {(nl+3),	(nl+16),	-(nl+27),  -(nl+15)};
//	Curve Loop(ncl+15)	= {(nl+4),	(nl+17),	-(nl+28),  -(nl+16)};
//	Curve Loop(ncl+16)	= {(nl+5),	(nl+18),	-(nl+29),  -(nl+17)};

	Curve Loop(ncl+17)	= {(nl+7),	(nl+20),	-(nl+31),  -(nl+19)};
	Curve Loop(ncl+18)	= {(nl+8),	(nl+23),	-(nl+32),  -(nl+20)};
//	Curve Loop(ncl+19)	= {(nl+9),	(nl+22),	-(nl+33),  -(nl+21)};
//	Curve Loop(ncl+20)	= {(nl+10),	(nl+23),	-(nl+34),  -(nl+22)};
	Curve Loop(ncl+21)	= {(nl+11),	(nl+24),	-(nl+35),  -(nl+23)};
	
	Curve Loop(ncl+22)	= {-(nl-9),	(nl+41),	(nl+35),   (nl+36)};
	Curve Loop(ncl+23)	= {-(nl-10), -(nl-11), -(nl-12),	(nl+44),	(nl+32),  -(nl+41)};
//	Curve Loop(ncl+24)	= {-(nl-11),	(nl+43),	(nl+33),  -(nl+42)};
//	Curve Loop(ncl+25)	= {-(nl-12),	(nl+44),	(nl+32),  -(nl+43)};
	Curve Loop(ncl+26)	= {-(nl-13),	(nl+30),	(nl+31),  -(nl+44)};
	
	Plane Surface(nps+1)	= {ncl+1};
	Plane Surface(nps+2)	= {ncl+2};
//	Plane Surface(nps+3)	= {ncl+3};
//	Plane Surface(nps+4)	= {ncl+4};
	Plane Surface(nps+5)	= {ncl+5};
	 				
	Plane Surface(nps+6)	= {ncl+6};
	Plane Surface(nps+7)	= {ncl+7};
//	Plane Surface(nps+8)	= {ncl+8};
//	Plane Surface(nps+9)	= {ncl+9};
	Plane Surface(nps+10)	= {ncl+10};
	Plane Surface(nps+11)	= {ncl+11};
	 				
//	Plane Surface(nps+12)	= {ncl+12};
//	Plane Surface(nps+13)	= {ncl+13};
//	Plane Surface(nps+14)	= {ncl+14};
//	Plane Surface(nps+15)	= {ncl+15};
//	Plane Surface(nps+16)	= {ncl+16};
	 				
	Plane Surface(nps+17)	= {ncl+17};
	Plane Surface(nps+18)	= {ncl+18};
//	Plane Surface(nps+19)	= {ncl+19};
//	Plane Surface(nps+20)	= {ncl+20};
	Plane Surface(nps+21)	= {ncl+21};
	 			
	Plane Surface(nps+22)	= {ncl+22};
	Plane Surface(nps+23)	= {ncl+23};
//	Plane Surface(nps+24)	= {ncl+24};
//	Plane Surface(nps+25)	= {ncl+25};
	Plane Surface(nps+26)	= {ncl+26};
	 
	Surface Loop(nsl +1) = {nps+1,	 nps+6,	 nps+7,	 nps-5, nps+21, nps+22};
	Surface Loop(nsl +2) = {nps+2,	 nps+7,	 nps+10, nps-6, nps-7, nps-8, nps+18, nps+23};
//	Surface Loop(nsl +3) = {nps+3,	 nps+8,	 nps+9,	 nps-7, nps+19, nps+24};
//	Surface Loop(nsl +4) = {nps+4,	 nps+9,	 nps+10, nps-8, nps+18, nps+25};
	Surface Loop(nsl +5) = {nps+5,	 nps+10, nps+11, nps-9, nps+17, nps+26};

	Volume(nv+1) = {nsl +1};
	Volume(nv+2) = {nsl +2};
//	Volume(nv+3) = {nsl +3};
//	Volume(nv+4) = {nsl +4};
	Volume(nv+5) = {nsl +5};
	
	Physical Volume("region_pre_quantum_C_dop_left", nv+1) = {nv +1};
//	Physical Volume("region_pre_quantum_C_left", nv+2) = {nv +2};
	Physical Volume("region_pre_quantum_C_mid", nv+3) = {nv +2};
//	Physical Volume("region_pre_quantum_C_right", nv+4) = {nv +4};
	Physical Volume("region_pre_quantum_C_dop_right", nv+5) = {nv +5};
	Color{169, 188, 208}{ Physical Volume{ nv+1:nv+5}; }

	np = np + 24;
	nl = nl + 44;
	ncl = ncl + 26;
	nps = nps + 26;
	nsl = nsl + 5;
	nv = nv +5;

//-------------------------------------------------------------------------------------------------------------------	
// Quantum layer A

	Point(np+13) 	= {region_pre_quantum_A_dop_left_x_min, 	region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z,	grid_spacing_01}; 
	Point(np+14) 	= {region_pre_quantum_A_dop_left_x_max, 	region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
//	Point(np+15) 	= {region_pre_quantum_A_left_x_max, 		region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
//	Point(np+16) 	= {region_pre_quantum_A_mid_x_max, 			region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+17) 	= {region_pre_quantum_A_right_x_max, 		region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+18) 	= {region_pre_quantum_A_dop_right_x_max, 	region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+19) 	= {region_pre_quantum_A_dop_right_x_max, 	region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+20) 	= {region_pre_quantum_A_dop_right_x_min, 	region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+21) 	= {region_pre_quantum_A_right_x_min, 		region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+22) 	= {region_pre_quantum_A_mid_x_min, 			region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+23) 	= {region_pre_quantum_A_left_x_min, 		region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+24) 	= {region_pre_quantum_A_dop_left_x_min, 	region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	
	Line(nl+13) = {np-59, 	np+13};
	Line(nl+14) = {np-58, 	np+14};
//	Line(nl+15) = {np-57, 	np+15};
//	Line(nl+16) = {np-56, 	np+16};
	Line(nl+17) = {np-55, 	np+17};
	Line(nl+18) = {np-54, 	np+18};
	Line(nl+19) = {np-53, 	np+19};
	Line(nl+20) = {np-52, 	np+20};
	Line(nl+21) = {np-51, 	np+21};
	Line(nl+22) = {np-50, 	np+22};
	Line(nl+23) = {np-49, 	np+23};
	Line(nl+24) = {np-48, 	np+24};
	
	Line(nl+25) = {np+13,	np+14};
	Line(nl+26) = {np+14,	np+17};
//	Line(nl+27) = {np+15,	np+16};
//	Line(nl+28) = {np+16,	np+17};
	Line(nl+29) = {np+17,	np+18};
	Line(nl+30) = {np+18,	np+19};
	Line(nl+31) = {np+19,	np+20};
	Line(nl+32) = {np+20,	np+21};
	Line(nl+33) = {np+21,	np+22};
	Line(nl+34) = {np+22,	np+23};
	Line(nl+35) = {np+23,	np+24};
	Line(nl+36) = {np+24,	np+13};
	
	Line(nl+41) = {np+14,	np+23};
//	Line(nl+42) = {np+15,	np+22};
//	Line(nl+43) = {np+16,	np+21};
	Line(nl+44) = {np+17,	np+20};
	
	Curve Loop(ncl+6)	= {(nl-96), (nl+13), -(nl+36), -(nl+24)};
	Curve Loop(ncl+7)	= {-(nl-91), (nl+14), (nl+41), -(nl+23)};
//	Curve Loop(ncl+8)	= {-(nl-90), (nl+15), (nl+42), -(nl+22)};
//	Curve Loop(ncl+9)	= {-(nl-89), (nl+16), (nl+43), -(nl+21)};
	Curve Loop(ncl+10)	= {-(nl-88), (nl+17), (nl+44), -(nl+20)};
	Curve Loop(ncl+11)	= {-(nl-102), (nl+18), (nl+30), -(nl+19)};
	
	Curve Loop(ncl+12)	= {(nl-107),	(nl+14),	-(nl+25),  -(nl+13)};
	Curve Loop(ncl+13)	= {(nl-106),	(nl+17),	-(nl+26),  -(nl+14)};
//	Curve Loop(ncl+14)	= {(nl-105),	(nl+16),	-(nl+27),  -(nl+15)};
//	Curve Loop(ncl+15)	= {(nl-104),	(nl+17),	-(nl+28),  -(nl+16)};
	Curve Loop(ncl+16)	= {(nl-103),	(nl+18),	-(nl+29),  -(nl+17)};
	
	Curve Loop(ncl+17)	= {(nl-101),	(nl+20),	-(nl+31),  -(nl+19)};
	Curve Loop(ncl+18)	= {(nl-100),	(nl+21),	-(nl+32),  -(nl+20)};
	Curve Loop(ncl+19)	= {(nl-99),		(nl+22),	-(nl+33),  -(nl+21)};
	Curve Loop(ncl+20)	= {(nl-98),		(nl+23),	-(nl+34),  -(nl+22)};
	Curve Loop(ncl+21)	= {(nl-97),		(nl+24),	-(nl+35),  -(nl+23)};
	
	Curve Loop(ncl+22)	= {(nl+25),	(nl+41),	(nl+35),   (nl+36)};
	Curve Loop(ncl+23)	= {(nl+26),	(nl+44),	(nl+32), nl+33, nl+34,  -(nl+41)};
//	Curve Loop(ncl+24)	= {(nl+27),	(nl+43),	(nl+33),  -(nl+42)};
//	Curve Loop(ncl+25)	= {(nl+28),	(nl+44),	(nl+32),  -(nl+43)};
	Curve Loop(ncl+26)	= {(nl+29),	(nl+30),	(nl+31),  -(nl+44)};
					
	Plane Surface(nps+6)	= {ncl+6};
	Plane Surface(nps+7)	= {ncl+7};
//	Plane Surface(nps+8)	= {ncl+8};
//	Plane Surface(nps+9)	= {ncl+9};
	Plane Surface(nps+10)	= {ncl+10};
	Plane Surface(nps+11)	= {ncl+11};
	 				
	Plane Surface(nps+12)	= {ncl+12};
	Plane Surface(nps+13)	= {ncl+13};
//	Plane Surface(nps+14)	= {ncl+14};
//	Plane Surface(nps+15)	= {ncl+15};
	Plane Surface(nps+16)	= {ncl+16};
				
	Plane Surface(nps+17)	= {ncl+17};
	Plane Surface(nps+18)	= {ncl+18};
	Plane Surface(nps+19)	= {ncl+19};
	Plane Surface(nps+20)	= {ncl+20};
	Plane Surface(nps+21)	= {ncl+21};
			
	Plane Surface(nps+22)	= {ncl+22};
	Plane Surface(nps+23)	= {ncl+23};
//	Plane Surface(nps+24)	= {ncl+24};
//	Plane Surface(nps+25)	= {ncl+25};
	Plane Surface(nps+26)	= {ncl+26};


	Surface Loop(nsl +1) = {nps-56,	 nps+6,	 nps+7,	 nps+12, nps+21, nps+22};
	Surface Loop(nsl +2) = {nps-55,	 nps+7,	 nps+10, nps+13, nps+20, nps+19, nps+18, nps+23};
//	Surface Loop(nsl +3) = {nps-54,	 nps+8,	 nps+9,	 nps+14, nps+19, nps+24};
//	Surface Loop(nsl +4) = {nps-53,	 nps+9,	 nps+10, nps+15, nps+18, nps+25};
	Surface Loop(nsl +5) = {nps-52,	 nps+10, nps+11, nps+16, nps+17, nps+26};

	Volume(nv+1) = {nsl +1};
	Volume(nv+2) = {nsl +2};
//	Volume(nv+3) = {nsl +3};
//	Volume(nv+4) = {nsl +4};
	Volume(nv+5) = {nsl +5};
	
	Physical Volume("region_quantum_A_dop_left", nv+1) = {nv +1};
//	Physical Volume("region_quantum_A_left", nv+2) = {nv +2};
	Physical Volume("region_quantum_A_mid", nv+3) = {nv +2};
//	Physical Volume("region_quantum_A_right", nv+4) = {nv +4};
	Physical Volume("region_quantum_A_dop_right", nv+5) = {nv +5};
	Color{88, 164, 176}{ Physical Volume{ nv+1:nv+5}; }

	np = np + 24;
	nl = nl + 44;
	ncl = ncl + 26;
	nps = nps + 26;
	nsl = nsl + 5;
	nv = nv +5;
	
//-------------------------------------------------------------------------------------------------------------------	
// Quantum layer B

	Point(np+19) 	= {region_pre_quantum_B_dop_right_x_max, 	region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+20) 	= {region_pre_quantum_B_dop_right_x_min, 	region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+21) 	= {region_pre_quantum_B_right_x_min, 		region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+22) 	= {region_pre_quantum_B_mid_x_min, 			region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+23) 	= {region_pre_quantum_B_left_x_min, 		region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+24) 	= {region_pre_quantum_B_dop_left_x_min, 	region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_B_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	
	Line(nl+19) = {np-53, 	np+19};
	Line(nl+20) = {np-52, 	np+20};
	Line(nl+21) = {np-51, 	np+21};
	Line(nl+22) = {np-50, 	np+22};
	Line(nl+23) = {np-49, 	np+23};
	Line(nl+24) = {np-48, 	np+24};
	
	Line(nl+30) = {np-5,	np+19};
	Line(nl+31) = {np+19,	np+20};
	Line(nl+32) = {np+20,	np+21};
	Line(nl+33) = {np+21,	np+22};
	Line(nl+34) = {np+22,	np+23};
	Line(nl+35) = {np+23,	np+24};
	Line(nl+36) = {np+24,	np};
	
	Line(nl+41) = {np-1,	np+23};
	Line(nl+42) = {np-2,	np+22};
	Line(nl+43) = {np-3,	np+21};
	Line(nl+44) = {np-4,	np+20};
	
	Curve Loop(ncl+6)	= {(nl-96), 	(nl-20), -(nl+36), -(nl+24)};
	Curve Loop(ncl+7)	= {-(nl-91), 	(nl-21), (nl+41), -(nl+23)};
	Curve Loop(ncl+8)	= {-(nl-90), 	(nl-22), (nl+42), -(nl+22)};
	Curve Loop(ncl+9)	= {-(nl-89), 	(nl-23), (nl+43), -(nl+21)};
	Curve Loop(ncl+10)	= {-(nl-88), 	(nl-24), (nl+44), -(nl+20)};
	Curve Loop(ncl+11)	= {-(nl-102), 	(nl-25), (nl+30), -(nl+19)};
	
	Curve Loop(ncl+17)	= {(nl-101),	(nl+20),	-(nl+31),  -(nl+19)};
	Curve Loop(ncl+18)	= {(nl-100),	(nl+21),	-(nl+32),  -(nl+20)};
	Curve Loop(ncl+19)	= {(nl-99),		(nl+22),	-(nl+33),  -(nl+21)};
	Curve Loop(ncl+20)	= {(nl-98),		(nl+23),	-(nl+34),  -(nl+22)};
	Curve Loop(ncl+21)	= {(nl-97),		(nl+24),	-(nl+35),  -(nl+23)};
	
	Curve Loop(ncl+22)	= {-(nl-9),	(nl+41),	(nl+35),   (nl+36)};
	Curve Loop(ncl+23)	= {-(nl-10),	(nl+42),	(nl+34),  -(nl+41)};
	Curve Loop(ncl+24)	= {-(nl-11),	(nl+43),	(nl+33),  -(nl+42)};
	Curve Loop(ncl+25)	= {-(nl-12),	(nl+44),	(nl+32),  -(nl+43)};
	Curve Loop(ncl+26)	= {-(nl-13),	(nl+30),	(nl+31),  -(nl+44)};
					
	Surface(nps+6)	= {ncl+6};
	Surface(nps+7)	= {ncl+7};
	Surface(nps+8)	= {ncl+8};
	Surface(nps+9)	= {ncl+9};
	Surface(nps+10)	= {ncl+10};
	Surface(nps+11)	= {ncl+11};
					
	Surface(nps+17)	= {ncl+17};
	Surface(nps+18)	= {ncl+18};
	Surface(nps+19)	= {ncl+19};
	Surface(nps+20)	= {ncl+20};
	Surface(nps+21)	= {ncl+21};
				
	Surface(nps+22)	= {ncl+22};
	Surface(nps+23)	= {ncl+23};
	Surface(nps+24)	= {ncl+24};
	Surface(nps+25)	= {ncl+25};
	Surface(nps+26)	= {ncl+26};

	Surface Loop(nsl +1) = {nps-56,	 nps+6,	 nps+7,	 nps-5, nps+21, nps+22};
	Surface Loop(nsl +2) = {nps-55,	 nps+7,	 nps+8,	 nps-6, nps+20, nps+23};
	Surface Loop(nsl +3) = {nps-54,	 nps+8,	 nps+9,	 nps-7, nps+19, nps+24};
	Surface Loop(nsl +4) = {nps-53,	 nps+9,	 nps+10, nps-8, nps+18, nps+25};
	Surface Loop(nsl +5) = {nps-52,	 nps+10, nps+11, nps-9, nps+17, nps+26};

	Volume(nv+1) = {nsl +1};
	Volume(nv+2) = {nsl +2};
	Volume(nv+3) = {nsl +3};
	Volume(nv+4) = {nsl +4};
	Volume(nv+5) = {nsl +5};
	
	Physical Volume("region_quantum_B_dop_left", nv+1) = {nv +1};
	Physical Volume("region_quantum_B_left", nv+2) = {nv +2};
	Physical Volume("region_quantum_B_mid", nv+3) = {nv +3};
	Physical Volume("region_quantum_B_right", nv+4) = {nv +4};
	Physical Volume("region_quantum_B_dop_right", nv+5) = {nv +5};
	Color{88, 164, 176}{ Physical Volume{ nv+1:nv+5}; }

	np = np + 24;
	nl = nl + 44;
	ncl = ncl + 26;
	nps = nps + 26;
	nsl = nsl + 5;
	nv = nv +5;
	
//-------------------------------------------------------------------------------------------------------------------	
// Quantum layer C

	Point(np+19) 	= {region_pre_quantum_C_dop_right_x_max, 	region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+20) 	= {region_pre_quantum_C_dop_right_x_min, 	region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
//	Point(np+21) 	= {region_pre_quantum_C_right_x_min, 		region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
//	Point(np+22) 	= {region_pre_quantum_C_mid_x_min, 			region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+23) 	= {region_pre_quantum_C_left_x_min, 		region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	Point(np+24) 	= {region_pre_quantum_C_dop_left_x_min, 	region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_C_dop_left_z_max + quantum_layer_z,	grid_spacing_01};
	
	Line(nl+19) = {np-53, 	np+19};
	Line(nl+20) = {np-52, 	np+20};
//	Line(nl+21) = {np-51, 	np+21};
//	Line(nl+22) = {np-50, 	np+22};
	Line(nl+23) = {np-49, 	np+23};
	Line(nl+24) = {np-48, 	np+24};
	
	Line(nl+30) = {np-5,	np+19};
	Line(nl+31) = {np+19,	np+20};
	Line(nl+32) = {np+20,	np+23};
//	Line(nl+33) = {np+21,	np+22};
//	Line(nl+34) = {np+22,	np+23};
	Line(nl+35) = {np+23,	np+24};
	Line(nl+36) = {np+24,	np};
	
	Line(nl+41) = {np-1,	np+23};
//	Line(nl+42) = {np-2,	np+22};
//	Line(nl+43) = {np-3,	np+21};
	Line(nl+44) = {np-4,	np+20};
	
	Curve Loop(ncl+6)	= {(nl-96), 	(nl-20), -(nl+36), -(nl+24)};
	Curve Loop(ncl+7)	= {-(nl-91), 	(nl-21), (nl+41), -(nl+23)};
//	Curve Loop(ncl+8)	= {-(nl-90), 	(nl-22), (nl+42), -(nl+22)};
//	Curve Loop(ncl+9)	= {-(nl-89), 	(nl-23), (nl+43), -(nl+21)};
	Curve Loop(ncl+10)	= {-(nl-88), 	(nl-24), (nl+44), -(nl+20)};
	Curve Loop(ncl+11)	= {-(nl-102), 	(nl-25), (nl+30), -(nl+19)};
	
	Curve Loop(ncl+17)	= {(nl-101),	(nl+20),	-(nl+31),  -(nl+19)};
	Curve Loop(ncl+18)	= {(nl-100),	(nl+23),	-(nl+32),  -(nl+20)};
//	Curve Loop(ncl+19)	= {(nl-99),		(nl+22),	-(nl+33),  -(nl+21)};
//	Curve Loop(ncl+20)	= {(nl-98),		(nl+23),	-(nl+34),  -(nl+22)};
	Curve Loop(ncl+21)	= {(nl-97),		(nl+24),	-(nl+35),  -(nl+23)};
	
	Curve Loop(ncl+22)	= {-(nl-9),	(nl+41),	(nl+35),   (nl+36)};
	Curve Loop(ncl+23)	= {-(nl-10), -(nl-11), -(nl-12),	(nl+44),	(nl+32),  -(nl+41)};
//	Curve Loop(ncl+24)	= {-(nl-11),	(nl+43),	(nl+33),  -(nl+42)};
//	Curve Loop(ncl+25)	= {-(nl-12),	(nl+44),	(nl+32),  -(nl+43)};
	Curve Loop(ncl+26)	= {-(nl-13),	(nl+30),	(nl+31),  -(nl+44)};
					
	Plane Surface(nps+6)	= {ncl+6};
	Plane Surface(nps+7)	= {ncl+7};
//	Plane Surface(nps+8)	= {ncl+8};
//	Plane Surface(nps+9)	= {ncl+9};
	Plane Surface(nps+10)	= {ncl+10};
	Plane Surface(nps+11)	= {ncl+11};
 				
	Plane Surface(nps+17)	= {ncl+17};
	Plane Surface(nps+18)	= {ncl+18};
//	Plane Surface(nps+19)	= {ncl+19};
//	Plane Surface(nps+20)	= {ncl+20};
	Plane Surface(nps+21)	= {ncl+21};
 			
	Plane Surface(nps+22)	= {ncl+22};
	Plane Surface(nps+23)	= {ncl+23};
//	Plane Surface(nps+24)	= {ncl+24};
//	Plane Surface(nps+25)	= {ncl+25};
	Plane Surface(nps+26)	= {ncl+26};

	Surface Loop(nsl +1) = {nps-56,	 nps+6,	 nps+7,	 nps-5, nps+21, nps+22};
	Surface Loop(nsl +2) = {nps-55,	 nps+7,	 nps+10, nps-6, nps-7, nps-8, nps+18, nps+23};
//	Surface Loop(nsl +3) = {nps-54,	 nps+8,	 nps+9,	 nps-7, nps+19, nps+24};
//	Surface Loop(nsl +4) = {nps-53,	 nps+9,	 nps+10, nps-8, nps+18, nps+25};
	Surface Loop(nsl +5) = {nps-52,	 nps+10, nps+11, nps-9, nps+17, nps+26};

	Volume(nv+1) = {nsl +1};
	Volume(nv+2) = {nsl +2};
//	Volume(nv+3) = {nsl +3};
//	Volume(nv+4) = {nsl +4};
	Volume(nv+5) = {nsl +5};
	
	Physical Volume("region_quantum_C_dop_left", nv+1) = {nv +1};
//	Physical Volume("region_quantum_C_left", nv+2) = {nv +2};
	Physical Volume("region_quantum_C_mid", nv+3) = {nv +2};
//	Physical Volume("region_quantum_C_right", nv+4) = {nv +4};
	Physical Volume("region_quantum_C_dop_right", nv+5) = {nv +5};
	Color{88, 164, 176}{ Physical Volume{ nv+1:nv+5}; }

	np = np + 24;
	nl = nl + 44;
	ncl = ncl + 26;
	nps = nps + 26;
	nsl = nsl + 5;
	nv = nv +5;
	
//-------------------------------------------------------------------------------------------------------------------	
// Post-Quantum layer A

	Point(np+13) 	= {region_pre_quantum_A_dop_left_x_min, 	region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02}; 
	Point(np+14) 	= {region_pre_quantum_A_dop_left_x_max, 	region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
//	Point(np+15) 	= {region_pre_quantum_A_left_x_max, 		region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
//	Point(np+16) 	= {region_pre_quantum_A_mid_x_max, 			region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+17) 	= {region_pre_quantum_A_right_x_max, 		region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+18) 	= {region_pre_quantum_A_dop_right_x_max, 	region_pre_quantum_A_dop_left_y_min, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+19) 	= {region_pre_quantum_A_dop_right_x_max, 	region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+20) 	= {region_pre_quantum_A_dop_right_x_min, 	region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+21) 	= {region_pre_quantum_A_right_x_min, 		region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+22) 	= {region_pre_quantum_A_mid_x_min, 			region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+23) 	= {region_pre_quantum_A_left_x_min, 		region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+24) 	= {region_pre_quantum_A_dop_left_x_min, 	region_pre_quantum_A_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	
	Line(nl+13) = {np-59, 	np+13};
	Line(nl+14) = {np-58, 	np+14};
//	Line(nl+15) = {np-57, 	np+15};
//	Line(nl+16) = {np-56, 	np+16};
	Line(nl+17) = {np-55, 	np+17};
	Line(nl+18) = {np-54, 	np+18};
	Line(nl+19) = {np-53, 	np+19};
	Line(nl+20) = {np-52, 	np+20};
	Line(nl+21) = {np-51, 	np+21};
	Line(nl+22) = {np-50, 	np+22};
	Line(nl+23) = {np-49, 	np+23};
	Line(nl+24) = {np-48, 	np+24};
	
	Line(nl+25) = {np+13,	np+14};
	Line(nl+26) = {np+14,	np+17};
//	Line(nl+27) = {np+15,	np+16};
//	Line(nl+28) = {np+16,	np+17};
	Line(nl+29) = {np+17,	np+18};
	Line(nl+30) = {np+18,	np+19};
	Line(nl+31) = {np+19,	np+20};
	Line(nl+32) = {np+20,	np+21};
	Line(nl+33) = {np+21,	np+22};
	Line(nl+34) = {np+22,	np+23};
	Line(nl+35) = {np+23,	np+24};
	Line(nl+36) = {np+24,	np+13};
	
	Line(nl+41) = {np+14,	np+23};
//	Line(nl+42) = {np+15,	np+22};
//	Line(nl+43) = {np+16,	np+21};
	Line(nl+44) = {np+17,	np+20};
	
	Curve Loop(ncl+6)	= {(nl-96), (nl+13), -(nl+36), -(nl+24)};
	Curve Loop(ncl+7)	= {-(nl-91), (nl+14), (nl+41), -(nl+23)};
//	Curve Loop(ncl+8)	= {-(nl-90), (nl+15), (nl+42), -(nl+22)};
//	Curve Loop(ncl+9)	= {-(nl-89), (nl+16), (nl+43), -(nl+21)};
	Curve Loop(ncl+10)	= {-(nl-88), (nl+17), (nl+44), -(nl+20)};
	Curve Loop(ncl+11)	= {-(nl-102), (nl+18), (nl+30), -(nl+19)};
	
	Curve Loop(ncl+12)	= {(nl-107),	(nl+14),	-(nl+25),  -(nl+13)};
	Curve Loop(ncl+13)	= {(nl-106),	(nl+17),	-(nl+26),  -(nl+14)};
//	Curve Loop(ncl+14)	= {(nl-105),	(nl+16),	-(nl+27),  -(nl+15)};
//	Curve Loop(ncl+15)	= {(nl-104),	(nl+17),	-(nl+28),  -(nl+16)};
	Curve Loop(ncl+16)	= {(nl-103),	(nl+18),	-(nl+29),  -(nl+17)};
	
	Curve Loop(ncl+17)	= {(nl-101),	(nl+20),	-(nl+31),  -(nl+19)};
	Curve Loop(ncl+18)	= {(nl-100),	(nl+21),	-(nl+32),  -(nl+20)};
	Curve Loop(ncl+19)	= {(nl-99),		(nl+22),	-(nl+33),  -(nl+21)};
	Curve Loop(ncl+20)	= {(nl-98),		(nl+23),	-(nl+34),  -(nl+22)};
	Curve Loop(ncl+21)	= {(nl-97),		(nl+24),	-(nl+35),  -(nl+23)};
	
	Curve Loop(ncl+22)	= {(nl+25),	(nl+41),	(nl+35),   (nl+36)};
	Curve Loop(ncl+23)	= {(nl+26),	(nl+44),	(nl+32), nl+33, nl+34,  -(nl+41)};
//	Curve Loop(ncl+24)	= {(nl+27),	(nl+43),	(nl+33),  -(nl+42)};
//	Curve Loop(ncl+25)	= {(nl+28),	(nl+44),	(nl+32),  -(nl+43)};
	Curve Loop(ncl+26)	= {(nl+29),	(nl+30),	(nl+31),  -(nl+44)};
					
	Plane Surface(nps+6)	= {ncl+6};
	Plane Surface(nps+7)	= {ncl+7};
//	Plane Surface(nps+8)	= {ncl+8};
//	Plane Surface(nps+9)	= {ncl+9};
	Plane Surface(nps+10)	= {ncl+10};
	Plane Surface(nps+11)	= {ncl+11};
	 				
	Plane Surface(nps+12)	= {ncl+12};
	Plane Surface(nps+13)	= {ncl+13};
//	Plane Surface(nps+14)	= {ncl+14};
//	Plane Surface(nps+15)	= {ncl+15};
	Plane Surface(nps+16)	= {ncl+16};
				
	Plane Surface(nps+17)	= {ncl+17};
	Plane Surface(nps+18)	= {ncl+18};
	Plane Surface(nps+19)	= {ncl+19};
	Plane Surface(nps+20)	= {ncl+20};
	Plane Surface(nps+21)	= {ncl+21};
			
	Plane Surface(nps+22)	= {ncl+22};
	Plane Surface(nps+23)	= {ncl+23};
//	Plane Surface(nps+24)	= {ncl+24};
//	Plane Surface(nps+25)	= {ncl+25};
	Plane Surface(nps+26)	= {ncl+26};

	Surface Loop(nsl +1) = {nps-56,	 nps+6,	 nps+7,	 nps+12, nps+21, nps+22};
	Surface Loop(nsl +2) = {nps-55,	 nps+7,	 nps+10, nps+13, nps+20, nps+19, nps+18, nps+23};
//	Surface Loop(nsl +3) = {nps-54,	 nps+8,	 nps+9,	 nps+14, nps+19, nps+24};
//	Surface Loop(nsl +4) = {nps-53,	 nps+9,	 nps+10, nps+15, nps+18, nps+25};
	Surface Loop(nsl +5) = {nps-52,	 nps+10, nps+11, nps+16, nps+17, nps+26};

	Volume(nv+1) = {nsl +1};
	Volume(nv+2) = {nsl +2};
//	Volume(nv+3) = {nsl +3};
//	Volume(nv+4) = {nsl +4};
	Volume(nv+5) = {nsl +5};
	
	Physical Volume("region_post_quantum_A_dop_left", nv+1) = {nv +1};
//	Physical Volume("region_post_quantum_A_left", nv+2) = {nv +2};
	Physical Volume("region_post_quantum_A_mid", nv+3) = {nv +2};
//	Physical Volume("region_post_quantum_A_right", nv+4) = {nv +4};
	Physical Volume("region_post_quantum_A_dop_right", nv+5) = {nv +5};
	Color{216, 219, 226}{ Physical Volume{ nv+3}; }
	Color{169, 188, 208}{ Physical Volume{ nv+1, nv+5}; }

	np = np + 24;
	nl = nl + 44;
	ncl = ncl + 26;
	nps = nps + 26;
	nsl = nsl + 5;
	nv = nv +5;
	
//-------------------------------------------------------------------------------------------------------------------	
// Post-Quantum layer B

	Point(np+19) 	= {region_pre_quantum_B_dop_right_x_max, 	region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+20) 	= {region_pre_quantum_B_dop_right_x_min, 	region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+21) 	= {region_pre_quantum_B_right_x_min, 		region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+22) 	= {region_pre_quantum_B_mid_x_min, 			region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+23) 	= {region_pre_quantum_B_left_x_min, 		region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+24) 	= {region_pre_quantum_B_dop_left_x_min, 	region_pre_quantum_B_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	
	Line(nl+19) = {np-53, 	np+19};
	Line(nl+20) = {np-52, 	np+20};
	Line(nl+21) = {np-51, 	np+21};
	Line(nl+22) = {np-50, 	np+22};
	Line(nl+23) = {np-49, 	np+23};
	Line(nl+24) = {np-48, 	np+24};
	
	Line(nl+30) = {np-5,	np+19};
	Line(nl+31) = {np+19,	np+20};
	Line(nl+32) = {np+20,	np+21};
	Line(nl+33) = {np+21,	np+22};
	Line(nl+34) = {np+22,	np+23};
	Line(nl+35) = {np+23,	np+24};
	Line(nl+36) = {np+24,	np};
	
	Line(nl+41) = {np-1,	np+23};
	Line(nl+42) = {np-2,	np+22};
	Line(nl+43) = {np-3,	np+21};
	Line(nl+44) = {np-4,	np+20};
	
	Curve Loop(ncl+6)	= {(nl-96), 	(nl-20), -(nl+36), -(nl+24)};
	Curve Loop(ncl+7)	= {-(nl-91), 	(nl-21), (nl+41), -(nl+23)};
	Curve Loop(ncl+8)	= {-(nl-90), 	(nl-22), (nl+42), -(nl+22)};
	Curve Loop(ncl+9)	= {-(nl-89), 	(nl-23), (nl+43), -(nl+21)};
	Curve Loop(ncl+10)	= {-(nl-88), 	(nl-24), (nl+44), -(nl+20)};
	Curve Loop(ncl+11)	= {-(nl-102), 	(nl-25), (nl+30), -(nl+19)};
	
	Curve Loop(ncl+17)	= {(nl-101),	(nl+20),	-(nl+31),  -(nl+19)};
	Curve Loop(ncl+18)	= {(nl-100),	(nl+21),	-(nl+32),  -(nl+20)};
	Curve Loop(ncl+19)	= {(nl-99),		(nl+22),	-(nl+33),  -(nl+21)};
	Curve Loop(ncl+20)	= {(nl-98),		(nl+23),	-(nl+34),  -(nl+22)};
	Curve Loop(ncl+21)	= {(nl-97),		(nl+24),	-(nl+35),  -(nl+23)};
	
	Curve Loop(ncl+22)	= {-(nl-9),	(nl+41),	(nl+35),   (nl+36)};
	Curve Loop(ncl+23)	= {-(nl-10),	(nl+42),	(nl+34),  -(nl+41)};
	Curve Loop(ncl+24)	= {-(nl-11),	(nl+43),	(nl+33),  -(nl+42)};
	Curve Loop(ncl+25)	= {-(nl-12),	(nl+44),	(nl+32),  -(nl+43)};
	Curve Loop(ncl+26)	= {-(nl-13),	(nl+30),	(nl+31),  -(nl+44)};
					
	Plane Surface(nps+6)	= {ncl+6};
	Plane Surface(nps+7)	= {ncl+7};
	Plane Surface(nps+8)	= {ncl+8};
	Plane Surface(nps+9)	= {ncl+9};
	Plane Surface(nps+10)	= {ncl+10};
	Plane Surface(nps+11)	= {ncl+11};
 				
	Plane Surface(nps+17)	= {ncl+17};
	Plane Surface(nps+18)	= {ncl+18};
	Plane Surface(nps+19)	= {ncl+19};
	Plane Surface(nps+20)	= {ncl+20};
	Plane Surface(nps+21)	= {ncl+21};
			
	Plane Surface(nps+22)	= {ncl+22};
	Plane Surface(nps+23)	= {ncl+23};
	Plane Surface(nps+24)	= {ncl+24};
	Plane Surface(nps+25)	= {ncl+25};
	Plane Surface(nps+26)	= {ncl+26};

	Surface Loop(nsl +1) = {nps-56,	 nps+6,	 nps+7,	 nps-5, nps+21, nps+22};
	Surface Loop(nsl +2) = {nps-55,	 nps+7,	 nps+8,	 nps-6, nps+20, nps+23};
	Surface Loop(nsl +3) = {nps-54,	 nps+8,	 nps+9,	 nps-7, nps+19, nps+24};
	Surface Loop(nsl +4) = {nps-53,	 nps+9,	 nps+10, nps-8, nps+18, nps+25};
	Surface Loop(nsl +5) = {nps-52,	 nps+10, nps+11, nps-9, nps+17, nps+26};

	Volume(nv+1) = {nsl +1};
	Volume(nv+2) = {nsl +2};
	Volume(nv+3) = {nsl +3};
	Volume(nv+4) = {nsl +4};
	Volume(nv+5) = {nsl +5};
	
	Physical Volume("region_post_quantum_B_dop_left", nv+1) = {nv +1};
	Physical Volume("region_post_quantum_B_left", nv+2) = {nv +2};
	Physical Volume("region_post_quantum_B_mid", nv+3) = {nv +3};
	Physical Volume("region_post_quantum_B_right", nv+4) = {nv +4};
	Physical Volume("region_post_quantum_B_dop_right", nv+5) = {nv +5};
	Color{216, 219, 226}{ Physical Volume{ nv+1:nv+5}; }

	np = np + 24;
	nl = nl + 44;
	ncl = ncl + 26;
	nps = nps + 26;
	nsl = nsl + 5;
	nv = nv +5;
	
//-------------------------------------------------------------------------------------------------------------------	
// Post-Quantum layer C

	Point(np+19) 	= {region_pre_quantum_C_dop_right_x_max, 	region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+20) 	= {region_pre_quantum_C_dop_right_x_min, 	region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
//	Point(np+21) 	= {region_pre_quantum_C_right_x_min, 		region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
//	Point(np+22) 	= {region_pre_quantum_C_mid_x_min, 			region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+23) 	= {region_pre_quantum_C_left_x_min, 		region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	Point(np+24) 	= {region_pre_quantum_C_dop_left_x_min, 	region_pre_quantum_C_dop_left_y_max, 	region_pre_quantum_A_dop_left_z_max + quantum_layer_z + post_quantum_z,	grid_spacing_02};
	
	Line(nl+19) = {np-53, 	np+19};
	Line(nl+20) = {np-52, 	np+20};
//	Line(nl+21) = {np-51, 	np+21};
//	Line(nl+22) = {np-50, 	np+22};
	Line(nl+23) = {np-49, 	np+23};
	Line(nl+24) = {np-48, 	np+24};
	
	Line(nl+30) = {np-5,	np+19};
	Line(nl+31) = {np+19,	np+20};
	Line(nl+32) = {np+20,	np+23};
//	Line(nl+33) = {np+21,	np+22};
//	Line(nl+34) = {np+22,	np+23};
	Line(nl+35) = {np+23,	np+24};
	Line(nl+36) = {np+24,	np};
	
	Line(nl+41) = {np-1,	np+23};
//	Line(nl+42) = {np-2,	np+22};
//	Line(nl+43) = {np-3,	np+21};
	Line(nl+44) = {np-4,	np+20};
	
	Curve Loop(ncl+6)	= {(nl-96), 	(nl-20), -(nl+36), -(nl+24)};
	Curve Loop(ncl+7)	= {-(nl-91), 	(nl-21), (nl+41), -(nl+23)};
//	Curve Loop(ncl+8)	= {-(nl-90), 	(nl-22), (nl+42), -(nl+22)};
//	Curve Loop(ncl+9)	= {-(nl-89), 	(nl-23), (nl+43), -(nl+21)};
	Curve Loop(ncl+10)	= {-(nl-88), 	(nl-24), (nl+44), -(nl+20)};
	Curve Loop(ncl+11)	= {-(nl-102), 	(nl-25), (nl+30), -(nl+19)};
	
	Curve Loop(ncl+17)	= {(nl-101),	(nl+20),	-(nl+31),  -(nl+19)};
	Curve Loop(ncl+18)	= {(nl-100),	(nl+23),	-(nl+32),  -(nl+20)};
//	Curve Loop(ncl+19)	= {(nl-99),		(nl+22),	-(nl+33),  -(nl+21)};
//	Curve Loop(ncl+20)	= {(nl-98),		(nl+23),	-(nl+34),  -(nl+22)};
	Curve Loop(ncl+21)	= {(nl-97),		(nl+24),	-(nl+35),  -(nl+23)};
	
	Curve Loop(ncl+22)	= {-(nl-9),	(nl+41),	(nl+35),   (nl+36)};
	Curve Loop(ncl+23)	= {-(nl-10), -(nl-11), -(nl-12),	(nl+44),	(nl+32),  -(nl+41)};
//	Curve Loop(ncl+24)	= {-(nl-11),	(nl+43),	(nl+33),  -(nl+42)};
//	Curve Loop(ncl+25)	= {-(nl-12),	(nl+44),	(nl+32),  -(nl+43)};
	Curve Loop(ncl+26)	= {-(nl-13),	(nl+30),	(nl+31),  -(nl+44)};
					
	Plane Surface(nps+6)	= {ncl+6};
	Plane Surface(nps+7)	= {ncl+7};
//	Plane Surface(nps+8)	= {ncl+8};
//	Plane Surface(nps+9)	= {ncl+9};
	Plane Surface(nps+10)	= {ncl+10};
	Plane Surface(nps+11)	= {ncl+11};
 				
	Plane Surface(nps+17)	= {ncl+17};
	Plane Surface(nps+18)	= {ncl+18};
//	Plane Surface(nps+19)	= {ncl+19};
//	Plane Surface(nps+20)	= {ncl+20};
	Plane Surface(nps+21)	= {ncl+21};
 			
	Plane Surface(nps+22)	= {ncl+22};
	Plane Surface(nps+23)	= {ncl+23};
//	Plane Surface(nps+24)	= {ncl+24};
//	Plane Surface(nps+25)	= {ncl+25};
	Plane Surface(nps+26)	= {ncl+26};

	Surface Loop(nsl +1) = {nps-56,	 nps+6,	 nps+7,	 nps-5, nps+21, nps+22};
	Surface Loop(nsl +2) = {nps-55,	 nps+7,	 nps+10, nps-6, nps-7, nps-8, nps+18, nps+23};
//	Surface Loop(nsl +3) = {nps-54,	 nps+8,	 nps+9,	 nps-7, nps+19, nps+24};
//	Surface Loop(nsl +4) = {nps-53,	 nps+9,	 nps+10, nps-8, nps+18, nps+25};
	Surface Loop(nsl +5) = {nps-52,	 nps+10, nps+11, nps-9, nps+17, nps+26};

	Volume(nv+1) = {nsl +1};
	Volume(nv+2) = {nsl +2};
//	Volume(nv+3) = {nsl +3};
//	Volume(nv+4) = {nsl +4};
	Volume(nv+5) = {nsl +5};
	
	Physical Volume("region_post_quantum_C_dop_left", nv+1) = {nv +1};
//	Physical Volume("region_post_quantum_C_left", nv+2) = {nv +2};
	Physical Volume("region_post_quantum_C_mid", nv+3) = {nv +2};
//	Physical Volume("region_post_quantum_C_right", nv+4) = {nv +4};
	Physical Volume("region_post_quantum_C_dop_right", nv+5) = {nv +5};
	Color{216, 219, 226}{ Physical Volume{ nv+3}; }
	Color{169, 188, 208}{ Physical Volume{ nv+1, nv+5}; }

	np = np + 24;
	nl = nl + 44;
	ncl = ncl + 26;
	nps = nps + 26;
	nsl = nsl + 5;
	nv = nv +5;
	
//-------------------------------------------------------------------------------------------------------------------	
// Top oxide layer 
	
	Point(np+1) 	= {region_pre_quantum_A_dop_left_x_min, 	region_pre_quantum_A_dop_left_y_min, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02}; 	
	Point(np+2) 	= {region_pre_quantum_A_dop_left_x_max, 	region_pre_quantum_A_dop_left_y_min, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	Point(np+3) 	= {region_pre_quantum_A_dop_right_x_min, 	region_pre_quantum_A_dop_left_y_min, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	Point(np+4) 	= {region_pre_quantum_A_dop_right_x_max, 	region_pre_quantum_A_dop_left_y_min, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	Point(np+5) 	= {region_pre_quantum_A_dop_right_x_max, 	region_pre_quantum_A_dop_left_y_max, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	Point(np+6) 	= {region_pre_quantum_B_dop_right_x_max, 	region_pre_quantum_B_dop_left_y_max, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	Point(np+7) 	= {region_pre_quantum_C_dop_right_x_max, 	region_pre_quantum_C_dop_left_y_max, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	Point(np+8) 	= {region_pre_quantum_C_dop_right_x_min, 	region_pre_quantum_C_dop_left_y_max, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	Point(np+9) 	= {region_pre_quantum_C_dop_left_x_max, 	region_pre_quantum_C_dop_left_y_max, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	Point(np+10) 	= {region_pre_quantum_C_dop_left_x_min, 	region_pre_quantum_C_dop_left_y_max, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	Point(np+11) 	= {region_pre_quantum_C_dop_left_x_min, 	region_pre_quantum_C_dop_left_y_min, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	Point(np+12) 	= {region_pre_quantum_B_dop_left_x_min, 	region_pre_quantum_B_dop_left_y_min, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	Point(np+13) 	= {region_pre_quantum_A_dop_left_x_max, 	region_pre_quantum_A_dop_left_y_max, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	Point(np+14) 	= {region_pre_quantum_A_dop_right_x_min, 	region_pre_quantum_A_dop_left_y_max, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	Point(np+15) 	= {region_pre_quantum_C_dop_right_x_min, 	region_pre_quantum_C_dop_left_y_min, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	Point(np+16) 	= {region_pre_quantum_C_dop_left_x_max, 	region_pre_quantum_C_dop_left_y_min, 	region_quantum_layer_z_max + bulk_top_z,	grid_spacing_02};
	

	Line(nl+1) 	= {np-59,	np+1};
	Line(nl+2) 	= {np-58,	np+2};
	Line(nl+3) 	= {np-55,	np+3};
	Line(nl+4) 	= {np-54,	np+4};
	Line(nl+5) 	= {np-53,	np+5};
	Line(nl+6) 	= {np-29,	np+6};
	Line(nl+7) 	= {np-5,	np+7};
	Line(nl+8) 	= {np-4,	np+8};
	Line(nl+9) 	= {np-1,	np+9};
	Line(nl+10) = {np-0,	np+10};
	Line(nl+11) = {np-24,	np+11};
	Line(nl+12) = {np-48,	np+12};

	Line(nl+13) = {np-49, 	np+13};
	Line(nl+14) = {np-52, 	np+14};
	Line(nl+15) = {np-28, 	np+15};
	Line(nl+16) = {np-25, 	np+16};

	Line(nl+17) = {np+1, 	np+2};
	Line(nl+18) = {np+2, 	np+3};
	Line(nl+19) = {np+3, 	np+4};
	Line(nl+20) = {np+4, 	np+5};
	Line(nl+21) = {np+5, 	np+6};
	Line(nl+22) = {np+6, 	np+7};
	Line(nl+23) = {np+7, 	np+8};
	Line(nl+24) = {np+8, 	np+9};
	Line(nl+25) = {np+9,	np+10};
	Line(nl+26) = {np+10,	np+11};
	Line(nl+27) = {np+11,	np+12};
	Line(nl+28) = {np+12,	np+1};

	Line(nl+29) = {np+2,	np+13};
	Line(nl+30) = {np+13,	np+16};
	Line(nl+31) = {np+16,	np+9};
	Line(nl+32) = {np+3,	np+14};
	Line(nl+33) = {np+14,	np+15};
	Line(nl+34) = {np+15,	np+8};
	
	Line(nl+35) = {np+12,	np+13};
	Line(nl+36) = {np+14,	np+5};
	Line(nl+41) = {np+11,	np+16};
	Line(nl+42) = {np+15,	np+6};

	Curve Loop(ncl+1)	= {(nl-107),	(nl+2),		-(nl+17),	-(nl+1)};
	Curve Loop(ncl+2)	= {(nl-106),	(nl+3),		-(nl+18),	-(nl+2)};
	Curve Loop(ncl+3)	= {(nl-103),	(nl+4),		-(nl+19),	-(nl+3)};
	Curve Loop(ncl+4)	= {(nl-102),	(nl+5),		-(nl+20),	-(nl+4)};
	Curve Loop(ncl+5)	= {(nl-58 ),	(nl+6),		-(nl+21),	-(nl+5)};
	Curve Loop(ncl+6)	= {(nl-14 ),	(nl+7),		-(nl+22),	-(nl+6)};
	Curve Loop(ncl+7)	= {(nl-13 ),	(nl+8),		-(nl+23),	-(nl+7)};
	Curve Loop(ncl+8)	= {(nl-12 ),	(nl+9),		-(nl+24),	-(nl+8)};
	Curve Loop(ncl+9)	= {(nl-9  ),	(nl+10),	-(nl+25),	-(nl+9)};
	Curve Loop(ncl+10)	= {(nl-8  ),	(nl+11),	-(nl+26),	-(nl+10)};
	Curve Loop(ncl+11)	= {(nl-52 ),	(nl+12),	-(nl+27),	-(nl+11)};
	Curve Loop(ncl+12)	= {(nl-96 ),	(nl+1),		-(nl+28),	-(nl+12)};
	

	Curve Loop(ncl+13)	= {-(nl-91),		(nl+2),		(nl+29),	-(nl+13)};
	Curve Loop(ncl+14)	= {-(nl-47),		(nl+13),	(nl+30),	-(nl+16)};
	Curve Loop(ncl+15)	= {-(nl-3 ),		(nl+16),	(nl+31),	-(nl+9)};
	Curve Loop(ncl+16)	= {-(nl-88),		(nl+3),		(nl+32),	-(nl+14)};
	Curve Loop(ncl+17)	= {-(nl-44),		(nl+14),	(nl+33),	-(nl+15)};
	Curve Loop(ncl+18)	= {-(nl-0 ),		(nl+15),	(nl+34),	-(nl+8)};
	
	Curve Loop(ncl+19)	= {-(nl-97),		(nl+13),	-(nl+35),	-(nl+12)};
	Curve Loop(ncl+20)	= {-(nl-53),		(nl+16),	-(nl+41),	-(nl+11)};
	Curve Loop(ncl+21)	= {-(nl-101),		(nl+5),		-(nl+36),	-(nl+14)};
	Curve Loop(ncl+22)	= {-(nl-57),		(nl+6),	    -(nl+42),	-(nl+15)};

	Curve Loop(ncl+23)	= {(nl+17),	(nl+29),	-(nl+35),	(nl+28)};	
	Curve Loop(ncl+24)	= {(nl+35),	(nl+30),	-(nl+41),	(nl+27)};
	Curve Loop(ncl+25)	= {(nl+41),	(nl+31),	 (nl+25),	(nl+26)};
	Curve Loop(ncl+26)	= {(nl+19),	(nl+20),	-(nl+36),	-(nl+32)};
	Curve Loop(ncl+27)	= {(nl+36),	(nl+21),	-(nl+42),	-(nl+33)};
	Curve Loop(ncl+28)	= {(nl+42),	(nl+22),	 (nl+23),	-(nl+34)};
	Curve Loop(ncl+29)	= {(nl+18),	(nl+32),	 (nl+33),	 (nl+34),	(nl+24),	-(nl+31), -(nl+30), -(nl+29)};
					
	Plane Surface(nps+1)	= {ncl+1};
	Plane Surface(nps+2)	= {ncl+2};
	Plane Surface(nps+3)	= {ncl+3};
	Plane Surface(nps+4)	= {ncl+4};
	Plane Surface(nps+5)	= {ncl+5};
	Plane Surface(nps+6)	= {ncl+6};
	Plane Surface(nps+7)	= {ncl+7};
	Plane Surface(nps+8)	= {ncl+8};
	Plane Surface(nps+9)	= {ncl+9};
	Plane Surface(nps+10)	= {ncl+10};
	Plane Surface(nps+11)	= {ncl+11};			
	Plane Surface(nps+12)	= {ncl+12};

	Plane Surface(nps+13)	= {ncl+13};
	Plane Surface(nps+14)	= {ncl+14};
	Plane Surface(nps+15)	= {ncl+15};
	Plane Surface(nps+16)	= {ncl+16};			
	Plane Surface(nps+17)	= {ncl+17};
	Plane Surface(nps+18)	= {ncl+18};
	Plane Surface(nps+19)	= {ncl+19};
	Plane Surface(nps+20)	= {ncl+20};
	Plane Surface(nps+21)	= {ncl+21};		
	Plane Surface(nps+22)	= {ncl+22};
	
	Plane Surface(nps+23)	= {ncl+23};
	Plane Surface(nps+24)	= {ncl+24};
	Plane Surface(nps+25)	= {ncl+25};
	Plane Surface(nps+26)	= {ncl+26};
	Plane Surface(nps+27)	= {ncl+27};
	Plane Surface(nps+28)	= {ncl+28};
	Plane Surface(nps+29)	= {ncl+29};

	

	Surface Loop(nsl +1) = {nps-56,	nps+1,	nps+13,	nps+19,	nps+12,	nps+23};
	Surface Loop(nsl +2) = {nps-30,	nps+19,	nps+14,	nps+20,	nps+11,	nps+24};
	Surface Loop(nsl +3) = {nps-4,	nps+20,	nps+15,	nps+9,	nps+10,	nps+25};
	Surface Loop(nsl +4) = {nps-52,	nps+3,	nps+4,	nps+21,	nps+16,	nps+26};
	Surface Loop(nsl +5) = {nps-26,	nps+21,	nps+5,	nps+22,	nps+17,	nps+27};
	Surface Loop(nsl +6) = {nps-0,	nps+22,	nps+6,	nps+7,	nps+18,	nps+28};
	Surface Loop(nsl +7) = {nps-55,	nps-29,	nps-28, nps-27, nps-3, nps+2, nps+16, nps+17, nps+18, nps+8, nps+15, nps+14, nps+13, nps+29};

	Volume(nv+1) = {nsl +1};
	Volume(nv+2) = {nsl +2};
	Volume(nv+3) = {nsl +3};
	Volume(nv+4) = {nsl +4};
	Volume(nv+5) = {nsl +5};
	Volume(nv+6) = {nsl +6};
	Volume(nv+7) = {nsl +7};
	
	Physical Volume("region_bulk_top_A_dop_left", nv+1) = {nv +1};
	Physical Volume("region_bulk_top_A_dop_right", nv+4) = {nv +4};
	Physical Volume("region_bulk_top_B_dop_left", nv+2) = {nv +2};
	Physical Volume("region_bulk_top_B_dop_right", nv+5) = {nv +5};
	Physical Volume("region_bulk_top_C_dop_left", nv+3) = {nv +3};
	Physical Volume("region_bulk_top_C_dop_right", nv+6) = {nv +6};
	Physical Volume("region_bulk_top_mid", nv+7) = {nv +7};
	Color{216, 219, 226}{ Physical Volume{ nv+2, nv+5, nv+7}; }
	Color{169, 188, 208}{ Physical Volume{ nv+1, nv+3, nv+4, nv+6}; }
	
	Physical Surface("surface_ohmic_left", nphys +1) = {nps+23, nps+25};
	Physical Surface("surface_ohmic_right", nphys +2) = {nps+26, nps+28};
	bulk_top_surfaces = {nps+23,	nps+24,	nps+25,
						 nps+26,	nps+27,	nps+28,
						 nps+29};
	bulk_top_lines = {nl+17, nl+18, nl+19,
					  nl+20, nl+21, nl+22,
					  nl+23, nl+24, nl+25,
					  nl+26, nl+27, nl+28};
	bulk_top_points = {np+1, np+4, np+7, np+10};

	np = np + 16;
	nl = nl + 42;
	ncl = ncl + 29;
	nps = nps + 29;
	nsl = nsl + 7;
	nv = nv +7;
	nphys = nphys + 2;
//-------------------------------------------------------------------------------------------------------------------	
// Bottom relaxed Si(1-x)Ge(x) layer

	Line(nl+1)		= {np-235 , np-231};
	Line(nl+2)		= {np-234 , np-226};
	Line(nl+3)		= {np-233 , np-177};
	Line(nl+4)		= {np-232 , np-172};
	
	Curve Loop(ncl+1)	= {nl-441,	nl+2,	-(nl-433),	-(nl-436),	-(nl-437),	-(nl+1)};
	Curve Loop(ncl+2)	= {nl-440,	nl+3,	-(nl-344),	-(nl-388),	-(nl-432),	-(nl+2)};
	Curve Loop(ncl+3)	= {nl-439,	nl+4,	-(nl-339),	-(nl-342),	-(nl-343),	-(nl+3)};
	Curve Loop(ncl+4)	= {nl-438,	nl+1,	-(nl-426),	-(nl-382),	-(nl-338),	-(nl+4)};

	Plane Surface(nps+1) = {ncl+1};
	Plane Surface(nps+2) = {ncl+2};
	Plane Surface(nps+3) = {ncl+3};
	Plane Surface(nps+4) = {ncl+4};
	
	Surface Loop(nsl +1) = {nps+1, nps+2, nps+3, nps+4, nps-263, 
							nps-262, nps-261, nps-258,
							nps-236, nps-235, nps-234, nps-233, nps-232,
							nps-210, nps-209, nps-206};
	
	Volume(nv+1) = {nsl +1};
	
	Physical Volume("region_bulk_bottom", nv+1) = {nv +1};
	Color{169, 188, 208}{ Physical Volume{ nv+1}; }
	
	np = np + 0;
	nl = nl + 4;
	nps = nps + 4;
	ncl = ncl + 4;
	nsl = nsl + 1;	
	nv = nv + 1;
	
	
//-------------------------------------------------------------------------------------------------------------------	
// First Y-gate

	Point(np+1) 	= {region_Y_gate_x_min, region_Y_gate_y_min, region_Y_gate_z_min, grid_spacing_04};
	Point(np+2) 	= {region_Y_gate_x_max, region_Y_gate_y_min, region_Y_gate_z_min, grid_spacing_04};
	Point(np+3) 	= {region_Y_gate_x_max, region_Y_gate_y_max, region_Y_gate_z_min, grid_spacing_04};
	Point(np+4) 	= {region_Y_gate_x_min, region_Y_gate_y_max, region_Y_gate_z_min, grid_spacing_04};
	Point(np+5) 	= {region_Y_gate_x_min, region_Y_gate_y_min, region_Y_gate_z_max, grid_spacing_04};
	Point(np+6) 	= {region_Y_gate_x_max, region_Y_gate_y_min, region_Y_gate_z_max, grid_spacing_04};
	Point(np+7) 	= {region_Y_gate_x_max, region_Y_gate_y_max, region_Y_gate_z_max, grid_spacing_04};
	Point(np+8) 	= {region_Y_gate_x_min, region_Y_gate_y_max, region_Y_gate_z_max, grid_spacing_04};
	
	Line(nl+1)		= {np+1 , np+2};
	Line(nl+2)		= {np+2 , np+3};
	Line(nl+3)		= {np+3 , np+4};
	Line(nl+4)		= {np+4 , np+1};
	Line(nl+5)		= {np+1 , np+5};
	Line(nl+6)		= {np+2 , np+6};
	Line(nl+7)		= {np+3 , np+7};
	Line(nl+8)		= {np+4 , np+8};
	Line(nl+9)		= {np+5 , np+6};
	Line(nl+10)		= {np+6 , np+7};
	Line(nl+11)		= {np+7 , np+8};
	Line(nl+12)		= {np+8 , np+5};
	
						
	Curve Loop(ncl+1)	= {nl+1,nl+2,nl+3,nl+4};
	Curve Loop(ncl+2)	= {nl+1,nl+6,-(nl+9), -(nl+5)};
	Curve Loop(ncl+3)	= {nl+2,nl+7,-(nl+10), -(nl+6)};
	Curve Loop(ncl+4)	= {nl+3,nl+8,-(nl+11), -(nl+7)};
	Curve Loop(ncl+5)	= {nl+4,nl+5,-(nl+12), -(nl+8)};
	Curve Loop(ncl+6)	= {nl+9,nl+10,nl+11,nl+12};
	
	Plane Surface(nps+1) = {ncl+1};
	Plane Surface(nps+2) = {ncl+2};
	Plane Surface(nps+3) = {ncl+3};
	Plane Surface(nps+4) = {ncl+4};
	Plane Surface(nps+5) = {ncl+5};
	Plane Surface(nps+6) = {ncl+6};
	
	Surface Loop(nsl +1) = {nps+1, nps+2, nps+3, nps+4, nps+5, nps+6};
	surface_loop_Y1_gate = nsl +1;
	
	Volume(nv+1) = {nsl +1};
	
	Physical Volume("region_Y1_gate", nv+1) = {nv +1};
	Physical Surface("surface_Y1_gate", (nphys +1)) = {(nps+1)};
	Color{55, 114, 255}{ Physical Volume{ nv+1}; }
	
	nv = nv +1;
	np = np +8;
	nsl = nsl +1;
	nps = nps +6;
	ncl = ncl +6;
	nl = nl+12;
	nphys = nphys +1;
	
//-------------------------------------------------------------------------------------------------------------------	
// Second Y-gate

	Point(np+1) 	= {region_Y_gate_x_min, region_Y_gate_y_min + y_gate_y + y_gate_space_y, region_Y_gate_z_min, grid_spacing_04};
	Point(np+2) 	= {region_Y_gate_x_max, region_Y_gate_y_min + y_gate_y + y_gate_space_y, region_Y_gate_z_min, grid_spacing_04};
	Point(np+3) 	= {region_Y_gate_x_max, region_Y_gate_y_max + y_gate_y + y_gate_space_y, region_Y_gate_z_min, grid_spacing_04};
	Point(np+4) 	= {region_Y_gate_x_min, region_Y_gate_y_max + y_gate_y + y_gate_space_y, region_Y_gate_z_min, grid_spacing_04};
	Point(np+5) 	= {region_Y_gate_x_min, region_Y_gate_y_min + y_gate_y + y_gate_space_y, region_Y_gate_z_max, grid_spacing_04};
	Point(np+6) 	= {region_Y_gate_x_max, region_Y_gate_y_min + y_gate_y + y_gate_space_y, region_Y_gate_z_max, grid_spacing_04};
	Point(np+7) 	= {region_Y_gate_x_max, region_Y_gate_y_max + y_gate_y + y_gate_space_y, region_Y_gate_z_max, grid_spacing_04};
	Point(np+8) 	= {region_Y_gate_x_min, region_Y_gate_y_max + y_gate_y + y_gate_space_y, region_Y_gate_z_max, grid_spacing_04};
	
	Line(nl+1)		= {np+1 , np+2};
	Line(nl+2)		= {np+2 , np+3};
	Line(nl+3)		= {np+3 , np+4};
	Line(nl+4)		= {np+4 , np+1};
	Line(nl+5)		= {np+1 , np+5};
	Line(nl+6)		= {np+2 , np+6};
	Line(nl+7)		= {np+3 , np+7};
	Line(nl+8)		= {np+4 , np+8};
	Line(nl+9)		= {np+5 , np+6};
	Line(nl+10)		= {np+6 , np+7};
	Line(nl+11)		= {np+7 , np+8};
	Line(nl+12)		= {np+8 , np+5};
	
						
	Curve Loop(ncl+1)	= {nl+1,nl+2,nl+3,nl+4};
	Curve Loop(ncl+2)	= {nl+1,nl+6,-(nl+9), -(nl+5)};
	Curve Loop(ncl+3)	= {nl+2,nl+7,-(nl+10), -(nl+6)};
	Curve Loop(ncl+4)	= {nl+3,nl+8,-(nl+11), -(nl+7)};
	Curve Loop(ncl+5)	= {nl+4,nl+5,-(nl+12), -(nl+8)};
	Curve Loop(ncl+6)	= {nl+9,nl+10,nl+11,nl+12};
	
	Plane Surface(nps+1) = {ncl+1};
	Plane Surface(nps+2) = {ncl+2};
	Plane Surface(nps+3) = {ncl+3};
	Plane Surface(nps+4) = {ncl+4};
	Plane Surface(nps+5) = {ncl+5};
	Plane Surface(nps+6) = {ncl+6};
	
	Surface Loop(nsl +1) = {nps+1, nps+2, nps+3, nps+4, nps+5, nps+6};
	surface_loop_Y2_gate = nsl +1;
	
	Volume(nv+1) = {nsl +1};
	
	Physical Volume("region_Y2_gate", nv+1) = {nv +1};
	Physical Surface("surface_Y2_gate", (nphys+1)) = {(nps+1)};
	Color{55, 114, 255}{ Physical Volume{ nv+1}; }
	
	nv = nv +1;
	np = np +8;
	nsl = nsl +1;
	nps = nps +6;
	ncl = ncl +6;
	nl = nl+12;	
	nphys = nphys+1;
	
//-------------------------------------------------------------------------------------------------------------------	
// Left reservoir plunger X-gate

//-------------------------------------------------------------------------------------------------------------------	
// Left reservoir plunger X-gate

	Point(np+1) 	= {region_Reservoir_gate_h1_x_min, region_Reservoir_gate_h1_y_min, region_Reservoir_gate_h1_z_min, grid_spacing_04};
	Point(np+2) 	= {region_Reservoir_gate_h1_x_max, region_Reservoir_gate_h1_y_min, region_Reservoir_gate_h1_z_min, grid_spacing_04};
	Point(np+3) 	= {region_Reservoir_gate_h1_x_max, region_Reservoir_gate_h1_y_max, region_Reservoir_gate_h1_z_min, grid_spacing_04};
	Point(np+4) 	= {region_Reservoir_gate_h1_x_min, region_Reservoir_gate_h1_y_max, region_Reservoir_gate_h1_z_min, grid_spacing_04};
	Point(np+5) 	= {region_Reservoir_gate_l1_x_min, region_Reservoir_gate_l1_y_min, region_Reservoir_gate_l1_z_min, grid_spacing_02};
	Point(np+6) 	= {region_Reservoir_gate_l1_x_max, region_Reservoir_gate_l1_y_min, region_Reservoir_gate_l1_z_min, grid_spacing_02};
	Point(np+7) 	= {region_Reservoir_gate_l1_x_max, region_Reservoir_gate_l1_y_max, region_Reservoir_gate_l1_z_min, grid_spacing_02};
	Point(np+8) 	= {region_Reservoir_gate_l1_x_min, region_Reservoir_gate_l1_y_max, region_Reservoir_gate_l1_z_min, grid_spacing_02};
	Point(np+9) 	= {region_Reservoir_gate_h2_x_min, region_Reservoir_gate_h2_y_min, region_Reservoir_gate_h2_z_min, grid_spacing_04};
	Point(np+10) 	= {region_Reservoir_gate_h2_x_max, region_Reservoir_gate_h2_y_min, region_Reservoir_gate_h2_z_min, grid_spacing_04};
	Point(np+11) 	= {region_Reservoir_gate_h2_x_max, region_Reservoir_gate_h2_y_max, region_Reservoir_gate_h2_z_min, grid_spacing_04};
	Point(np+12) 	= {region_Reservoir_gate_h2_x_min, region_Reservoir_gate_h2_y_max, region_Reservoir_gate_h2_z_min, grid_spacing_04};
	Point(np+13) 	= {region_Reservoir_gate_h1_x_min, region_Reservoir_gate_h1_y_min, region_Reservoir_gate_h1_z_max, grid_spacing_04};
	Point(np+14) 	= {region_Reservoir_gate_h1_x_max, region_Reservoir_gate_h1_y_min, region_Reservoir_gate_h1_z_max, grid_spacing_04};
	Point(np+15) 	= {region_Reservoir_gate_h2_x_max, region_Reservoir_gate_h2_y_max, region_Reservoir_gate_h2_z_max, grid_spacing_04};
	Point(np+16) 	= {region_Reservoir_gate_h2_x_min, region_Reservoir_gate_h2_y_max, region_Reservoir_gate_h2_z_max, grid_spacing_04};
	
	Line(nl+1)		= {np+1 , np+2};
	Line(nl+2)		= {np+2 , np+3};
	Line(nl+3)		= {np+3 , np+4};
	Line(nl+4)		= {np+4 , np+1};
	
	Line(nl+5)		= {np+5 , np+6};
	Line(nl+6)		= {np+6 , np+7};
	Line(nl+7)		= {np+7 , np+8};
	Line(nl+8)		= {np+8 , np+5};

	Line(nl+9)		= {np+5 , np+4};
	Line(nl+10)		= {np+6 , np+3};
	Line(nl+11)		= {np+7 , np+10};
	Line(nl+12)		= {np+8 , np+9};

	Line(nl+13)		= {np+9 , np+10};
	Line(nl+14)		= {np+10 , np+11};
	Line(nl+15)		= {np+11 , np+12};
	Line(nl+16)		= {np+12 , np+9};

	Line(nl+17)		= {np+1 , np+13};
	Line(nl+18)		= {np+2 , np+14};
	Line(nl+19)		= {np+11 , np+15};
	Line(nl+20)		= {np+12 , np+16};
	
	Line(nl+21)		= {np+13 , np+14};
	Line(nl+22)		= {np+14 , np+15};
	Line(nl+23)		= {np+15 , np+16};
	Line(nl+24)		= {np+16 , np+13};
	


	Curve Loop(ncl+1)	= {nl+1, nl+2, nl+3, nl+4};
	Curve Loop(ncl+2)	= {(nl+3), -(nl+9), nl+5, nl+10};
	Curve Loop(ncl+3)	= {nl+5, nl+ 6, nl+7, nl+8};
	Curve Loop(ncl+4)	= {-(nl+7), nl+11, -(nl+13), -(nl+12)};
	Curve Loop(ncl+5)   = {nl+13, nl+14, nl+15, nl+16};
	
	Curve Loop(ncl+6)   = {nl+1, nl+18, -(nl+21), -(nl+17)};
	Curve Loop(ncl+7)   = {-(nl+18), nl+2, -(nl+10), nl+6, nl+11, nl+14, nl+19, -(nl+22)};
	Curve Loop(ncl+8)   = {-(nl+19), nl+15, nl+20, -(nl+23)};
	Curve Loop(ncl+9)   = {-(nl+20), nl+16, -(nl+12), nl+8, nl+9, nl+4, nl+17, -(nl+24)};
	
	Curve Loop(ncl+10)  = {nl+21, nl+22, nl+23, nl+24};


	Plane Surface(nps+1) = {ncl+1};
	Plane Surface(nps+2) = {ncl+2};
	Plane Surface(nps+3) = {ncl+3};
	Plane Surface(nps+4) = {ncl+4};
	Plane Surface(nps+5) = {ncl+5};
	Plane Surface(nps+6) = {ncl+6};
	Plane Surface(nps+7) = {ncl+7};
	Plane Surface(nps+8) = {ncl+8};
	Plane Surface(nps+9) = {ncl+9};
	Plane Surface(nps+10) = {ncl+10};

	
	Surface Loop(nsl +1) = {nps+1, nps+2, nps+3, nps+4, nps+5, nps+6, nps+7, nps+8, nps+9, nps+10};
	surface_loop_Reservoir_L_X_gate = nsl +1;
	
	Volume(nv+1) = {nsl +1};
	
	Physical Volume("region_Reservoir_L_X_gate", nv+1) = {nv +1};
	Physical Surface("surface_Reservoir_L_X_gate", (nphys +1)) = {(nps+1), (nps+2), (nps+3), nps+4, nps+5};
	Color{223, 41, 53}{ Physical Volume{ nv+1}; }
	
	
	np = np +16;
	nl = nl+24;
	nps = nps +10;
	ncl = ncl +10;
	nsl = nsl +1;	
	nv = nv +1;
	nphys = nphys +1;
	
//-------------------------------------------------------------------------------------------------------------------	
// Left reservoir barrier X-gate
	
	Point(np+1) 	= {region_Barrier_gate_h1_x_min, region_Barrier_gate_h1_y_min, region_Barrier_gate_h1_z_min, grid_spacing_04};
	Point(np+2) 	= {region_Barrier_gate_h1_x_max, region_Barrier_gate_h1_y_min, region_Barrier_gate_h1_z_min, grid_spacing_04};
	Point(np+3) 	= {region_Barrier_gate_h1_x_max, region_Barrier_gate_h1_y_max, region_Barrier_gate_h1_z_min, grid_spacing_04};
	Point(np+4) 	= {region_Barrier_gate_h1_x_min, region_Barrier_gate_h1_y_max, region_Barrier_gate_h1_z_min, grid_spacing_04};
	Point(np+5) 	= {region_Barrier_gate_l1_x_min, region_Barrier_gate_l1_y_min, region_Barrier_gate_l1_z_min, grid_spacing_02};
	Point(np+6) 	= {region_Barrier_gate_l1_x_max, region_Barrier_gate_l1_y_min, region_Barrier_gate_l1_z_min, grid_spacing_02};
	Point(np+7) 	= {region_Barrier_gate_l1_x_max, region_Barrier_gate_l1_y_max, region_Barrier_gate_l1_z_min, grid_spacing_02};
	Point(np+8) 	= {region_Barrier_gate_l1_x_min, region_Barrier_gate_l1_y_max, region_Barrier_gate_l1_z_min, grid_spacing_02};
	Point(np+9) 	= {region_Barrier_gate_h2_x_min, region_Barrier_gate_h2_y_min, region_Barrier_gate_h2_z_min, grid_spacing_04};
	Point(np+10) 	= {region_Barrier_gate_h2_x_max, region_Barrier_gate_h2_y_min, region_Barrier_gate_h2_z_min, grid_spacing_04};
	Point(np+11) 	= {region_Barrier_gate_h2_x_max, region_Barrier_gate_h2_y_max, region_Barrier_gate_h2_z_min, grid_spacing_04};
	Point(np+12) 	= {region_Barrier_gate_h2_x_min, region_Barrier_gate_h2_y_max, region_Barrier_gate_h2_z_min, grid_spacing_04};
	Point(np+13) 	= {region_Barrier_gate_h1_x_min, region_Barrier_gate_h1_y_min, region_Barrier_gate_h1_z_max, grid_spacing_04};
	Point(np+14) 	= {region_Barrier_gate_h1_x_max, region_Barrier_gate_h1_y_min, region_Barrier_gate_h1_z_max, grid_spacing_04};
	Point(np+15) 	= {region_Barrier_gate_h2_x_max, region_Barrier_gate_h2_y_max, region_Barrier_gate_h2_z_max, grid_spacing_04};
	Point(np+16) 	= {region_Barrier_gate_h2_x_min, region_Barrier_gate_h2_y_max, region_Barrier_gate_h2_z_max, grid_spacing_04};
	
	Line(nl+1)		= {np+1 , np+2};
	Line(nl+2)		= {np+2 , np+3};
	Line(nl+3)		= {np+3 , np+4};
	Line(nl+4)		= {np+4 , np+1};
	
	Line(nl+5)		= {np+5 , np+6};
	Line(nl+6)		= {np+6 , np+7};
	Line(nl+7)		= {np+7 , np+8};
	Line(nl+8)		= {np+8 , np+5};

	Line(nl+9)		= {np+5 , np+4};
	Line(nl+10)		= {np+6 , np+3};
	Line(nl+11)		= {np+7 , np+10};
	Line(nl+12)		= {np+8 , np+9};

	Line(nl+13)		= {np+9 , np+10};
	Line(nl+14)		= {np+10 , np+11};
	Line(nl+15)		= {np+11 , np+12};
	Line(nl+16)		= {np+12 , np+9};

	Line(nl+17)		= {np+1 , np+13};
	Line(nl+18)		= {np+2 , np+14};
	Line(nl+19)		= {np+11 , np+15};
	Line(nl+20)		= {np+12 , np+16};
	
	Line(nl+21)		= {np+13 , np+14};
	Line(nl+22)		= {np+14 , np+15};
	Line(nl+23)		= {np+15 , np+16};
	Line(nl+24)		= {np+16 , np+13};
	


	Curve Loop(ncl+1)	= {nl+1, nl+2, nl+3, nl+4};
	Curve Loop(ncl+2)	= {(nl+3), -(nl+9), nl+5, nl+10};
	Curve Loop(ncl+3)	= {nl+5, nl+ 6, nl+7, nl+8};
	Curve Loop(ncl+4)	= {-(nl+7), nl+11, -(nl+13), -(nl+12)};
	Curve Loop(ncl+5)   = {nl+13, nl+14, nl+15, nl+16};
	
	Curve Loop(ncl+6)   = {nl+1, nl+18, -(nl+21), -(nl+17)};
	Curve Loop(ncl+7)   = {-(nl+18), nl+2, -(nl+10), nl+6, nl+11, nl+14, nl+19, -(nl+22)};
	Curve Loop(ncl+8)   = {-(nl+19), nl+15, nl+20, -(nl+23)};
	Curve Loop(ncl+9)   = {-(nl+20), nl+16, -(nl+12), nl+8, nl+9, nl+4, nl+17, -(nl+24)};
	
	Curve Loop(ncl+10)  = {nl+21, nl+22, nl+23, nl+24};


	Plane Surface(nps+1) = {ncl+1};
	Plane Surface(nps+2) = {ncl+2};
	Plane Surface(nps+3) = {ncl+3};
	Plane Surface(nps+4) = {ncl+4};
	Plane Surface(nps+5) = {ncl+5};
	Plane Surface(nps+6) = {ncl+6};
	Plane Surface(nps+7) = {ncl+7};
	Plane Surface(nps+8) = {ncl+8};
	Plane Surface(nps+9) = {ncl+9};
	Plane Surface(nps+10) = {ncl+10};

	
	Surface Loop(nsl +1) = {nps+1, nps+2, nps+3, nps+4, nps+5, nps+6, nps+7, nps+8, nps+9, nps+10};
	surface_loop_Barrier_L_X_gate = nsl +1;
	
	Volume(nv+1) = {nsl +1};
		
	Physical Volume("region_Barrier_L_X_gate", nv+1) = {nv +1};
	Physical Surface("surface_Barrier_L_X_gate", (nphys+1)) = {(nps+1), (nps+2), (nps+3), nps+4, nps+5};
	Color{225, 242, 254}{ Physical Volume{ nv+1}; }
	
	np = np +16;
	nl = nl+24;
	nps = nps +10;
	ncl = ncl +10;
	nsl = nsl +1;	
	nv = nv +1;
	nphys = nphys+1;
	
//-------------------------------------------------------------------------------------------------------------------	
// Left dot plunger X-gate

	Point(np+1) 	= {region_Plunger_gate_h1_x_min, region_Plunger_gate_h1_y_min, region_Plunger_gate_h1_z_min, grid_spacing_04};
	Point(np+2) 	= {region_Plunger_gate_h1_x_max, region_Plunger_gate_h1_y_min, region_Plunger_gate_h1_z_min, grid_spacing_04};
	Point(np+3) 	= {region_Plunger_gate_h1_x_max, region_Plunger_gate_h1_y_max, region_Plunger_gate_h1_z_min, grid_spacing_04};
	Point(np+4) 	= {region_Plunger_gate_h1_x_min, region_Plunger_gate_h1_y_max, region_Plunger_gate_h1_z_min, grid_spacing_04};
	Point(np+5) 	= {region_Plunger_gate_l1_x_min, region_Plunger_gate_l1_y_min, region_Plunger_gate_l1_z_min, grid_spacing_02};
	Point(np+6) 	= {region_Plunger_gate_l1_x_max, region_Plunger_gate_l1_y_min, region_Plunger_gate_l1_z_min, grid_spacing_02};
	Point(np+7) 	= {region_Plunger_gate_l1_x_max, region_Plunger_gate_l1_y_max, region_Plunger_gate_l1_z_min, grid_spacing_02};
	Point(np+8) 	= {region_Plunger_gate_l1_x_min, region_Plunger_gate_l1_y_max, region_Plunger_gate_l1_z_min, grid_spacing_02};
	Point(np+9) 	= {region_Plunger_gate_h2_x_min, region_Plunger_gate_h2_y_min, region_Plunger_gate_h2_z_min, grid_spacing_04};
	Point(np+10) 	= {region_Plunger_gate_h2_x_max, region_Plunger_gate_h2_y_min, region_Plunger_gate_h2_z_min, grid_spacing_04};
	Point(np+11) 	= {region_Plunger_gate_h2_x_max, region_Plunger_gate_h2_y_max, region_Plunger_gate_h2_z_min, grid_spacing_04};
	Point(np+12) 	= {region_Plunger_gate_h2_x_min, region_Plunger_gate_h2_y_max, region_Plunger_gate_h2_z_min, grid_spacing_04};
	Point(np+13) 	= {region_Plunger_gate_h1_x_min, region_Plunger_gate_h1_y_min, region_Plunger_gate_h1_z_max, grid_spacing_04};
	Point(np+14) 	= {region_Plunger_gate_h1_x_max, region_Plunger_gate_h1_y_min, region_Plunger_gate_h1_z_max, grid_spacing_04};
	Point(np+15) 	= {region_Plunger_gate_h2_x_max, region_Plunger_gate_h2_y_max, region_Plunger_gate_h2_z_max, grid_spacing_04};
	Point(np+16) 	= {region_Plunger_gate_h2_x_min, region_Plunger_gate_h2_y_max, region_Plunger_gate_h2_z_max, grid_spacing_04};
	
	Line(nl+1)		= {np+1 , np+2};
	Line(nl+2)		= {np+2 , np+3};
	Line(nl+3)		= {np+3 , np+4};
	Line(nl+4)		= {np+4 , np+1};
	
	Line(nl+5)		= {np+5 , np+6};
	Line(nl+6)		= {np+6 , np+7};
	Line(nl+7)		= {np+7 , np+8};
	Line(nl+8)		= {np+8 , np+5};

	Line(nl+9)		= {np+5 , np+4};
	Line(nl+10)		= {np+6 , np+3};
	Line(nl+11)		= {np+7 , np+10};
	Line(nl+12)		= {np+8 , np+9};

	Line(nl+13)		= {np+9 , np+10};
	Line(nl+14)		= {np+10 , np+11};
	Line(nl+15)		= {np+11 , np+12};
	Line(nl+16)		= {np+12 , np+9};

	Line(nl+17)		= {np+1 , np+13};
	Line(nl+18)		= {np+2 , np+14};
	Line(nl+19)		= {np+11 , np+15};
	Line(nl+20)		= {np+12 , np+16};
	
	Line(nl+21)		= {np+13 , np+14};
	Line(nl+22)		= {np+14 , np+15};
	Line(nl+23)		= {np+15 , np+16};
	Line(nl+24)		= {np+16 , np+13};
	


	Curve Loop(ncl+1)	= {nl+1, nl+2, nl+3, nl+4};
	Curve Loop(ncl+2)	= {(nl+3), -(nl+9), nl+5, nl+10};
	Curve Loop(ncl+3)	= {nl+5, nl+ 6, nl+7, nl+8};
	Curve Loop(ncl+4)	= {-(nl+7), nl+11, -(nl+13), -(nl+12)};
	Curve Loop(ncl+5)   = {nl+13, nl+14, nl+15, nl+16};
	
	Curve Loop(ncl+6)   = {nl+1, nl+18, -(nl+21), -(nl+17)};
	Curve Loop(ncl+7)   = {-(nl+18), nl+2, -(nl+10), nl+6, nl+11, nl+14, nl+19, -(nl+22)};
	Curve Loop(ncl+8)   = {-(nl+19), nl+15, nl+20, -(nl+23)};
	Curve Loop(ncl+9)   = {-(nl+20), nl+16, -(nl+12), nl+8, nl+9, nl+4, nl+17, -(nl+24)};
	
	Curve Loop(ncl+10)  = {nl+21, nl+22, nl+23, nl+24};


	Plane Surface(nps+1) = {ncl+1};
	Plane Surface(nps+2) = {ncl+2};
	Plane Surface(nps+3) = {ncl+3};
	Plane Surface(nps+4) = {ncl+4};
	Plane Surface(nps+5) = {ncl+5};
	Plane Surface(nps+6) = {ncl+6};
	Plane Surface(nps+7) = {ncl+7};
	Plane Surface(nps+8) = {ncl+8};
	Plane Surface(nps+9) = {ncl+9};
	Plane Surface(nps+10) = {ncl+10};

	
	Surface Loop(nsl +1) = {nps+1, nps+2, nps+3, nps+4, nps+5, nps+6, nps+7, nps+8, nps+9, nps+10};
	surface_loop_Plunger_L_X_gate = nsl +1;
	
	Volume(nv+1) = {nsl +1};
	
	Physical Volume("region_Plunger_L_X_gate", nv+1) = {nv +1};
	Physical Surface("surface_Plunger_L_X_gate", (nphys+1)) = {(nps+1), (nps+2), (nps+3), nps+4, nps+5};
	Color{223, 41, 53}{ Physical Volume{ nv+1}; }
	
	np = np +24;
	nl = nl+36;
	nps = nps +14;
	ncl = ncl +14;
	nsl = nsl +1;	
	nv = nv +1;
	nphys = nphys+1;
	
//-------------------------------------------------------------------------------------------------------------------	
// Right dot plunger X-gate
	
	new_vol[] = Translate{(2*x_gate_x + 2*x_gate_space_x), 0, 0} { Duplicata{ Volume{nv}; } };
	Physical Volume("region_Plunger_R_X_gate", new_vol[0]) = {new_vol[0]};
	
	bound[] = CombinedBoundary{Volume{new_vol[0]};}; // to get the 14 surfaces of the newly created volumes
	Surface Loop(nsl +1) = {bound[0], bound[1], bound[2], bound[3], bound[4], bound[5], bound[6], bound[7], bound[8], bound[9]};
	Physical Surface("surface_Plunger_R_X_gate", (nphys+1)) = {(bound[0]), (bound[1]), (bound[2]),(bound[3]), (bound[4])};
	surface_loop_Plunger_R_X_gate = nsl +1;
	nsl = nsl +1;
	nphys = nphys +1;
	nv = new_vol[0];
	Color{223, 41, 53}{ Physical Volume{ nv}; }

//-------------------------------------------------------------------------------------------------------------------	
// Right reservoir plunger X-gate
	
	new_vol[] = Translate{(7*x_gate_x + 6*x_gate_space_x), 0, 0} { Duplicata{ Volume{nv-3}; } };
	Physical Volume("region_Reservoir_R_X_gate", new_vol[0]) = {new_vol[0]};
	
	bound[] = CombinedBoundary{Volume{new_vol[0]};}; // to get the 14 surfaces of the newly created volumes
	Surface Loop(nsl +1) = {bound[0], bound[1], bound[2], bound[3], bound[4], bound[5], bound[6], bound[7], bound[8], bound[9]};
	Physical Surface("surface_Reservoir_R_X_gate", (nphys+1)) = {(bound[0]), (bound[1]), (bound[2]),(bound[3]), (bound[4])};
	surface_loop_Reservoir_R_X_gate = nsl +1;
	nsl = nsl +1;
	nphys = nphys +1;
	nv = new_vol[0];
	Color{223, 41, 53}{ Physical Volume{ nv}; }
	
//-------------------------------------------------------------------------------------------------------------------	
// Inter dot Barrier X-gate
	
	new_vol[] = Translate{(2*x_gate_x + 2*x_gate_space_x), 0, 0} { Duplicata{ Volume{nv-3}; } };
	Physical Volume("region_Barrier_M_X_gate", new_vol[0]) = {new_vol[0]};
	
	bound[] = CombinedBoundary{Volume{new_vol[0]};}; // to get the 14 surfaces of the newly created volumes
	Physical Surface("surface_Barrier_M_X_gate", (nphys +1)) = {(bound[0]), (bound[1]), (bound[2]),(bound[3]), (bound[4])};
	Surface Loop(nsl +1) = {bound[0], bound[1], bound[2], bound[3], bound[4], bound[5], bound[6], bound[7], bound[8], bound[9]};
	surface_loop_Barrier_M_X_gate = nsl +1;
	nsl = nsl +1;	
	nphys = nphys +1;
	nv = new_vol[0];
	Color{225, 242, 254}{ Physical Volume{ nv}; }
	
//-------------------------------------------------------------------------------------------------------------------	
// Right reservoir barrier X-gate
	
	new_vol[] = Translate{(2*x_gate_x + 2*x_gate_space_x), 0, 0} { Duplicata{ Volume{nv};  } };
	Physical Volume("region_Barrier_R_X_gate", new_vol[0]) = {new_vol[0]};
	bound[] = CombinedBoundary{Volume{new_vol[0]};};
	
	bound[] = CombinedBoundary{Volume{new_vol[0]};}; // to get the 14 surfaces of the newly created volumes
	Physical Surface("surface_Barrier_R_X_gate", (nphys +1)) = {(bound[0]), (bound[1]), (bound[2]),(bound[3]), (bound[4])};
	Surface Loop(nsl +1) = {bound[0], bound[1], bound[2], bound[3], bound[4], bound[5], bound[6], bound[7], bound[8], bound[9]};
	surface_loop_Barrier_R_X_gate = nsl +1;
	nsl = nsl +1;	
	nphys = nphys +1;
	nv = new_vol[0];
	Color{225, 242, 254}{ Physical Volume{ nv}; }
	P[] = PointsOf{Volume{new_vol[0]};};
	np = 10000;
	nl = 1000;
	ncl = 1000;
	nps = 1000;


//-------------------------------------------------------------------------------------------------------------------	
// Upper oxide layer 


	Point(np+1) 	= {x_begin, y_begin, 	z_end, grid_spacing_05};
	Point(np+2)		= {x_end, 	y_begin, 	z_end, grid_spacing_05};
	Point(np+3)		= {x_end, 	y_end, 		z_end, grid_spacing_05};
	Point(np+4)		= {x_begin, y_end, 		z_end, grid_spacing_05};
	
	Line(nl+1)		= {bulk_top_points(0) , np+1};
	Line(nl+2)		= {bulk_top_points(1) , np+2};
	Line(nl+3)		= {bulk_top_points(2) , np+3};
	Line(nl+4)		= {bulk_top_points(3) , np+4};
	Line(nl+5)		= {np+1, np+2};
	Line(nl+6)		= {np+2, np+3};
	Line(nl+7)		= {np+3, np+4};
	Line(nl+8)		= {np+4, np+1};
	
	Curve Loop(ncl+1)	= {bulk_top_lines(0), bulk_top_lines(1), bulk_top_lines(2), 	nl+2, -(nl+5), -(nl+1)};
	Curve Loop(ncl+2)	= {bulk_top_lines(3), bulk_top_lines(4), bulk_top_lines(5),		nl+3, -(nl+6), -(nl+2)};
	Curve Loop(ncl+3)	= {bulk_top_lines(6), bulk_top_lines(7), bulk_top_lines(8),		nl+4, -(nl+7), -(nl+3)};
	Curve Loop(ncl+4)	= {bulk_top_lines(9), bulk_top_lines(10), bulk_top_lines(11),	nl+1, -(nl+8), -(nl+4)};
	Curve Loop(ncl+5)   = {nl+5, nl+6, nl+7, nl+8};
	
	Plane Surface(nps+1) = {ncl+1};
	Plane Surface(nps+2) = {ncl+2};
	Plane Surface(nps+3) = {ncl+3};
	Plane Surface(nps+4) = {ncl+4};
	Plane Surface(nps+5) = {ncl+5};
	
	Surface Loop(nsl +1) = {nps+1, nps+2, nps+3, nps+4, nps+5,
							bulk_top_surfaces(0), bulk_top_surfaces(1), bulk_top_surfaces(2), bulk_top_surfaces(3), bulk_top_surfaces(4),
							bulk_top_surfaces(5), bulk_top_surfaces(6)};
	


	Volume(nv+1) = {nsl +1, surface_loop_Y1_gate, surface_loop_Y2_gate, surface_loop_Barrier_L_X_gate, surface_loop_Reservoir_L_X_gate, surface_loop_Barrier_R_X_gate, surface_loop_Barrier_M_X_gate, surface_loop_Reservoir_R_X_gate, surface_loop_Plunger_R_X_gate, surface_loop_Plunger_L_X_gate};
	Physical Volume("region_top_oxide",nv+1) = {nv+1};
	


//-----------------------------------------------------------------------------
//
//	Meshing and saving:
//
//-----------------------------------------------------------------------------	

	Mesh 1;
	Mesh 2;
	Mesh 3;
//  OptimizeMesh "Netgen";
    Save "DQD_SiMOS.msh2";
    Save "DQD_SiMOS.geo_unrolled";
//  Show "*";
