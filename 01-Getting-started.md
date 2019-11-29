# what it's good for
## real-time communication
phoenix has the concept of channels built in   
channels allow for "soft-realtime" features to be easily implemented.   
what can you do with it?   
any time you want to push information to many users simultaneously - you need to kepp each client up to date (chat apps, auction sites, workplace collaboration, gameservers)   
this is vs. a traditional pull (it's push!)   

## efficiency
when creating channals, phoenix spawns a process for each channel, so that they are isolated

## low-cost scaling
elixir utilizes all CPU cores and uses a relatively small amount of RAM

# what it's not good for
## time to productivity
learning new things costs time. how to justify when you're already productive in another language and framework?

## number crunching
elixir will never match the computational speed of sth like C or C++

## deployment
deploying an elixir application is pretty tricky and invloves multiple steps, steps that are still not clearly defined and that don't have mature tools to help with.