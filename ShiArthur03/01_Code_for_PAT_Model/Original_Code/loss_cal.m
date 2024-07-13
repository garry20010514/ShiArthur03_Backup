function loss=loss_cal(u,i,t,index,flag)
loss(1)=0;
for ii=2:length(index)
    delta_t=t(index(ii))-t(index(ii-1));
    delta_loss=u(index(ii))*i(index(ii))*delta_t;
    if delta_loss<0
        delta_loss=0;
    end
    if (delta_loss<0 || (u(index(ii))*i(index(ii)))<1.5e3) && flag==1
        delta_loss=0;
    end
    if (delta_loss<0) && flag==0
        delta_loss=0;
    end
    loss(ii)=loss(ii-1)+delta_loss;
end
loss=loss*1e3;  % µ¥Î»£ºmJ