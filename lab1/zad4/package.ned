simple Source
{
    parameters:
        volatile double interarrival_time;       
									 					  
    gates:
        output out;
}


//////////////////////////////////////////////////
simple Server
{
    parameters:
        volatile double service_time;           
        volatile int queue_max_size;   
        volatile double mi; 
        volatile double lambda;   
        volatile string file_name;   
        volatile string name;  
    gates:
        input in[];
        output out;
}


//////////////////////////////////////////////////
simple Sink
{
    parameters:
        volatile string file_name;   
    gates:
        input in;
}


//////////////////////////////////////////////////
module GG1
{
	parameters:
	
    submodules:
         source1: Source {
            parameters:
                @display("i=block/source");
        }
        source2: Source {
            parameters:
                @display("i=block/source");
        }
        server1: Server {
            parameters:
                @display("i=block/queue");
        }
        server2: Server {
            parameters:
                @display("i=block/queue");
        }
        sink: Sink {
            parameters:
                @display("i=block/sink");
        }
    connections:
        source1.out --> {  } --> server1.in++;
        source2.out --> {  } --> server1.in++;

        server1.out --> {  } --> server2.in++;
        server2.out --> {  } --> sink.in;
}

//////////////////////////////////////////////////
network gg1 extends GG1
{
    parameters:
}
