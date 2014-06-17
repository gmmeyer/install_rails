# Install Rails
[![Build Status](https://travis-ci.org/onemonth/install_rails.png?branch=master)](https://travis-ci.org/onemonth/install_rails)

## What is Install Rails?

Install Rails is a step by step "choose your own adventure" style guide for installing rails on your computer.  

It is built like a tree. Each step is like a node, and the links between each step are the edges of the tree. The steps contain the content and also contain the ability to ask the edges which one of them to follow to the next step.  The content is created on an admin side of the app (access is controlled by cancancan) and the content is sanitized prior to input into the database.

It is the edges themselves that contain the decision logic. They contain relatively minimal logic. But, they either know whether to ask the user if there is a previous choice that the user made, which is known to the user class already (the only one that is currently like this, because it is the only one that is persistent through the entire adventure  of installing rails) is the choice of the operating system.

When there is a choice between various steps and the choice does not persist in the database, the logic for what choice is displayed is contained within the step. However, the edge contains how the choice itself is displayed. If there is supposed to be some kind of text for the buttons, what that text is is contained within the edge.

The admin side of the app, accessed at /admin, is organized with Can Can Can. It uses the same styling as the other side. However, it is not exactly the same as it in a lot of ways. (For instance, the html is rendered on the page, it is not made html safe.) There is still some work that needs to be done on this, but the brunt of it is done.

Things that need to be done, still for this:
* Edges need to be able to be edited, they are not able to be edited yet. They also need to be able to be deleted.
* the redirection in the controllers needs to be fixed.

Otherwise, it's basically done.

## Recent Changes
  * MongoDB has been replaced by postgresql
  * The dynamic generate

## To Do

* Increase test coverage
  * No matter how good you are, there is always something you miss with test coverage. This app needs more.
* Remove all of the old steps
* JS and CSS up the admin pages so that they are much easier and nicer to use.
* Images should be handled by AWS.
* Images need to be added through the admin section manually. Just the Url needs to be changed. There is an images page that is available to allow you to see all of the image assets along with their links at /images.
