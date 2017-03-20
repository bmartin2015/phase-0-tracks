#9.1 How the Web Works
##Release 1: Research Web Servers

1. What are some of the key design philosophies of the Linux operating system?
    * A - It is predominantly open source - allowing anyone to work on improving the OS. This also means that it is lacks the formal, organized development process that Microsoft or Apple have for Windows and Mac OS. There are still conventions that govern the review, debugging, and release of Linux operation systems. Some of these tenets of design include keeping programs small and portable so that they can be easily distributed across the different hardware. And that programs should do one thing very well, rather than try to do everything.

2. In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?
    * A - A VPS is basically away to use software to replicate a physical server. It has it's own memory, storage, processing power, and bandwidth. It is not identical to a physical server because it still shares all of that hardware with other VPS and could be impacted by issues with those VPS. A major advantage of VPS is that it runs it's own copy of the OS. A shared hosting server might have dedicate resources, but is on the same overall OS as other users, so you do not have full control over it. With VPS you are likely to have full control over the OS and can configure and make changes similar to a physical server.
    * 
3. Optional bonus question: Why is it considered a bad idea to run programs as the root user on a Linux system?
    * A - The root user has full administrative access to everything in the OS. If you run an application under root, it also provides that level of access to the application, which could allow a security issue to become much worse than it might otherwise be. Running in root also means that it is easier to mess up... rm -rf / will not work as a user, but as root it will remove your OS. 