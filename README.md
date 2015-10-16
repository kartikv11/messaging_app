==Slack-like messaging app for teams, which consist of 1-1 messaging, private groups & public forums.

*DESIGN : 

1. A user can see the list of all public channels, along with private groups and his team members (consider all members joined the app are his team members, no team specific division).
2. On clicking on each channel/group/individual, all of its messages (along with senders) should be displayed.
3. A user can there itself send the message to that channel/group/individual.

*IMPLEMENTATION:

1. Models, its controllers and actions are in RAILS (using M and C architecture). Designed architecture in terms of API (without versioning) which takes request from front-hand and return appropriate responses. All actions to return response in following json format:

json : { 

    message: {},

    error: {}

},

status_code : {}


*TO-DO:

1.Authentication mechanism in backed (through verified email address and password) and hence user can see only his private groups.
2. To design front-hand views using emberjs(preferably), which will call the above designed APIs and render content. (Try not to use Rails Views)
