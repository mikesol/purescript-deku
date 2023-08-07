module Deku.DOM.Attr.Preload where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Preload = Preload

instance Attr Audio_ Preload  String  where
  attr Preload value = unsafeAttribute (  
    { key: "preload", value: prop' value  } <$ _)
instance Attr Audio_ Preload (Event.Event  String ) where
  attr Preload eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "preload", value: prop' value }


instance Attr Video_ Preload  String  where
  attr Preload value = unsafeAttribute (  
    { key: "preload", value: prop' value  } <$ _)
instance Attr Video_ Preload (Event.Event  String ) where
  attr Preload eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "preload", value: prop' value }


instance Attr everything Preload  Unit  where
  attr Preload _ = unsafeAttribute (  { key: "preload", value: unset'  } <$ _)
instance Attr everything Preload (Event.Event  Unit ) where
  attr Preload eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "preload", value: unset' }
