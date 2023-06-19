function [signalv,vs,f] = Avg(table,s)

    y=table;
    N=length(y);
    signalv = zeros(1,N-(s-1)) ;
    
    for v=1:N-(s-1)
        Y = 0 ;
        for g =0:(s-1)
           Y = Y+(y(v+g));
        end
        signalv(v)=signalv(v)+Y/s;
    end
    for a = 0:s-2
        Yb = 0 ;
        for b = 0:a
            Yb = Yb + y(N-b) ;
        end
        signalv(N-a) = Yb/N-a ;
    end
    
    vs = fftshift(fft(signalv));
    f = -pi:2*pi/length(vs):pi-2*pi/length(vs);

end