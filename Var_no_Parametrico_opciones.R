library(quantmod)

p<-runif( 10000,min=0 ,max=1)
z<-qnorm(p)

#estimaciones
rf<-.05
sigma<-.15
so<-50
t<-1
st<-so*exp((rf-.5*sigma^2)+z*sigma)

#valor intrínseco long call y short call
uc<-st-48
up<-48-st

vilc<-ifelse(uc>0,exp(-rf*t)*uc,0)
visc<-ifelse(uc>0,-exp(-rf*t)*uc,0)

#valor intrínseco long put y short put

vilp<- ifelse(up<0,exp(-rf*t)*up,0)
visp<- ifelse(up<0,-exp(-rf*t)*up,0)

# diferencia entre el valor intrínseco calculado de la opción y su valor real (prim

dlc<-vilc-5
dsc<-visc-5
dlp<-vilp-3
dsp<-visp-3

varlc<-quantile(dlc,0.01)
varsc<-quantile(dsc,0.01)
varlp<-quantile(dlp,0.01)
varsp<-quantile(dsp,0.01)









