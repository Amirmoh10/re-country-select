%%raw(`import './index.css'`)

@react.component
let make = () => {
  let (selectedCountryValue: option<string>, setSelectedCountryValue) = React.useState(_ => None)
  let (isError: bool, setIsError) = React.useState(_ => false)
  let onChange = newSelectedCountryValue => {
    setSelectedCountryValue(_ => newSelectedCountryValue)
  }

  <div className="app">
    <h3> {React.string("CountrySelect Demo")} </h3>
    {switch isError {
    | true =>
      <div className="errorMessage">
        {React.string("Error: failed fetching or parsing countries data")}
      </div>
    | false =>
      <CountrySelect
        selectedCountryValue=?{selectedCountryValue}
        onChange={onChange}
        onError={() => setIsError(_ => true)}
      />
    }}
  </div>
}
