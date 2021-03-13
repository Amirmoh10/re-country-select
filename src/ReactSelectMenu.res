let height = 35

@react.component
let make = (~menuProps: ReactSelect.menuListProps, ~listRef, ~getSelectedIndex) => {
  let selectedValues = menuProps.getValue()
  let initialIndex = selectedValues->Belt.Option.mapWithDefault(0, getSelectedIndex)
  let initialScrollOffset = initialIndex * height
  let itemCount = React.Children.count(menuProps.children)
  let childrenArray = React.Children.toArray(menuProps.children)
  <VirtualizedList
    height=menuProps.maxHeight itemCount itemSize=height initialScrollOffset ref={listRef}>
    {props => <div style={props.style}> {childrenArray[props.index]} </div>}
  </VirtualizedList>
}
