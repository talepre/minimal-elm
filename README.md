# Minimal Elm
This repo is used to show how to create a minimal Elm app and start developing with Elm. It was created as a demo for the Elm Guild in Knowit Solutions.

## The beginning
From https://guide.elm-lang.org/architecture/

The Elm Architecture consists of three parts:

Model — the state of your application
Update — a way to update your state
View — a way to view your state as HTML

### Installing Elm
You will have to install Elm if you want to code locally. Or you could use Ellie (https://ellie-app.com/)

### Install Plugins for your editor
I chose Atom because the first guide I used recommended it. I like it, so I haven't tried anything else. It is pretty neat though.


## Code

### Beginner Program
In src/HelloElmBeginnerProgram/HelloElm.elm there is a beginner program that follows the Elm Architecture. It has model, view and update, and it sets the initial model to be "Hello Elm!".

### Program (without flags)
In src/HelloElm/HelloElm.elm there is the exact same program, but created with a regular program, not a beginner program. The difference is in the main function, and we can see that here it has added subscriptions, and has changed the model from the beginner program to something called init. The init takes in both a Model and a Cmd Msg. The subscriptions are set to Sub.none.  


### What I´m going to do in the experimenting code

1. Say hello to a given person.
2. Say hello Mr/Mrs. depending on sex.
3. Change name
4. Have multiple people (Removing the save name, because we do not know which person to save the name to)

Other things you can do:
5. Create a new person
6. Add and show age of people
7. Whatever you can imagine

### What I always do:

1. Change the model first
2. Add things to the view
3. Fix msgs/updates
4. Let the compiler guide you
