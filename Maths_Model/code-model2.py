import numpy as np
import math

print("To estimate m(X,Y) please provide (in micrometers):")
print("- the reciprocal of the density of cell-type X:") 
dx = input()

print("- the reciprocal of the density of cell-type Y:")
dy = input()

print("- the larger of the mean radii of cell types X and Y")
mx=input()

print("------------------------------------------------------------\n")

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
sample1 = []

mean,mean1,running_tot,running_tot1,ntot,ntot1, nmean,nmean1,na,na1 = 0,0,0,0,0,0,0,0,0,0

#ntot is running total of the cells of greatest density

for n in range(1000000):
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
        running_tot+= m1
        sample.append(m1)
        ntot+=nys
        na+=1
        
        if m1>b:
            running_tot1+= m1
            sample1.append(m1)
            ntot1+=nys
            na1+=1
            
    else:
        for k in range(nys):
            m1=d1[k]
            mp=0
            running_tot+=m1
            sample.append(m1)
            ntot+=1
            na+=1
            if m1>b:  
                running_tot1+= m1
                sample1.append(m1)
                ntot1+=1
                mp+=1
            if mp>0:
                na1+=1
        
if X==L:
    average = (running_tot*cl)/na
    average1=(running_tot1*cl)/na1
else:
    average = (running_tot*cl)/ntot
    average1 = (running_tot1*cl)/ntot1

samplescaled = np.multiply(cl,sample)
sample1scaled = np.multiply(cl,sample1)

aver=int(average*1000)
average = aver/1000

aver1 = int(average1*1000)
average1= aver1/1000

av=int(v*1000)
v=av/1000

nmean=ntot/na
nmean1=ntot1/na1

aver1=int(nmean1*1000)
nmean1=aver1/1000

av=int(nmean*1000)
nmean = av/1000

print("\nInput has cell-types X and Y with relative density of",small,"to",big,"=",v,".")

print("\nThe estimate of m(X,Y) with a lower bound on cell distances over", na1,"samples")
print("which had on average",nmean1,small,"cells per",big,"cell:",average1,"micrometers")
print("\nThe estimate of m(X,Y) with no lower bound on cell distances over", na,"samples")
print("which had on average",nmean,small,"cells per",big,"cell:",average,"micrometers.")
