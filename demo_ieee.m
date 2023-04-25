function demo_ieee(arg)

global bb lab

if nargin==0, arg='inicio'; end

switch arg,
   
    case 'inicio'
           
        f=centra_figura(800,400);
        %f=figure('Units','Pixels','Position',[0 200 800 400]);
        set(f','Menubar','none'); %,'Number','off');
        set(f,'Name','IEEE 754 Precisión Simple (4 bytes, 32 bits)                                                                          (C) Antonio Tabernero 2012');
        
        ini=0.01; DY =0.90;
        
        uicontrol('Style','Text','Units','norm','Pos',[ini DY 0.15 0.08],...
                  'String','Entrada ','FontSize',18,'FontWeight','Bold');
        
        edit=uicontrol('Style','Edit','Units','norm');
        set(edit,'Position',[ini+0.17 DY 1-2*ini-0.17 0.09],'BackgroundCol',[1 1 1],...
                 'FontSize',24,'HorizontalAlig','Left',...
                 'Callback','demo_ieee procesa');
        
        DY = 0.55;     
        uicontrol('Style','Frame','Units','norm','String','QQQQ0',...    
                  'Position',[0.01 DY 0.98 0.30]);     

     
              
              
        DY = 0.05; 
        uicontrol('Style','Frame','Units','norm','String','QQQQ0',...    
                  'Position',[0.01 DY 0.98 0.43]);
        bb = zeros(1,32);     
        ini=0.04; dx = ((1-2*ini)/32); delta=0.0;
        ini=0.02; %0.02;
        for k=1:32,       
          pos = [ini+(k-1)*dx+delta DY+0.33 0.85*dx 0.06];  
          bb(k)=uicontrol('Style','Text','Units','norm','Position',pos);       
          if ( k==1), delta=delta+0.01;  end
          if ( k==9), delta=delta+0.04;  end
        end   
        set(bb,'BackgroundCol',[1 1 1],'Fontsize',16,'String','1',...
            'HorizontalAlig','Center');
        set(bb(1),'ForegroundCol','r');
        set(bb(2:9),'ForegroundCol','b');
        
        DY=DY+0.25;  lab = zeros(1,5);
         
         for k=1:3, lab(k) = uicontrol('Style','Text','Units','norm'); end
         set(lab(1),'Pos',[0.02 DY 0.9*dx 0.06]);
         set(lab(2),'Pos',[0.055 DY 8*dx-dx+0.01 0.06]);
         set(lab(3),'Pos',[0.275 DY 23*dx+1.85*dx-0.01 0.06]);
       
                
         set(lab(1:3),'BackgroundCol',[1 1 1],'FontSize',16,...
                      'HorizontalAlig','Left');
        
        
          ini=0.02; DY =0.15;
        
         A=0.30; xx=ini;
         uicontrol('Style','Text','Units','norm','Pos',[xx DY+0.01 A 0.08],...
                   'String','Número máquina ','FontSize',16,...
                   'HorizontalAlig','Left','FontWeight','Bold');
         
         xx=xx+A+0.005;   A = 0.40;
         lab(4)=uicontrol('Style','Text','Units','norm');
         set(lab(4),'Position',[xx DY+0.02 A 0.08],'BackgroundCol',[1 1 1],...
                  'FontSize',20,'HorizontalAlig','Left','FontWeight','Bold');
         

              
          DY =0.05; xx=ini; A = 0.18;
          uicontrol('Style','Text','Units','norm','Pos',[xx DY+0.01 A 0.07],...
                   'String','Err absoluto','FontSize',16,...
                   'HorizontalAlig','Left','FontWeight','Bold');

          xx=xx+A+0.001; A = 0.22;
          lab(5)=uicontrol('Style','Text','Units','norm');
          set(lab(5),'Position',[xx DY+0.02 A 0.07],'BackgroundCol',[1 1 1],...
                  'FontSize',20,'HorizontalAlig','Left','FontWeight','Bold');     

          xx=xx+A+0.05;  A = 0.18;
          uicontrol('Style','Text','Units','norm','Pos',[xx DY+0.01 A 0.07],...
                   'String','Err relativo','FontSize',16,...
                   'HorizontalAlig','Left','FontWeight','Bold');

          xx=xx+A+0.001; A = 0.22;
          lab(6)=uicontrol('Style','Text','Units','norm');
          set(lab(6),'Position',[xx DY+0.02 A 0.07],'BackgroundCol',[1 1 1],...
                  'FontSize',20,'HorizontalAlig','Left','FontWeight','Bold');         
     
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          
             ini=0.02; DY =0.72;        
        A=0.3; xx=ini;
        uicontrol('Style','Text','Units','norm','Pos',[xx DY+0.01 A 0.08],...
                   'String','Número introducido ','FontSize',16,...
                   'HorizontalAlig','Left','FontWeight','Bold');
         
         xx=xx+A+0.005; A = 0.40;
         lab(7)=uicontrol('Style','Text','Units','norm');
         set(lab(7),'Position',[xx DY+0.02 A 0.08],'BackgroundCol',[1 1 1],...
                  'FontSize',20,'HorizontalAlig','Left','FontWeight','Bold');
               
         DY=DY-0.09; A = 0.8;
         uicontrol('Style','Text','Units','norm','Pos',[0.02 DY+0.01 A 0.08],...
                   'String','Representación base 2 ( signo x mantisa x 2^exponente) :','FontSize',16,...
                   'HorizontalAlig','Left','FontWeight','Bold');
         
          
         DY = DY-0.06;
         
         for k=8:10, lab(k) = uicontrol('Style','Text','Units','norm'); end
         set(lab(8),'Pos',[0.02 DY 0.9*dx 0.06]);
         %set(lab(9),'Pos',[0.07 DY 8*dx-0.15*dx 0.06]);
         %set(lab(10),'Pos',[0.32 DY 23*dx-0.15*dx 0.06]);
         set(lab(9),'Pos',[0.055 DY 8*dx-dx 0.06]);
         set(lab(10),'Pos',[0.265 DY 23*dx+1.85*dx 0.06]);
         
         set(lab(8:10),'BackgroundCol',[1 1 1],'FontSize',16,...
                      'HorizontalAlig','Left');
              
    case 'procesa'
        v = get(gcbo,'String');
        
        v = eval(v);
        %v = sscanf(v,'%f');
        
                
        if ~isnumeric(v), set(gcbo,'String',''); return; end
        
        [s e mant_ok]=get_mantisa(v);
        

        if ~isempty(s),            
          set(lab(8),'String',s);
          msg = sprintf('Exponente=%4d',e);
          set(lab(9),'String',msg);
          msg = [sprintf('Mant = %d.',mant_ok(1)) ...
                sprintf('%d',mant_ok(2:29)) sprintf('...  (Completa)')];
          set(lab(10),'String',msg);
        else
          set(lab(8:10),'String','');  
        end    
        
        
        
        x=single(v); xx=typecast(x,'uint32');  
        
       
        
        Eabs=abs(double(x)-v);       
        
        if v~=0, err= Eabs/v; else err=0; end
        bits=(bitget(xx,[32:-1:1]));
        bt = char(bits+48);
        for k=1:32, set(bb(k),'String',bt(k)); end
        
        if bits(1)==0, sgn='+'; else sgn='-'; end
        
        e = bin2dec(bt(2:9));
        
        set(lab(1),'String',sgn);
        msg2 = sprintf('Exp%4d ->',e);
        if ((e==255) || (e==0)) %msg2=[msg2 ' ESP']; 
          if (e==0), msg2=[msg2 '-126']; end  
          if (e==255), msg2=[msg2 'ESP']; end    
        else msg2 = [msg2 sprintf('%4d',e-127)];
        end    
        set(lab(2),'String',msg2);

        if e>0, mant='1.'; else mant='0.'; end
        mant = [mant sprintf('%c',bt(10:32))];
        set(lab(3),'String',['Mant = ' mant  ' (usando 23+1 bits)']);
        
        msg = sprintf('%18.12e',x);              
        %N =find(msg=='e'); if ~isempty(N), msg = msg( [ [1:N+1] [N+3:end]] ); end          
        set(lab(4),'String',msg);
            
        msg = sprintf('%7.4e',Eabs);
       % N =find(msg=='e'); if ~isempty(N), msg = msg( [ [1:N+1] [N+3:end]] ); end  
        set(lab(5),'String',msg);
        
        msg = sprintf('%7.4e',err);
       % N =find(msg=='e'); if ~isempty(N), msg = msg( [ [1:N+1] [N+3:end]] ); end  
        set(lab(6),'String',msg);
%        set(lab(5),'String',msg(1:end));

       
        msg = sprintf('%18.12e',v);
        N =find(msg=='e'); 
           if ~isempty(N), 
             if msg(N+2)=='0', msg = msg( [ [1:N+1] [N+3:end]] );  end
           end  
        set(lab(7),'String',msg);
        
end


function [s,e,m]=get_mantisa(v);
    
     s=[]; e=[]; m=[];  
    if isinf(v) || isnan(v), return; end
     
   

    s=' '; e=0; m=zeros(1,32);
    if (v==0), return;  end
             
    
    if (v>=0) s='+'; else s='-'; end %s = sign(v);        
    
    vv=abs(v); e=0;
    if (vv>=2), while(vv>=2), vv=vv/2; e=e+1; end;          
    else  while (vv<1), vv=vv*2; e=e-1; end
    end

    vv = vv-1; m(1)=1;
    for k=1:30,
      vv=vv*2; if (vv>=1), m(k+1)=1; vv=vv-1.0; end  
    end

    %fprintf('Exp= %3d.',e);
    %fprintf('  Mantisa = 1.'); fprintf('%d',mant_ok); fprintf('...\n');
        
        
function f=centra_figura(AX,AY)
  S=get(0,'ScreenSize');
  r = AY/AX;
  ancho=min(AX,S(3)-50); dx = (S(3)-ancho)/2;
  alto = round(ancho*r); dy = (S(4)-alto)/2;

  f=figure('Units','Pixels','Position',[dx dy ancho alto]);
return