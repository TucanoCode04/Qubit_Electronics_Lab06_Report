import sys
sys.path.append("/opt/qtcad-2.1.4/src/qtcad")


from device import constants as ct
from device.mesh3d import Mesh, SubMesh
from device import io
from device import analysis
from device import materials as mt
from device import Device, SubDevice
from device.poisson import Solver as PoissonSolver
from device.schrodinger import Solver as SchrodingerSolver
from device.schrodinger import SolverParams as SchrodingerSolverParams 
from device.schrodinger_poisson import Solver as PoissonSchrodingerSolver
from device.poisson import SolverParams as PoissonSolverParams

from device.leverarm_matrix import Solver as LeverArmSolver
import numpy as np
import pathlib

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
#
#       Input physical parameters
#
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# Input voltages
V_Y_gate_1                   = 0.535
V_Y_gate_2                   = 0.535
V_region_Reservoir_Left = 1.3 # Left reservoir voltage [V]
V_region_Reservoir_Right = 1.3 # Right reservoir voltage [V]
V_Barrier_1          = 0.040 # Left barrier voltage [V]
V_Barrier_2=0.4 #interdot Barrier [V]
V_Barrier_Vec_2          = np.linspace(0.37,0.42, 6)# Interdot barrier voltage [V]
V_Barrier_3          = 0.04 # Right barrier voltage [V]
V_Plunger_Left          = 0.70# Left dot voltage [V]
V_Plunger_Right          = 0.70+0.0001990577078 # Right dot voltage [V]
#Vbottom=0 #ground
mWF= mt.Si.chi+ mt.Si.Eg/2 #electron affinity plus half of energy gap

#doping
n_doping=5e18*1e6
p_doping=0
#Temperature K
T=0.015



script_dir = pathlib.Path(__file__).parent.resolve()
path_mesh = script_dir / "meshes" / "DQD_SiMOS.msh2"
path_geo = script_dir / "meshes" / "DQD_SiMOS.geo_unrolled"

path_splitting = script_dir / "output" / "splitting_tuning_barrier.txt"
path_lever_arm = script_dir / "output" / 'DQD_SiMOS_lever_arm.txt'
lever_arm_mat = np.loadtxt(path_lever_arm)
#print(lever_arm_mat)
lever_arm_ratio = (lever_arm_mat[1,1]-lever_arm_mat[0,1])/(lever_arm_mat[1,2]-lever_arm_mat[0,2])
V_Plunger_Right_Vec = V_Plunger_Right - lever_arm_ratio * (V_Barrier_Vec_2-V_Barrier_2)
#print(lever_arm_ratio * (V_Barrier_Vec_2- V_Barrier_2))


#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
#
#       Mesh
#
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
#Load Mesh
scalingFactor = 1e-9
mesh = Mesh(scalingFactor, str(path_mesh))
#mesh.show()
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
#
#     Device
#
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
d = Device(mesh, conf_carriers="e")
d.set_temperature(T)
d.statistics = "FD_approx" #Fermi Dirac statistic for carrier densities

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
#
#    Different Region and Boundaries Condition Definition
#
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

d.new_region('region_bulk_bottom',mt.Si)

d.new_region("region_pre_quantum_A_dop_left",       mt.Si, pdoping=p_doping, ndoping=n_doping)
d.new_region("region_pre_quantum_A_mid",            mt.Si)
d.new_region("region_pre_quantum_A_dop_right",      mt.Si, pdoping=p_doping, ndoping=n_doping)
d.new_region("region_pre_quantum_B_dop_left",       mt.Si)
d.new_region("region_pre_quantum_B_left",           mt.Si)
d.new_region("region_pre_quantum_B_mid",            mt.Si)
d.new_region("region_pre_quantum_B_right",          mt.Si)
d.new_region("region_pre_quantum_B_dop_right",      mt.Si)
d.new_region("region_pre_quantum_C_dop_left",       mt.Si, pdoping=p_doping, ndoping=n_doping)
d.new_region("region_pre_quantum_C_mid",            mt.Si)
d.new_region("region_pre_quantum_C_dop_right",      mt.Si, pdoping=p_doping, ndoping=n_doping)

d.new_region("region_quantum_A_dop_left",       mt.Si, pdoping=p_doping, ndoping=n_doping)
d.new_region("region_quantum_A_mid",            mt.Si)
d.new_region("region_quantum_A_dop_right",      mt.Si, pdoping=p_doping, ndoping=n_doping)
d.new_region("region_quantum_B_dop_left",       mt.Si)
d.new_region("region_quantum_B_left",           mt.Si)
d.new_region("region_quantum_B_mid",            mt.Si)
d.new_region("region_quantum_B_right",          mt.Si)
d.new_region("region_quantum_B_dop_right",      mt.Si)
d.new_region("region_quantum_C_dop_left",       mt.Si, pdoping=p_doping, ndoping=n_doping)
d.new_region("region_quantum_C_mid",            mt.Si)
d.new_region("region_quantum_C_dop_right",      mt.Si, pdoping=p_doping, ndoping=n_doping)

d.new_region("region_post_quantum_A_dop_left",       mt.Si, pdoping=p_doping, ndoping=n_doping)
d.new_region("region_post_quantum_A_mid",            mt.SiO2)
d.new_region("region_post_quantum_A_dop_right",      mt.Si, pdoping=p_doping, ndoping=n_doping)
d.new_region("region_post_quantum_B_dop_left",       mt.SiO2)
d.new_region("region_post_quantum_B_left",          mt.SiO2)
d.new_region("region_post_quantum_B_mid",           mt.SiO2)
d.new_region("region_post_quantum_B_right",          mt.SiO2)
d.new_region("region_post_quantum_B_dop_right",      mt.SiO2)
d.new_region("region_post_quantum_C_dop_left",       mt.Si, pdoping=p_doping, ndoping=n_doping)
d.new_region("region_post_quantum_C_mid",           mt.SiO2)
d.new_region("region_post_quantum_C_dop_right",     mt.Si, pdoping=p_doping, ndoping=n_doping)

d.new_region("region_bulk_top_A_dop_left",       mt.Si, pdoping=p_doping, ndoping=n_doping)
d.new_region("region_bulk_top_A_dop_right",      mt.Si, pdoping=p_doping, ndoping=n_doping)
d.new_region("region_bulk_top_B_dop_left",       mt.SiO2)
d.new_region("region_bulk_top_B_dop_right",      mt.SiO2)
d.new_region("region_bulk_top_C_dop_left",      mt.Si, pdoping=p_doping, ndoping=n_doping)
d.new_region("region_bulk_top_C_dop_right",      mt.Si, pdoping=p_doping, ndoping=n_doping)
d.new_region("region_bulk_top_mid",             mt.SiO2)
d.new_region('region_top_oxide', mt.Al2O3)

d.new_region('region_Y1_gate', mt.Al2O3)
d.new_region('region_Y2_gate', mt.Al2O3)
d.new_region('region_Reservoir_L_X_gate', mt.Al2O3)
d.new_region('region_Reservoir_R_X_gate', mt.Al2O3)
d.new_region('region_Barrier_L_X_gate', mt.Al2O3)
d.new_region('region_Barrier_M_X_gate', mt.Al2O3)
d.new_region('region_Barrier_R_X_gate', mt.Al2O3)
d.new_region('region_Plunger_L_X_gate', mt.Al2O3)
d.new_region('region_Plunger_R_X_gate', mt.Al2O3)

#d.new_ohmic_bnd('surface_ohmic_left')
#d.new_ohmic_bnd('surface_ohmic_right')
d.new_gate_bnd('surface_Y1_gate',           V_Y_gate_1                   , mWF)
d.new_gate_bnd('surface_Y2_gate',           V_Y_gate_2                   , mWF)
d.new_gate_bnd('surface_Reservoir_L_X_gate',V_region_Reservoir_Left , mWF)
d.new_gate_bnd('surface_Reservoir_R_X_gate',V_region_Reservoir_Right , mWF)
d.new_gate_bnd('surface_Barrier_L_X_gate',  V_Barrier_1          , mWF)
d.new_gate_bnd('surface_Plunger_R_X_gate',  V_Plunger_Right         , mWF)
d.new_gate_bnd('surface_Barrier_R_X_gate',  V_Barrier_3          , mWF)
d.new_gate_bnd('surface_Plunger_L_X_gate',  V_Plunger_Left          , mWF)
d.new_gate_bnd('surface_Barrier_M_X_gate',  V_Barrier_2          , mWF)

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
#
#      Defining the quantum dot
#
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

dot_region=["region_pre_quantum_B_mid","region_quantum_B_mid","region_post_quantum_B_mid"]
# Set up the dot region in which no classical charge is allowed
d.set_dot_region(dot_region)
params_poisson = PoissonSolverParams()
params_poisson.tol = 1e-7 # Convergence threshold (tolerance) for the error
params_poisson.initial_ref_factor = 0.55
params_poisson.final_ref_factor = 0.85

params_poisson.min_nodes = 0
params_poisson.maxiter = 1000
params_poisson.refined_region = dot_region
params_poisson.h_refined = 0.3
params_poisson.max_nodes=1e10

# # Configure the Schrödinger solver
params_schrod = SchrodingerSolverParams() 
params_schrod.num_states = 5 # Number of energy levels to consider
params_schrod.tol = 1e-9 # Set the tolerance for convergence
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
#
#     Splitting Calculation
#
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Initialize the energy level array
energy_arr = np.zeros((len(V_Barrier_Vec_2),6)) #6x6 matrix
energy_arr[:,0] = V_Barrier_Vec_2 #first column is the 6 different voltages
p = PoissonSolver(d, solver_params=params_poisson)

for idx, V_barrier_2 in enumerate(V_Barrier_Vec_2): #for each of the 6
    d.new_gate_bnd('surface_Plunger_R_X_gate',  V_Plunger_Right_Vec[idx]          , mWF)
    d.new_gate_bnd('surface_Barrier_M_X_gate',  V_barrier_2          , mWF)


    # Add the code related to the Poisson and Schrodinger solutions 
    # dot is object of the class SubDevice
    p.solve()
    d.set_V_from_phi()
    submesh = SubMesh(d.mesh, dot_region)
    dot = SubDevice(d,submesh)
    s = SchrodingerSolver(dot, solver_params=params_schrod)
    s.solve()


    energy_arr[idx,1:] = dot.energies/ct.e #store at each row the 5 energy levels related to the value of Vb in that row
    dot.print_energies()

# Write the code to calculate the difference and save the results
splitting = energy_arr[:,2] - energy_arr[:,1] #diff between the first exc and ground, an array of 6 elements for each value of Vb
header_text = "V_Barrier_M [V]\tSplitting (E1 - E0) [eV]"
data_to_save = np.column_stack((V_Barrier_Vec_2, splitting))
np.savetxt(path_splitting, data_to_save, header=header_text, comments='')
   


   



