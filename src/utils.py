import numpy as np

def sigmoid(x):
    """Compute the element-wise sigmoid.

    Args:
        x (ndarray): input.

    Returns:
        (ndarray): result of element-wise sigmoid operation
        with the same shape as `x`. Each element lies in [0,1].
    """
    return 1 / (1 + np.exp(-x))

def sigmoid_der(x):
    """Computer the element-wise 
    return sigmoid(x) * (1 - sigmoid(x))
