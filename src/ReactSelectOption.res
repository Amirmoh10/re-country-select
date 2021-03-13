@react.component
let make = (~optionProps: ReactSelect.renderOptionProps, ~scrollIntoItem) => {
  React.useEffect2(() => {
    if optionProps.isFocused {
      scrollIntoItem(optionProps.value)
    }

    None
  }, (optionProps.value, optionProps.isFocused))
  let children =
    <div className="option">
      <span className={`flag-icon flag-icon-${optionProps.value}`} />
      {React.string(" ")}
      <span> {React.string(optionProps.label)} </span>
    </div>

  ReactSelect.reactSelectComponents.reactSelectRenderOption({
    ...optionProps,
    children: children,
  })
}
