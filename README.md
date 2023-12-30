
# Bund Flutter Task

An app for creating investment accounts


## API Reference

#### Get Companies

```http
  POST / https://httpbin.org/anything
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `list<Company>` | response with the same data |

#### returns list of Companies

Takes 4 Companies and returns the same.

#### Get Bonds

```http
  POST / https://httpbin.org/anything
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `list<Bond>` | response with the same data |

#### returns list of Bonds

Takes 4 Bonds and returns the same.

## Features

- save the last investment cash on the device
- swap between our investment types
- animations when swaping
- investment calculator
- some user experience with vibration
- Mock Api Integration
- pull to refresh
- UI design as it in Figma file
- portrait mode
- Cross platform

## Packages

- dio (for mock api integration)
- crausal Slider (for swaping between our investment accounts)
- shared preferences (for save the last user investment number)
- vibration (for vibrate when the user hold on the button)


## 🚀 About Me
I'm a flutter developer , I graduated from faculty of computer science Helwan university


## Running Tests

There is in the app I have written Integration and functional tests on main features in the app like Api Integration and also the calculation
## Used By

- Bünd
