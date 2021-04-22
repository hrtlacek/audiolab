import numpy as np

def freqToBin(fAxis, Freq):
    """Given a frequency axis and a frequency, returns the bin of the closest frequency.

    Parameters
    ----------
    fAxis : np.array
        array of frequencies corresponsing to bins, such as returned by scipy.signal.periodogram()
    Freq : float
        the frequency

    Returns
    -------
    int
        the corresponding bin index.
    """
    return np.argmin(abs(fAxis-Freq))



def bandpower(ps, mode='psd'):
    """Bandpower claculation, like in matlab, see https://de.mathworks.com/help/signal/ref/bandpower.html
    
    Parameters
    ----------
    ps : time domain signal or power spectrum
        np.arry
    mode : str, optional
        switch between time domain('time') or spectrum mode. by default 'psd'

    Returns
    -------
    float
        power of the signal.
    """
    if mode=='time':
        x = ps
        l2norm = np.linalg.norm(x)**2./len(x)
        return l2norm
    elif mode == 'psd':
        return sum(ps)        

def getIndizesAroundPeak(arr, peakIndex,searchWidth=1000):
    """Given a spectrum and an index of a peak, tries to get all monotonic falling bins around it.

    Parameters
    ----------
    arr : np.array
        input spectrum
    peakIndex : int
        peak index
    searchWidth : int, optional
        search width around the peak, by default 1000

    Returns
    -------
    np.arraay
        An array of indizes of the spectrum.
    """
    peakBins = []
    magMax = arr[peakIndex]
    curVal = magMax
    for i in range(searchWidth):
        newBin = peakIndex+i
        newVal = arr[newBin]
        if newVal>curVal:
            break
        else:
            peakBins.append(int(newBin))
            curVal=newVal
    curVal = magMax
    for i in range(searchWidth):
        newBin = peakIndex-i
        newVal = arr[newBin]
        if newVal>curVal:
            break
        else:
            peakBins.append(int(newBin))
            curVal=newVal
    return np.array(list(set(peakBins)))


