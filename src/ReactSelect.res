@decco
type countryOption = {
  label: string,
  value: string,
}

@decco type countryOptions = array<countryOption>

@as("ActionTypes")
type actionTypes =
  SELECT_OPTION | DESELECT_OPTION | REMOVE_VALUE | POP_VALUE | SET_VALUE | CLEAR | CREATE_OPTION

@as("ClassNamesState") type classNamesState = {key: bool}

type valuType<'countryOption, 'isMulti> = ('countryOption, 'isMulti)

type renderOptionProps = {
  cx: (~state: option<classNamesState>, ~className: option<string>) => string,
  getStyles: (~name: string, ~props: Js.Dict.t<string>) => unit,
  getValue: unit => option<countryOption>,
  hasValue: bool,
  isMulti: bool,
  isRtl: bool,
  options: countryOptions,
  selectOption: (~option: countryOption) => unit,
  setValue: (~value: valuType<countryOption, bool>, ~action: actionTypes) => unit,
  selectProps: Js.Dict.t<string>,
  theme: Js.Dict.t<string>,
  innerProps: Js.Dict.t<string>,
  data: Js.Dict.t<string>,
  isDisabled: bool,
  isSelected: bool,
  label: string,
  type_: string,
  value: string,
  innerRef: unit => unit,
  isFocused: bool,
  children: React.element,
  maxHeight: int,
}

type renderOption = renderOptionProps => React.element

type reactSelectComponents = {
  @as("Option") reactSelectRenderOption: renderOptionProps => React.element,
}

type menuListProps = {
  options: countryOptions,
  children: React.element,
  maxHeight: int,
  getValue: unit => option<array<countryOption>>,
}

type renderMenuList = menuListProps => React.element

type components = {
  @as("Option") renderOption: renderOption,
  @as("MenuList") renderMenuList: renderMenuList,
}

@module("react-select") external reactSelectComponents: reactSelectComponents = "components"

@module("react-select") @react.component
external make: (
  ~options: countryOptions,
  ~value: countryOption=?,
  ~onChange: option<countryOption> => unit,
  ~components: components,
  ~className: option<string>=?,
) => React.element = "default"
