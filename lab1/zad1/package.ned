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
    gates:
        input in;
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
        source: Source {
            parameters:
                @display("i=block/source");
        }
        server: Server {
            parameters:
                @display("i=block/queue");
        }
        sink: Sink {
            parameters:
                @display("i=block/sink");
        }
    connections:
        source.out --> {  } --> server.in;
        server.out --> {  } --> sink.in;
}

//////////////////////////////////////////////////
network gg1 extends GG1
{
    parameters:
}
