# EdTech Platform

**Tech Stack**

- Ruby on Rails version **7.1.3** or above.
- [Ruby](https://www.ruby-lang.org/en/downloads/) version **3.3.1** or above.

----------

**Running tests**

We are using [Rspec](https://rspec.info/) to perform and write the tests.
`bin/rails spec`

----------
**Running locally**

- To run this project in localhost, do the following:
  - `bundle install`
  - `bin/rails db:setup`
  - `bin/dev`
- To seed the database run `bin/rails db:seed`

----------
**Sample API requests**

#### Create Courses with Tutors

```
localhost:3000/api/v1/courses
```
This POST API will help you create your courses along with the tutors of each course.

```json
{
  "course": {
    "title": "Ruby Course",
    "description": "This is my first course!",
    "price": 10000,
    "start_date": "22/06/2024",
    "end_date": "30/12/2024",
    "level": "beginner",
    "category": "design",
    "staus": "live",
    "tutors_attributes": [
      {
        "name": "Tutor 1",
        "email": "tutor1@email.com"
      },
      {
        "name": "Tutor 2",
        "email": "tutor2@email.com"
      }
    ]
  }
}
```

#### Get Courses with Tutors

```
localhost:3000/api/v1/courses?page=1&per_page=20
```
This GET API will help you fetch courses along with their associated tutors.
