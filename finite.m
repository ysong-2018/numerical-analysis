
clearvars *;

%for nih = 1:6
nih =6;
    ih = 2*(2^nih);
    ndof = ih+1;
    ndofm = ndof -1;
    xh = 1/ih;
    ihm1 = ih-1;
    
    for ir = 1:ndof
        f(ir) = 0;
        for ic = 1:ndof
            gk(ir,ic) = 0;
        end
    end    
    
    sk(1,1) = 1/xh -xh/3.0;
    sk(1,2) = -1/xh - xh/6.0;
    sk(2,1) = sk(1,2);
    sk(2,2) = sk(1,1);
    
    for ie = 1:ih
        ir = ie -1 +1;
        irp1 = ir+1;
        ire =0;
        for ig = ir:irp1
            ire = ire+1;
            x1e = xh*(ie-1);
            if (ig == ir)
                f(ig) = f(ig) + xh/6* (3*x1e+xh);
            else
                f(ig) = f(ig) + xh/6*(3*x1e+2*xh);
            end
            jce = 0;
            for jg = ir:irp1
                jce =jce+1;
                gk(ig,jg) = gk(ig,jg) + sk(ire,jce);
            end 
        end
        
    end
    
    
    % apply bcs
    for i = 1:ndof
        gk(i,1)=0;
        gk(1,i)=0;
        gk(ndof,i)=0;
        gk(i,ndof) = 0;
    end
    
    gk(1,1) = 1;
    f(1)=0;
    gk(ndof,ndof)=1;
    f(ndof)=0;
    
    % solve gk*w=f solution returned in f
    ft = transpose(f);
    x = gk\ft;   % this is the estimated f to be used later
    % call the function to be written
    
    xzero=0;
    ifile = 10*nih;
    
    
    ihp1 = ih+1;
    for node = 1:ihp1
        xi = (node-1)*xh;
        ye  = sin(xi)/sin(1.0)-xi;
        % write file which is not used here
        xvec(node)=xi;
        yevec(node)=ye;
        fvec(node)=x(node);
        
    end
    
    plot(xvec,fvec,'b--o',xvec,yevec,'g--x')
    
%end













