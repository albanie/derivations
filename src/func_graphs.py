import numpy as np
import matplotlib
matplotlib.use('MacOSX')

import matplotlib.pyplot as plt
# from zsvision.zs_iterm import zs_dispFig

plt.rc('text', usetex=True)
plt.rc('font', family='serif')
plt.rcParams['legend.fontsize'] = 'large'
plt.rcParams['figure.titlesize'] = 'medium'

def sigmoid(x):
    return 1 / (1 + np.exp(-x))

def sigmoid_der(x):
    return sigmoid(x) * (1 - sigmoid(x))

x = np.linspace(-8, 8, 50)
plt.plot(x, sigmoid(x), linewidth=2)
plt.plot(x, sigmoid_der(x), linewidth=2)
plt.xlim([-8, 8])
plt.grid()
plt.legend(['$\sigma(x)$', "$\sigma'(x)$"], fontsize=20)
# plt.title('The sigmoid function, $\sigma$', fontsize=22)
plt.yticks(fontsize=20)
plt.xticks(fontsize=20)
plt.savefig('../figs/sigmoid.pdf')
