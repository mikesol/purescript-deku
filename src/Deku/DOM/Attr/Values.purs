module Deku.DOM.Attr.Values where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Values = Values

instance Attr Animate_ Values  String  where
  attr Values value = unsafeAttribute (  
    { key: "values", value: prop' value  } <$ _)
instance Attr Animate_ Values (Event.Event  String ) where
  attr Values eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "values", value: prop' value }


instance Attr AnimateMotion_ Values  String  where
  attr Values value = unsafeAttribute (  
    { key: "values", value: prop' value  } <$ _)
instance Attr AnimateMotion_ Values (Event.Event  String ) where
  attr Values eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "values", value: prop' value }


instance Attr AnimateTransform_ Values  String  where
  attr Values value = unsafeAttribute (  
    { key: "values", value: prop' value  } <$ _)
instance Attr AnimateTransform_ Values (Event.Event  String ) where
  attr Values eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "values", value: prop' value }


instance Attr FeColorMatrix_ Values  String  where
  attr Values value = unsafeAttribute (  
    { key: "values", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ Values (Event.Event  String ) where
  attr Values eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "values", value: prop' value }


instance Attr everything Values  Unit  where
  attr Values _ = unsafeAttribute (  { key: "values", value: unset'  } <$ _)
instance Attr everything Values (Event.Event  Unit ) where
  attr Values eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "values", value: unset' }
