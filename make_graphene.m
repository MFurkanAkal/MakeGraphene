function atoms=make_graphene(a,N1,N2)

  basis=[0 0 0
         a 0 0];
  
  Nats=size(basis,1);
  Nats_supercell=Nats*N1*N2;
  
  a1=[3/2 sqrt(3)/2 0]*a;
  a2=[3/2 -sqrt(3)/2 0]*a;
  
  atoms=[];
  
  for n1=0:N1-1
    for n2=0:N2-1
      
      atoms=[atoms;
             basis+repmat(n1*a1+n2*a2,Nats,1)];

    endfor
  endfor
  
  fid=fopen("graphene.xyz","w");
  fprintf(fid,"%d\n\n",Nats_supercell);

  for n=1:Nats_supercell
    fprintf(fid,"C %f %f %f\n",atoms(n,1),atoms(n,2),atoms(n,3));
  endfor

  fclose(fid);

endfunction
