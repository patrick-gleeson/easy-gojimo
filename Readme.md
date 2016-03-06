#Easy Gojimo Angular
A solution to the EasyPeasyApp/Gojimo challenge, i.e. to complete the Gojimo challenge using both Rails and a front-end framework.

##The challenge
Develop a very simple working application on your chosen platform (Android / iOS / Web) with the following functionality:

1. Read the following JSON feed containing a list of qualifications (a sample is presented below for your reference): https://api.gojimo.net/api/v4/qualifications
2. Display a list of qualifications based on the data provided by the feed.
3. Allow users to click a qualification to be presented with a list of subjects for that qualification.

```ruby
{
  id: "d45945e4-b724-48ab-9f99-21e61f1648ad",
  name: "11+ Common Entrance",
  subjects: [
    {
      id: "ef319206-aa64-41f5-ac67-17a4fb8d10f6",
      title: "English",
      link: "/api/v4/subjects/ef319206-aa64-41f5-ac67-17a4fb8d10f6",
      colour: "#ECF7E2"
    }],
  default_products: [ ],
  created_at: "2014-04-12T10:06:33.000Z",
  updated_at: "2014-04-12T10:06:33.000Z",
  link: "/api/v4/qualifications/d45945e4-b724-48ab-9f99-21e61f1648ad"
}
```

###Bonus points

Whilst not essential, we will be very pleased to see you take the challenge further by:

i. Using the data provided to its full potential by taking advantage of fields like colour for subjects.

ii. Making the GUI as appealing and responsive as possible.

iii. Storing the data locally and refresh from the server as requested, taking advantage of the HTTP headers to avoid downloads of non-stale data.

iv. Unit testing your code.

## Tests
### Javascript unit tests
```bash
npm install
npm run test-single-run
```
### Ruby unit tests and Ruby/JS integration tests
```bash
bundle install
bundle exec rspec
```

