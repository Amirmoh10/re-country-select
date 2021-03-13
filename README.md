CountrySelect is a component that fetches countries and renders select element with these countries and their flags.

👉🏻 [Live demo link](https://noon-task.vercel.app/)

## Running the project:

1. Install the dependencies

```
npm install
```

2. Run ReScript compilation in watch mode:

```
npm run start:res
```

3. Start the project in watch mode:

```
npm start:react
```

## Features

- Fetches countries in run-time
- Predictable: shows an error if there's an error fetching or parsing countries data
- Countries are shown in a select component with their flags
- Supports case-insentitive search by country name or code
- Fast: select renders only visible countries (virtualization)
- Supports keyboard (user can open, navigate and select options with keyboard)
- react-select and react-window bindings are written from scratch

## Dependencies used

- [react-select](https://github.com/JedWatson/react-select/)
- [react-window](https://github.com/bvaughn/react-window#:~:text=react%2Dwindow%20is%20a%20complete%20rewrite%20of%20react%2Dvirtualized%20.&text=If%20react%2Dwindow%20provides%20the,Use%20react%2Dvirtualized%20.) for virtualization
- [flag-icon-css](https://github.com/lipis/flag-icon-css) for country flags
- [decco](https://github.com/reasonml-labs/decco)
- [bs-fetch](https://github.com/reasonml-community/bs-fetch)
