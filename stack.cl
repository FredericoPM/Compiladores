class Main inherits IO{
	n:Int;
    head:Element;
    temp:Element;
    temp2:Element;
    tempstr:String;
	main():Object{{
        n<-0;
        flag: Bool<-true;
        converter: A2I <-new A2I;
        input: string;
        stackTop:String;
        top1:String;
        top2:String;
        while flag loop {
            out_string(">");
            input<-in_string();
            if 
                input ="x" then {flag<-false;}
            else if input="e" then {
                stackTop<-popstack();
                if stackTop="+" then
                    top1<-popstack();
                    top2<-popstack();
                    pushstack(converter.i2c(converter.c2i(top1)+converter.c2i(top2)));
                else if stackTop="s" then {
                    top1<-popstack();
                    top2<-popstack();
                    pushstack(top1);
                    pushstack(top2);
                }else
                    pushstack(stackTop)   				
                fi fi;
            }else if input="d" then
                printstack() 
            else 
                pushstack(input)
            fi fi fi;
        }pool;
	}};

    pushstack(input:String):Object{{
        n<-n+1;
	    temp<-new Element;
        temp.init(input);
        if n=1 then 
            head<-temp 
        else{
            temp.addthis(head);
            head<-temp;
        }
        fi;
    }};

    popstack():String{{
        n<-n-1;
        tempstr<-head.getelem();
        head<-head.getnext();
        tempstr;
    }};

    
	printstack():Object{{
		temp2<-head;
		while not isvoid temp2 loop {
            out_string(temp2.getelem());out_string("\n");
            temp2<-temp2.getnext();
        }pool;
	}};


};
