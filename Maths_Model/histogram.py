import sys
import numpy as np
import math
import matplotlib 



dx = 37651
dy = 6350
mx = 6.25
print("-------------------------------------------------------------------\n")


M=float(mx)
X=float(dx)
Y=float(dy)


X=float(dx)
Y=float(dy)

if X>Y: 
    v=X/Y
    L=X
    big="X"
    small="Y"
else: 
    v=Y/X
    L=Y
    big="Y"
    small="X"
cl = np.cbrt(L)
b = 0.8*M/cl

q= math.modf(v)
p=q[0]
ny=int(q[1])
sample = []

mean,running_tot,ntot,nmean,na,count = 0,0,0,0,0,0
#ntot is running total of the cells of greatest density

for n in range(10000):
    nys=ny
    c=np.random.rand()
    if c<p:
        nys+=1
    
    a=np.random.rand(1,3)
    y=np.random.rand(nys,3)
    d=np.square(np.subtract(a,y))
    d1=np.sqrt(d.sum(axis=1))
        
    if X==L: 
        m1=d1.min()
        if m1>b:
            running_tot+= m1
            count+=1
            sample.append(m1)
            ntot+=nys
            na+=1
            
    else:
        for k in range(nys):
            mp=0
            m1=d1[k]
            if m1>b:  
                count+=1
                running_tot+= m1
                sample.append(m1)
                ntot+=1
                mp+=1
        if mp>0:
            na+=1
        
if X==L:
    average = (running_tot*cl)/na
else:
    average = (running_tot*cl)/ntot

samplescaled = np.multiply(cl,sample)

aver=int(average*1000)
average = aver/1000

av=int(v*1000)
v=av/1000

nmean=ntot/na

av=int(nmean*1000)
nmean = av/1000

print("\nInput has cell-types X and Y with relative density of",small,"to",big,"=",v)
print("\nThe estimate of m(X,Y) over",count,"samples which had on average",nmean,small)
print("cells per",big,"cell:",average,"micrometers")

plt.hist(samplescaled, weights=np.ones(len(samplescaled)) / len(samplescaled))
plt.gca().yaxis.set_major_formatter(PercentFormatter(1))
plt.show()

plt.savefig(sys.stdout.buffer)
sys.stdout.flush()