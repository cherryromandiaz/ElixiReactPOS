# ElixiReactPOS
Point of Sales Application Using Elixir and Phoenix as Backend, React JS as Frontend with Typescript and PostgreSQL for Database

**Backend: Elixir and Phoenix**

1. Set up a Phoenix project:

`mix phx.new pos_app --database postgres`

`cd pos_app`

`mix ecto.create`

2. Setup authentication: Use Guardian for JWT authentication.
  
Add Guardian to your mix dependencies in mix.exs

Configure Guardian in config/config.exs:

3. Add Guardian to your endpoint and create a pipeline for authentication:

in endpoint.ex

`plug Guardian.Plug.Pipeline, module: PosApp.Guardian, error_handler: PosApp.AuthErrorHandler`

in router.ex

`pipeline :auth do`

  `plug Guardian.Plug.VerifyHeader`
  
  `plug Guardian.Plug.LoadResource`
  
`end`

**Frontend: React with TypeScript**
1. Set up a new React project:

`npx create-react-app pos-app-frontend --template typescript`

`cd pos-app-frontend`

2. Install necessary dependencies:

`npm install axios react-router-dom @reduxjs/toolkit react-redux`

3. Create a folder structure for components, pages, services, and store:

src/

├── components/

├── pages/

├── services/

├── store/

└── App.tsx

4. Setup Axios for API calls

5. Create Redux slices for state management

6. Create components and pages












