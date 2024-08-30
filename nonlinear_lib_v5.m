classdef nonlinear_lib_v5
   methods (Static)
            %remove velocity and acceleration from trigonmetri library
      function liby = nonlinearize(x,bias_term)         
         global numInput;
          global Zlib;
          global libnames;
%         libx = pwd +"/libs/lib3dof.mat";
%         libx = load(libx);
%         varNames = fieldnames(libx);
    
        % Save the variables to the MATLAB workspace
%         for i = 1:numel(varNames)
%             varValue = libx.(varNames{i});
%             assignin('base', varNames{i}, varValue);
%         end
      %  lib = evalin('base', 'library');
            %p,q,r adalah state posisi,
            %u,v,w adalah state kecepatan,
            %x,y,z adalah state percepatan, 
        
        lib = evalin('base', 'lib');
        libnames = evalin('base', 'libnames');

        [x1,y1] = size(lib);
        var_pattern = '\<\w+\>'; 
        Zlib =y1;
        [x2,n]  = size(x);
        stte = n/3;
        
        
        numInput = n;
        u_inp=0;
        liby = zeros(x2,n);
        
            for i= 1:Zlib %
                func_str = func2str(lib{i});
                varx = regexp(func_str, var_pattern, 'match');
                if nargin(lib{i})==1
                     if varx{1} =='p' ||  varx{1} =='q' ||  varx{1} =='r'
                        M{1} = x(:,1:stte);
                     elseif varx{1} =='u' ||  varx{1} =='v' ||  varx{1} =='w'
                        M{1} = x(:,stte+1:stte*2);
                     elseif varx{1} =='x' ||  varx{1} =='y' ||  varx{1} =='z'
                        M{1} = x(:,stte*2+1:n);
                     end                       
                     liby(:,end+1:end+size(lib{i}(M{1}),2))=lib{i}(M{1});

                elseif nargin(lib{i})==2
                        for asd=1:2                           
                             if varx{asd} =='p' ||  varx{asd} =='q' ||  varx{asd} =='r'
                                M{asd} = x(:,1:stte);
                             elseif varx{asd} =='u' ||  varx{asd} =='v' ||  varx{asd} =='w'
                                M{asd} = x(:,stte+1:stte*2);
                             elseif varx{asd} =='x' ||  varx{asd} =='y' ||  varx{asd} =='z'
                                M{asd} = x(:,stte*2+1:n);
                             end                             
                        end      
                        assignin('base', 'Md',M) ;
                      for m = 1:size(M{1},2)
                        for p= 1:size(M{2},2)                            
                            liby(:,end+1:end+size(lib{i}(M{1}(:,m), M{2}(:,p)),2))=lib{i}(M{1}(:,m), M{2}(:,p));
                        end
                      end
                elseif nargin(lib{i})==3 
                     for asd=1:3                           
                             if varx{asd} =='p' ||  varx{asd} =='q' ||  varx{asd} =='r'
                                M{asd} = x(:,1:stte);
                             elseif varx{asd} =='u' ||  varx{asd} =='v' ||  varx{asd} =='w'
                                M{asd} = x(:,stte+1:stte*2);
                             elseif varx{asd} =='x' ||  varx{asd} =='y' ||  varx{asd} =='z'
                                M{asd} = x(:,stte*2+1:n);
                             end                               
                     end                  
                      for m = 1:size(M{1},2)
                        for p= 1:size(M{2},2) 
                            for dd= 1:size(M{3},2)                               
                            liby(:,end+1:end+size(lib{i}(M{1}(:,m), M{2}(:,p),M{3}(:,dd)),2))=lib{i}(M{1}(:,m), M{2}(:,p),M{3}(:,dd));
                            end
                        end
                      end
                elseif nargin(lib{i})==4 
                     for asd=1:4                           
                             if varx{asd} =='p' ||  varx{asd} =='q' ||  varx{asd} =='r'
                                M{asd} = x(:,1:stte);
                             elseif varx{asd} =='u' ||  varx{asd} =='v' ||  varx{asd} =='w'
                                M{asd} =x(:,stte+1:stte*2);
                             elseif varx{asd} =='x' ||  varx{asd} =='y' ||  varx{asd} =='z'
                                M{asd} = x(:,stte*2+1:n);
                             end                                
                     end
                     
                     for m = 1:size(M{1},2)
                        for p= 1:size(M{2},2) 
                            for dd= 1:size(M{3},2)
                               for dp= 1:size(M{4},2)
                                liby(:,end+1:end+size(lib{i}(M{1}(:,m), M{2}(:,p),M{3}(:,dd),M{4}(:,dp)),2))=lib{i}(M{1}(:,m), M{2}(:,p),M{3}(:,dd),M{4}(:,dp));                            
                               end
                            end
                        end
                      end
                elseif nargin(lib{i})==5                     
                      for asd=1:5                            
                             if varx{asd} =='p' ||  varx{asd} =='q' ||  varx{asd} =='r'
                                M{asd} = x(:,1:stte);
                             elseif varx{asd} =='u' ||  varx{asd} =='v' ||  varx{asd} =='w'
                                M{asd} = x(:,stte+1:stte*2);
                             elseif varx{asd} =='x' ||  varx{asd} =='y' ||  varx{asd} =='z'
                                M{asd} = x(:,stte*2+1:n);
                             end                               
                      end
                       for m = 1:size(M{1},2)
                        for p= 1:size(M{2},2) 
                            for dd= 1:size(M{3},2)
                               for dp= 1:size(M{4},2)
                                  for df= 1:size(M{5},2)
                             liby(:,end+1:end+size(lib{i}(M{1}(:,m), M{2}(:,p),M{3}(:,dd),M{4}(:,dp),M{5}(:,df)),2))=lib{i}(M{1}(:,m), M{2}(:,p),M{3}(:,dd),M{4}(:,dp),M{5}(:,df)); 
                                  end
                              end
                          end
                        end
                       end
                end
                end
             global b_term;
             b_term=bias_term;
            
             liby(:,1:n) = [];
            if bias_term == 1                
                liby = [ones(size(liby,1),1) liby];
            end
                
      end

      
      function model_str = equprint(koef,smallinds,b_term)
              global numInput;
                global Zlib;
         global libnames;
             stte = size(smallinds,2);
             xn = stte*3;
        ux=0;
      %  global b_term;
        %extract bias term
         koef_inds =1;
          if b_term == 1
            bias = koef(1,:);       
          
            koef(1,:)=[];
            koef_inds = smallinds(1,:);
            smallinds(1,:)=[]; 
          end
        [k,n] = size(koef) ;
        ni = numInput;
        
        [lx,ly]=size(libnames);
        model_str="";
        
        for j = 1:n
            model_str = strcat(model_str, '\n' ,strcat(' x',num2str(j),'_dot = '));
            if b_term == 1
                if(koef_inds(1,j)==0)
                    model_str = strcat(model_str, num2str(bias(1,j)),' + ');
                end
            end

            c=0;
            cnt=0;
             var_pattern = '\<\w+\>'; 
            fs =  nonlinear_lib_v5;
            
            for h = 1:Zlib %ly
                u_s = 0;
                func_str = func2str(libnames{h});
                varx = regexp(func_str, var_pattern, 'match');
                if nargin(libnames{h})==1    
                   
                        if varx{1} =='p' ||  varx{1} =='q' ||  varx{1} =='r'
                            M{1} = 1:stte;
                         elseif varx{1} =='u' ||  varx{1} =='v' ||  varx{1} =='w'
                             M{1} =stte+1:stte*2;
                              
                         elseif varx{1} =='x' ||  varx{1} =='y' ||  varx{1} =='z'
                             M{1} = stte*2+1:xn;
                         end     
                         
                         for m = 1:size(M{1},2)                         
                          
                           cnt=cnt+1;
                           
                            
                          if(smallinds(cnt,j) == 0)
                            
                                c=c+1;
                                if (c>1)
                                     model_str = strcat(model_str,' + ');
                                end
                                
%                                 xm = strcat('x(',num2str(M{1}(:,m)),')');
                                xm = fs.toQ(M{1}(:,m),n*3);

                                strx = (convertStringsToChars(libnames{h}(xm)));
                                printx = '*';
                                for ch=1:length(strx)
                                    printx = strcat(printx,strx(ch));
                                end
                                model_str = strcat(model_str,' ', string(koef(cnt,j)),' ', printx );
                          end
                         end
                    
                elseif nargin(libnames{h})==2  
                    
                      for asd=1:2                           
                         if varx{asd} =='p' ||  varx{asd} =='q' ||  varx{asd} =='r'
                            M{asd} = 1:stte;
                         elseif varx{asd} =='u' ||  varx{asd} =='v' ||  varx{asd} =='w'
                             M{asd} = stte+1:stte*2;
                         elseif varx{asd} =='x' ||  varx{asd} =='y' ||  varx{asd} =='z'
                             M{asd} = stte*2+1:xn;
                         end                             
                      end    
                      
                      for m = 1:size(M{1},2)
                        for p= 1:size(M{2},2)
                           
                            cnt=cnt+1;
                              if(smallinds(cnt,j) == 0)
                                c=c+1;
                                if (c>1)
                                     model_str = strcat(model_str,' + ');
                                end
%                                  xm = strcat('x(',num2str(M{1}(:,m)),')');
%                                  xp = strcat('x(',num2str(M{2}(:,p)),')');
                                 xm = fs.toQ(M{1}(:,m),n*3);
                                 xp = fs.toQ(M{2}(:,p),n*3);
                                 strx = (convertStringsToChars(libnames{h}(xm,xp)));
                                printx = '*';
                                for ch=1:length(strx)
                                    printx = strcat(printx,strx(ch));
                                end
                                model_str = strcat(model_str,' ', string(koef(cnt,j)),' ', printx );
                              end
                        end
                      end
                    
                elseif nargin(libnames{h})==3                      
                      for asd=1:3                           
                         if varx{asd} =='p' ||  varx{asd} =='q' ||  varx{asd} =='r'
                            M{asd} = 1:stte;
                         elseif varx{asd} =='u' ||  varx{asd} =='v' ||  varx{asd} =='w'
                             M{asd} = stte+1:stte*2;
                         elseif varx{asd} =='x' ||  varx{asd} =='y' ||  varx{asd} =='z'
                             M{asd} = stte*2+1:xn;
                         end                                  
                      end                        
                      for m = 1:size(M{1},2)
                        for p= 1:size(M{2},2)
                          for dd= 1:size(M{3},2)
                              
                            cnt=cnt+1;
                              if(smallinds(cnt,j) == 0)
                                c=c+1;
                                if (c>1)
                                     model_str = strcat(model_str,' + ');
                                end
%                                  xm  = strcat('x(',num2str(M{1}(:,m)),')');
%                                  xp  = strcat('x(',num2str(M{2}(:,p)),')');
%                                     xdd = strcat('x(',num2str(M{3}(:,dd)),')');
                                 xm = fs.toQ(M{1}(:,m),n*3);
                                 xp = fs.toQ(M{2}(:,p),n*3);
                                 xdd = fs.toQ(M{3}(:,dd),n*3);
                                strx = (convertStringsToChars(libnames{h}(xm,xp,xdd)));
                                printx = '*';
                                for ch=1:length(strx)
                                    printx = strcat(printx,strx(ch));
                                end
                                model_str = strcat(model_str,' ', string(koef(cnt,j)),' ', printx );
                              end
                          end
                        end
                      end
                elseif nargin(libnames{h})==4 
                      for asd=1:4                           
                         if varx{asd} =='p' ||  varx{asd} =='q' ||  varx{asd} =='r'
                            M{asd} = 1:stte;
                         elseif varx{asd} =='u' ||  varx{asd} =='v' ||  varx{asd} =='w'
                             M{asd} = stte+1:stte*2;
                         elseif varx{asd} =='x' ||  varx{asd} =='y' ||  varx{asd} =='z'
                             M{asd} =stte*2+1:xn;
                         end                                  
                      end                        
                      for m = 1:size(M{1},2)
                        for p= 1:size(M{2},2)
                          for dd= 1:size(M{3},2)
                              for de= 1:size(M{4},2)
                                 
                                cnt=cnt+1;
                                  if(smallinds(cnt,j) == 0)
                                    c=c+1;
                                    if (c>1)
                                         model_str = strcat(model_str,' + ');
                                    end
%                                      xm  = strcat('x(',num2str(M{1}(:,m)),')');
%                                      xp  = strcat('x(',num2str(M{2}(:,p)),')');
%                                      xdd = strcat('x(',num2str(M{3}(:,dd)),')');
%                                      xde = strcat('x(',num2str(M{4}(:,de)),')');
                                    xm  = fs.toQ(M{1}(:,m),n*3);
                                    xp  = fs.toQ(M{2}(:,p),n*3);
                                    xdd = fs.toQ(M{3}(:,dd),n*3);
                                    xde = fs.toQ(M{4}(:,de),n*3);
                                     strx = (convertStringsToChars(libnames{h}(xm,xp,xdd,xde)));
                                    printx = '*';
                                    for ch=1:length(strx)
                                        printx = strcat(printx,strx(ch));
                                    end
                                    model_str = strcat(model_str,' ', string(koef(cnt,j)),' ', printx );
                                  end
                              end
                          end
                        end
                      end
                elseif nargin(libnames{h})==5 
                     for asd=1:5                           
                         if varx{asd} =='p' ||  varx{asd} =='q' ||  varx{asd} =='r'
                            M{asd} = 1:stte;
                         elseif varx{asd} =='u' ||  varx{asd} =='v' ||  varx{asd} =='w'
                             M{asd} = stte+1:stte*2;
                         elseif varx{asd} =='x' ||  varx{asd} =='y' ||  varx{asd} =='z'
                             M{asd} = stte*2+1:xn;
                         end                                 
                      end                        
                      for m = 1:size(M{1},2)
                        for p= 1:size(M{2},2)
                          for dd= 1:size(M{3},2)
                              for de= 1:size(M{4},2)
                                  for df= 1:size(M{5},2)
                                    
                                cnt=cnt+1;
                                   
                                      if(smallinds(cnt,j) == 0)
                                        c=c+1;
                                        if (c>1)
                                             model_str = strcat(model_str,' + ');
                                        end
%                                          xm  = strcat('x(',num2str(M{1}(:,m)),')');
%                                          xp  = strcat('x(',num2str(M{2}(:,p)),')');
%                                          xdd = strcat('x(',num2str(M{3}(:,dd)),')');
%                                          xde = strcat('x(',num2str(M{4}(:,de)),')');
%                                          xdf = strcat('x(',num2str(M{5}(:,df)),')');

                                    xm  = fs.toQ(M{1}(:,m),n*3);
                                    xp  = fs.toQ(M{2}(:,p),n*3);
                                    xdd = fs.toQ(M{3}(:,dd),n*3);
                                    xde = fs.toQ(M{4}(:,de),n*3);
                                    xdf = fs.toQ(M{5}(:,df),n*3);                                    

                                     strx = (convertStringsToChars(libnames{h}(xm,xp,xdd,xde,xdf)));
                                        printx = '*';
                                        for ch=1:length(strx)
                                            printx = strcat(printx,strx(ch));
                                        end
                                        model_str = strcat(model_str,' ', string(koef(cnt,j)),' ', printx );
                                      end
                                  end
                              end
                          end
                        end
                      end
               end
                
            end
            assignin('base', 'model_str',model_str) ;
            model_str = strcat(model_str,';') ; 
%                model_str = strcat(simplify(str2sym(model_str)),';') ; 
           end

      end

      function str2 = toQ(p,n)
          if(p<=n/3)            
              str2= strcat('q',string(p));
          elseif (p<=n*2/3)
              px = p-n/3;
              str2= strcat('q',string(px),'d');
          else
             px = p-n*2/3;
              str2= strcat('q',string(px),'dd');
          end
                
      end
   end
end

