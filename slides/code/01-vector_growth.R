source("code/initialise.R")
par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.9, las=1, xaxs='i',yaxs='i')

N = 10^seq(2, 5, length.out = 10)
b = c(0.200, 0.403, 0.891, 1.901, 4.112,8.937,19.050,45.562,120.665,410.480)

plot(N, b, log="xy", xlab="Vector length", ylab="Time(secs)", 
     ylim=c(0.0008, 1000), xlim=c(90, 1.05e5),
     axes=FALSE, frame=FALSE, pch=19, col=1, 
     panel.first = abline(h=c(10^c(-3, -1, 1, 3)),  lty=1, col="grey80"))



axis(1, 10^(2:5), label=c(expression(10^2),
                          expression(10^3),
                          expression(10^4),
                          expression(10^5)),  col.axis="grey50", cex.axis = 0.8, tick=FALSE)
axis(2, 10^c(-3, -1, 1, 3), label=c(expression(10^-3),#expression(10^-2),
                           expression(10^-1),
                           #expression(10^0),
                           expression(10^1),
                           #expression(10^2),
                           expression(10^3)),  col.axis="grey50", cex.axis = 0.8, tick=FALSE)
b1 = c(0.001,0.003,0.005,0.011,0.025,0.054,0.113,0.247,0.533,1.146)
points(N, b1, col=2, pch=19)
#mtext("Time(secs)", side = 2, las=3,padj=-2.5)
#mtext("n", side = 1, padj=2.2)

title("Never grow a vector", adj=1, 
      cex.main=0.9, font.main=2, col.main="black")
text(15^2, 10^0, "Method 3", col=1, font = 2, cex=0.9)
text(15^2, 13^(-2), "Method 2", col=2, font = 2, cex=0.9)
