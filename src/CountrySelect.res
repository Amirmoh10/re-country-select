%%raw(`import './Select.css'`)
%%raw(`import 'flag-icon-css/css/flag-icon.min.css'`)

type countries = array<ReactSelect.countryOption>

let apiURL = "https://gist.githubusercontent.com/rusty-key/659db3f4566df459bd59c8a53dc9f71f/raw/4127f9550ef063121c564025f6d27dceeb279623/counties.json"

@react.component
let make = (
  ~selectedCountryValue: option<string>=?,
  ~onChange,
  ~onError,
  ~className: option<string>=?,
) => {
  let (countries: countries, setCountries) = React.useState(_ => [])
  let listRef = React.useRef(Js.Nullable.null)

  let countryOption = switch selectedCountryValue {
  | None => None
  | Some(selectedCountryValue) =>
    Js.Array.find(
      (country: ReactSelect.countryOption) => country.value == selectedCountryValue,
      countries,
    )
  }

  let scrollIntoItem = item => {
    let index = Js.Array.findIndex(
      (country: ReactSelect.countryOption) => country.value == item,
      countries,
    )

    listRef.current
    ->Js.Nullable.toOption
    ->Belt.Option.forEach((listEl: VirtualizedList.listEl) => listEl.scrollToItem(. index))
  }

  React.useEffect0(() => {
    let _ =
      Fetch.fetch(apiURL)->Js.Promise.then_(Fetch.Response.json, _)->Js.Promise.then_(arrOfData => {
        switch ReactSelect.countryOptions_decode(arrOfData) {
        | Ok(data) => setCountries(_ => data)
        | Error(_) => onError()
        }

        Js.Promise.resolve()
      }, _)->Js.Promise.catch(_ => {
        onError()
        Js.Promise.resolve()
      }, _)

    None
  })

  let getSelectedIndex = (selectedValues: array<ReactSelect.countryOption>) => {
    switch selectedValues {
    | [] => 0
    | selectedValues => {
        let selectedValue = selectedValues[0]
        Js.Array.findIndex(
          (country: ReactSelect.countryOption) => country.value == selectedValue.value,
          countries,
        )
      }
    }
  }

  let renderOption = optionProps => {
    <ReactSelectOption optionProps scrollIntoItem />
  }

  let renderMenuList = menuProps => {
    <ReactSelectMenu menuProps listRef getSelectedIndex />
  }

  <ReactSelect
    ?className
    components={{renderOption: renderOption, renderMenuList: renderMenuList}}
    options=countries
    value=?countryOption
    onChange={country => {
      let countryCode = switch country {
      | Some(country) => Some(country.value)
      | None => None
      }
      onChange(countryCode)
    }}
  />
}
