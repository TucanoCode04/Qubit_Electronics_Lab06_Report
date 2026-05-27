import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit


data = np.loadtxt("./output/splitting_tuning_barrier.txt", skiprows=1)
x_data = data[:,0] #voltages [V]
y_data = data[:,1] #splittings [eV]

def exp_fun(x,a,b):
    return a*np.exp(b*(x)) # from WKB approximation, x is proportional to the energy barrier height

param_opt, param_cov = curve_fit(exp_fun, x_data, y_data, p0=[y_data[0], 10])
print(f'fitted parameters: a = {param_opt[0]}, b = {param_opt[1]}')
x_fit = np.linspace(min(x_data), max(x_data), 100)
y_fit = exp_fun(x_fit, param_opt[0], param_opt[1])

plt.figure(figsize=(8, 6))
plt.grid()
plt.plot(x_fit, y_fit,'-', label='Exponential fit')
plt.plot(x_data, y_data, 'o', label='Experimental data')
plt.xlabel('Barrier gate voltage [V]')
plt.ylabel('Energy splitting [eV]')
plt.legend()
plt.show()



