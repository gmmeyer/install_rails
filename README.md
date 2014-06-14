# Install Rails
[![Build Status](https://travis-ci.org/onemonth/install_rails.png?branch=master)](https://travis-ci.org/onemonth/install_rails)

## What is Install Rails?

Install Rails is a step by step "choose your own adventure" style guide for installing rails on your computer.  

It is built like a tree. Each step is like a node, and the links between each step are the edges of the tree. The steps contain the content and also contain the ability to ask the edges which one of them to follow to the next step.  The content is created on an admin side of the app (access is controlled by cancancan) and the content is sanitized prior to input into the database.

It is the edges themselves that contain the decision logic. They contain relatively minimal logic. But, they either know whether to ask the user if there is a previous choice that the user made, which is known to the user class already (the only one that is currently like this, because it is the only one that is persistent through the entire adventure  of installing rails) is the choice of the operating system.

When there is a choice between various steps and the choice does not persist in the database, the logic for what choice is displayed is contained within the step. However, the edge contains how the choice itself is displayed. If there is supposed to be some kind of text for the buttons, what that text is is contained within the edge.

## Recent Changes
  * MongoDB has been replaced by postgresql
  * The dynamic generate

## To Do

* Increase test coverage
* Remove all of the old steps
* JS and CSS up the admin pages so that they are much easier and nicer to use.
* Images should be handled by AWS.