### Payton Shaltis CSC-415-01
# Assignment 2 - Pantry Packer

## Installation and Usage Instructions
[Get started with Pantry Packer](./docs/pages/installation_and_usage.md)

## Open Source Maintenance and Communication Guidelines
[See how to contribute to this project.](./docs/pages/open_source_guidelines.md)

## Implemented Features
- Home Page: A basic informational home page with links to more important features, including
viewing requests and adding requests of your own.
- Request Searching / FIltering: A page dedicated to searching through the requests from all food
pantries. Search strings can be combined with item and request types to narrow the search.
- Full Account Management: Representatives of a pantry can create, edit, and delete the
information associated with their account. These changes will be reflected within the requests that
are viewed by potential donors. Deletion of an account also deletes all of the associated requests
with that pantry.
- Creating Requests: Once signed in as a pantry representative, you can create a new request to be
seen by visitors of the site. Give a unique name, item type, description, and even indicate if you
want to encourage or discourage the item specified.
- Viewing / Managing Requests: A tab specifically for pantry representatives; this is your one place
for viewing your own requests in greater detail. Update the information associated with each
request, and even close (delete) those that have been fulfilled

## Design Documents
The documents for Assignment 2-C can be found in the `docs` folder. Below are the links to the informational pages with the embeded diagrams:

- [Use Case Diagram](./docs/pages/use_case_diagram.md)
- [Use Case Descriptions](./docs/pages/use_case_descriptions.md)
- [Design Class Diagram](./docs/pages/class_diagram.md)
- [System Sequence Diagrams](./docs/pages/sequence_diagrams.md)
- [Statechart](./docs/pages/statechart.md)
- [User Interface Mockups](./docs/pages/ui_mockups.md)
- [Test Cases](./docs/pages/testing.md)

## What is Pantry Packer?
A single database and network for food pantries to indicate which food items they currently require or possess in excess, allowing users to tailor donations to specific locations.

## Social Issue Addressed:
I am looking to address the social issue of hunger.

## The Idea:
Typically, food pantries welcome food from anyone willing to donate. There are some cases, however, where specific food pantries may already have more than enough of a certain item or could really do with more of another type of item. For example, it is great that so any people donate canned goods, but suppose a food pantry is really looking for more fresh produce. Updating their personal websites every time a new food item is needed can be tedious, and prevents the public from being able to view the needs of many pantries at once.

Instead of having to deal with this hassle, pantries can contribute to Pantry Packer’s database, specifying the items that they would prefer to receive as donations as well as the items that they don’t need any more of. The general public could then look at the requests of many pantries at the same time in order to determine which location would suit their donations best.

For food pantries, my application would enable these organizations to specify exactly what kind of donations they are looking for. For the general public, my application would enable donors to tailor their donations to the right pantries, based on what they have to offer and what certain locations are looking for.