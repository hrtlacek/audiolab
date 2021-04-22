import numpy as np

def powerToDb(a):
    return 10*np.log10(a)

def aToDb(a):
    """Linear Value to dezibel

    Parameters
    ----------
    a : float/array
        linear input value(s)

    Returns
    -------
    float/array
        dezibel output values.
    """
    return 20*np.log10(a)

